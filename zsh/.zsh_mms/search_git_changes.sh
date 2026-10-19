#!/usr/bin/env bash
set -o pipefail

if [ "$#" -ne 1 ] || [ -z "$1" ]; then
  echo "This script to search using 'git diff' and write the differences:">&2
  echo ""
  echo "Usage: $0 <text>" >&2
  exit 2
fi

search_text=$1

if ! repo_root=$(git rev-parse --show-toplevel 2>/dev/null); then
  echo "Error: run this script inside a Git repository." >&2
  exit 2
fi

cd "$repo_root" || exit 2

green=''
red=''
reset=''
if [ -t 1 ] && [ -z "${NO_COLOR:-}" ] && [ "${TERM:-}" != "dumb" ]; then
  green=$(printf '\033[32m')
  red=$(printf '\033[31m')
  reset=$(printf '\033[0m')
fi

found=0

if git -c core.quotePath=false diff --no-ext-diff --no-color --unified=0 HEAD -- |
  SEARCH_TEXT="$search_text" GREEN="$green" RED="$red" RESET="$reset" awk '
    BEGIN { search_text = tolower(ENVIRON["SEARCH_TEXT"]) }
    /^diff --git / { path = ""; next }
    /^\+\+\+ b\// { path = substr($0, 7); next }
    /^--- a\// && path == "" { path = substr($0, 7); next }
    /^@@ / {
      hunk = $0
      sub(/^@@ -/, "", hunk)
      split(hunk, ranges, " +")
      split(ranges[1], old_range, ",")
      split(ranges[2], new_range, ",")
      old_line = old_range[1] + 0
      new_line = new_range[1] + 0
      next
    }
    /^\+/ && !/^\+\+\+/ {
      if (index(tolower(substr($0, 2)), search_text)) {
        line = substr($0, 2)
        sub(/^\.[[:space:]]+/, "", line)
        sub(/^[[:space:]]+/, "", line)
        printf "%s:%d\n  %s+ %s%s\n", path, new_line, ENVIRON["GREEN"], line, ENVIRON["RESET"]
        found = 1
      }
      new_line++
      next
    }
    /^-/ && !/^---/ {
      if (index(tolower(substr($0, 2)), search_text)) {
        line = substr($0, 2)
        sub(/^\.[[:space:]]+/, "", line)
        sub(/^[[:space:]]+/, "", line)
        printf "%s:%d\n  %s- %s%s\n", path, old_line, ENVIRON["RED"], line, ENVIRON["RESET"]
        found = 1
      }
      old_line++
    }
    END { exit !found }
  '
then
  found=1
fi

while IFS= read -r -d '' file; do
  if SEARCH_TEXT="$search_text" FILE_PATH="$file" GREEN="$green" RESET="$reset" awk '
    BEGIN { search_text = tolower(ENVIRON["SEARCH_TEXT"]) }
    index(tolower($0), search_text) {
      line = $0
      sub(/^\.[[:space:]]+/, "", line)
      sub(/^[[:space:]]+/, "", line)
      printf "%s:%d\n  %s+ %s%s\n", ENVIRON["FILE_PATH"], FNR, ENVIRON["GREEN"], line, ENVIRON["RESET"]
      found = 1
    }
    END { exit !found }
  ' "$file"
  then
    found=1
  fi
done < <(git ls-files --others --exclude-standard -z)

if [ "$found" -eq 0 ]; then
  echo "No matches found in Git changes." >&2
  exit 1
fi
