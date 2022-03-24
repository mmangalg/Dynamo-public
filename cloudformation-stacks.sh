#!/bin/bash

aws cloudformation wait  stack-exists --stack-name $STACK_NAME

if [$? -eq 0]
then
          aws cloudformation update-stack --stack-name $STACK_NAME --template-body file://dynamo-cf-template.tf \
             --parameters ParameterKey=HashKeyElementName,ParameterValue=$HashKeyElementName \
             ParameterKey=HashKeyElementType,ParameterValue=$HashKeyElementType ParameterKey=ReadCapacityUnits,ParameterValue=$ReadCapacityUnits \
             ParameterKey=WriteCapacityUnits,ParameterValue=$WriteCapacityUnits --region us-east-2

else
          aws cloudformation create-stack --stack-name $STACK_NAME --template-body file://dynamo-cf-template.tf \
             --parameters ParameterKey=HashKeyElementName,ParameterValue=$HashKeyElementName \
             ParameterKey=HashKeyElementType,ParameterValue=$HashKeyElementType ParameterKey=ReadCapacityUnits,ParameterValue=$ReadCapacityUnits \
             ParameterKey=WriteCapacityUnits,ParameterValue=$WriteCapacityUnits --region us-east-2
fi 
