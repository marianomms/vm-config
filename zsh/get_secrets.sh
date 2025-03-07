printf 'Pulling secrets...\n'
aws ssm get-parameter --name development.secrets --with-decryption --query "Parameter.Value" --output text > .secrets
exit_status=$?
if [ $exit_status -eq 0 ];
then
  printf "Secrets pulled.\n"
  if [ -f ".secrets" ]; then
    export $(grep -v '^#' .secrets | xargs -d '\n')
  fi
  exec zsh
else
  printf 'Login in aws first by running "aws sso login".'
  exit $exit_status
fi
