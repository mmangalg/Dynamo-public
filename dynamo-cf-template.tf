AWSTemplateFormatVersion: '2010-09-09'
Metadata: 
  License: Apache-2.0
Description: 'AWS CloudFormation Sample Template DynamoDB_Table: This template demonstrates
  the creation of a DynamoDB table.  **WARNING** This template creates an Amazon DynamoDB
  table. You will be billed for the AWS resources used if you create a stack from
  this template.'
Parameters:
  HashKeyElementName:
    Description: HashType PrimaryKey Name
    Type: String
    AllowedPattern: '[a-zA-Z0-9]*'
    MinLength: '1'
    MaxLength: '2048'
    ConstraintDescription: must contain only alphanumberic characters
  HashKeyElementType:
    Description: HashType PrimaryKey Type
    Type: String
    Default: S
    AllowedPattern: '[S|N]'
    MinLength: '1'
    MaxLength: '1'
    ConstraintDescription: must be either S or N
  ReadCapacityUnits:
    Description: Provisioned read throughput
    Type: Number
    Default: '7'
    MinValue: '1'
    MaxValue: '10000'
    ConstraintDescription: must be between 5 and 10000
  WriteCapacityUnits:
    Description: Provisioned write throughput
    Type: Number
    Default: '10'
    MinValue: '1'
    MaxValue: '10000'
    ConstraintDescription: must be between 5 and 10000
Resources:
  myDynamoDBTable:
    Type: AWS::DynamoDB::Table
    Properties:
      AttributeDefinitions:
      - AttributeName: !Ref 'HashKeyElementName'
        AttributeType: !Ref 'HashKeyElementType'
      KeySchema:
      - AttributeName: !Ref 'HashKeyElementName'
        KeyType: HASH
      ProvisionedThroughput:
        ReadCapacityUnits: !Ref 'ReadCapacityUnits'
        WriteCapacityUnits: !Ref 'WriteCapacityUnits'
Outputs:
  TableName:
    Value: !Ref 'myDynamoDBTable'
    Description: Table name of the newly created DynamoDB table
