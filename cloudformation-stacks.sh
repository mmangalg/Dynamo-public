#!/bin/bash -xe

StackName="DynamoDBStack-${EnvironmentName}"

aws cloudformation deploy --stack-name $StackName --template-body file://dynamo-cf-template.yaml --region $Region  \
--parameter-overrides PrimaryKeyName=$PrimaryKeyName PrimaryKeyType=$PrimaryKeyType EnvironmentName=$EnvironmentName Region=$Region
