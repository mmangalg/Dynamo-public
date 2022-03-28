#!/bin/bash -xe


StackName="DynamoDBStack-${EnvironmentName}"

aws cloudformation wait  stack-exists --stack-name $StackName --region $Region

if [ $? -eq 0 ]
then
          aws cloudformation create-change-set     --stack-name DynamoDBStack-Staging     --change-set-name my-change-set  \
              --template-body file://test.yaml --region us-west-2  --parameters ParameterKey=PrimaryKeyName,ParameterValue=Name   \
                ParameterKey=PrimaryKeyType,ParameterValue=S ParameterKey=EnvironmentName,ParameterValue=Staging ParameterKey=Region,ParameterValue=us-west-2 --change-set-type UPDATE

          aws cloudformation update-stack --stack-name $StackName --template-body file://dynamo-cf-template.tf --region $Region \
           --parameters ParameterKey=PrimaryKeyName,ParameterValue=$PrimaryKeyName \
            ParameterKey=PrimaryKeyType,ParameterValue=$PrimaryKeyType ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName \
            ParameterKey=Region,ParameterValue=$Region

else

          aws cloudformation create-change-set     --stack-name DynamoDBStack-Staging     --change-set-name my-change-set  \
              --template-body file://test.yaml --region us-west-2  --parameters ParameterKey=PrimaryKeyName,ParameterValue=Name   \
              ParameterKey=PrimaryKeyType,ParameterValue=S ParameterKey=EnvironmentName,ParameterValue=Staging ParameterKey=Region,ParameterValue=us-west-2 --change-set-type UPDATE

          aws cloudformation create-stack --stack-name $StackName --template-body file://dynamo-cf-template.tf --region $Region \
            --parameters ParameterKey=PrimaryKeyName,ParameterValue=$PrimaryKeyName \
             ParameterKey=PrimaryKeyType,ParameterValue=$PrimaryKeyType ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName\
             ParameterKey=Region,ParameterValue=$Region
fi 
