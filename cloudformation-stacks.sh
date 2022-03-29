#!/bin/bash -xe

StackName="DynamoDBStack-${EnvironmentName}"

aws cloudformation deploy --stack-name $StackName --template-file dynamo-cf-template.yaml --region $Region  \
--parameter-overrides PrimaryKeyName=$PrimaryKeyName PrimaryKeyType=$PrimaryKeyType EnvironmentName=$EnvironmentName Region=$Region
