#!/bin/bash -xe

StackName="DynamoDBStack-${EnvironmentName}"

aws cloudformation deploy --stack-name $StackName --template-body file://dynamo-cf-template.yaml --region $Region  \
--parameters ParameterKey=PrimaryKeyName,ParameterValue=$PrimaryKeyName \
  ParameterKey=PrimaryKeyType,ParameterValue=$PrimaryKeyType ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName  \
  ParameterKey=Region,ParameterValue=$Region

