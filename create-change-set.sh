#!/bin/bash


StackName="DynamoDBStack-${EnvironmentName}"

# aws cloudformation wait  stack-exists --stack-name $StackName --region $Region

# if [ $? -eq 0 ]
# then
#           echo "creating change set for existing stack "
#           OUT=$(aws cloudformation create-change-set     --stack-name DynamoDBStack-Staging     --change-set-name my-change-set  \
#               --template-body file://dynamo-cf-template.yaml --region us-west-2  --parameters ParameterKey=PrimaryKeyName,ParameterValue=Name   \
#                 ParameterKey=PrimaryKeyType,ParameterValue=S ParameterKey=EnvironmentName,ParameterValue=Staging ParameterKey=Region,ParameterValue=us-west-2 --change-set-type UPDATE)

# else
      
#           echo "creating change set for new stack"
#           OUT=$(aws cloudformation create-change-set     --stack-name DynamoDBStack-Staging     --change-set-name my-change-set  \
#               --template-body file://dynamo-cf-template.yaml --region us-west-2  --parameters ParameterKey=PrimaryKeyName,ParameterValue=Name   \
#               ParameterKey=PrimaryKeyType,ParameterValue=S ParameterKey=EnvironmentName,ParameterValue=Staging ParameterKey=Region,ParameterValue=us-west-2 --change-set-type CREATE)

# fi 

#ARN=$(echo $OUT | jq -r '.Id')
echo "Do you want to proceed further:"
read approval
#aws cloudformation execute-change-set --change-set-name $ARN
