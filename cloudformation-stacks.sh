#!/bin/bash


StackName="DynamoDBStack-${EnvironmentName}"

aws cloudformation wait  stack-exists --stack-name $StackName --region $Region

if [ $? -eq 0 ]
then
          aws cloudformation update-stack --stack-name $StackName --template-body file://dynamo-cf-template.tf --region $Region \
           --parameters ParameterKey=HashKeyElementName,ParameterValue=$HashKeyElementName \
            ParameterKey=HashKeyElementType,ParameterValue=$HashKeyElementType ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName \
            ParameterKey=Region,ParameterValue=$Region

else
          aws cloudformation create-stack --stack-name $StackName --template-body file://dynamo-cf-template.tf --region $Region \
            --parameters ParameterKey=HashKeyElementName,ParameterValue=$HashKeyElementName \
             ParameterKey=HashKeyElementType,ParameterValue=$HashKeyElementType ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName\
             ParameterKey=Region,ParameterValue=$Region
fi 
