#!/bin/bash
#
# This is a small utility scrip that tests the validate of your CloudFormation
# JSON files. It requires the aws cli, which you probably can install using your
# computer's package manager (apt, yum, brew, ...)
#
# You also need to have configured your AWS credentals, currently they go in the
# file $HOME/.aws/credentials
#
# An example config file looks like this:
#
# [default]
# aws_access_key_id = XXX
# aws_secret_access_key = YYY

FAILED=0
REGION=eu-west-1

templates=( $(find . -type f -name "*.json") )

for template in "${templates[@]}"
do
  aws cloudformation validate-template --template-body file://$template --region $REGION > /dev/null

  if [ $? -eq 0 ]
  then
    echo "Successfully validated template: $template"
  else
    echo "Could not validate template: $template" >&2
    FAILED=1
  fi
done

exit $FAILED
