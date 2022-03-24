#!/bin/bash

aws cloudformation wait  stack-exists --stack-name DynamoDB --region us-east-2

if [ $? -eq 0 ]
then
          aws cloudformation update-stack --stack-name DynamoDB --template-body file://dynamo-cf-template.tf --region us-east-2
           #  --parameters ParameterKey=HashKeyElementName,ParameterValue=$HashKeyElementName \
           # ParameterKey=HashKeyElementType,ParameterValue=$HashKeyElementType ParameterKey=ReadCapacityUnits,ParameterValue=$ReadCapacityUnits \
           #  ParameterKey=WriteCapacityUnits,ParameterValue=$WriteCapacityUnits --region us-east-2

else
          aws cloudformation create-stack --stack-name DynamoDB --template-body file://dynamo-cf-template.tf --region us-east-2
            # --parameters ParameterKey=HashKeyElementName,ParameterValue=$HashKeyElementName \
            # ParameterKey=HashKeyElementType,ParameterValue=$HashKeyElementType ParameterKey=ReadCapacityUnits,ParameterValue=$ReadCapacityUnits \
            # ParameterKey=WriteCapacityUnits,ParameterValue=$WriteCapacityUnits --region us-east-2
fi 
