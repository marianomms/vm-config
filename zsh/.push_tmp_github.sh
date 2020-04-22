#!/bin/bash
date=`date +%y%m%d%H%M%S`
target_branch="mms-tmp-${date}"
current_branch=`git rev-parse --abbrev-ref HEAD`

echo "Pushing current changes in a temp branch: $target_branch"
git add .
git commit -m"wip"
git push origin $current_branch:$target_branch
