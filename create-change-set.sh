#!/bin/bash


StackName="DynamoDBStack-${EnvironmentName}"

aws cloudformation wait  stack-exists --stack-name $StackName --region $Region

if [ $? -eq 0 ]
then
          echo "creating change set for existing stack "
          OUT=$(aws cloudformation create-change-set     --stack-name $StackName     --change-set-name my-change-set  \
              --template-body file://dynamo-cf-template.yaml --region $Region  --parameters ParameterKey=PrimaryKeyName,ParameterValue=$PrimaryKeyName   \
                ParameterKey=PrimaryKeyType,ParameterValue=$PrimaryKeyType ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName ParameterKey=Region,ParameterValue=$Region --change-set-type UPDATE)
          ARN=$(echo $OUT | jq -r '.Id')
          sleep 15
          aws cloudformation execute-change-set --change-set-name $ARN --region $Region


else
      
          echo "creating change set for new stack"
          OUT=$(aws cloudformation create-change-set     --stack-name $StackName     --change-set-name my-change-set  \
              --template-body file://dynamo-cf-template.yaml --region $Region  --parameters ParameterKey=PrimaryKeyName,ParameterValue=$PrimaryKeyName   \
              ParameterKey=PrimaryKeyType,ParameterValue=$PrimaryKeyType ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName ParameterKey=Region,ParameterValue=$Region --change-set-type CREATE)
          ARN=$(echo $OUT | jq -r '.Id')
          sleep 15
          aws cloudformation execute-change-set --change-set-name $ARN --region $Region

fi 

