#!/bin/bash

aws cloudformation create-stack --stack-name myteststack3 --template-body file://dynamo-cf-template.tf \
--parameters ParameterKey=HashKeyElementName,ParameterValue=$HashKeyElementName \
             ParameterKey=HashKeyElementType,ParameterValue=$HashKeyElementType ParameterKey=ReadCapacityUnits,ParameterValue=$ReadCapacityUnits \
             ParameterKey=WriteCapacityUnits,ParameterValue=$WriteCapacityUnits --region us-east-2
