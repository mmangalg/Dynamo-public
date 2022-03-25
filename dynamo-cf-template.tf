
AWSTemplateFormatVersion: 2010-09-09
Description: AWS CloudFormation Template to create global tables
Parameters:
  HashKeyElementName:
    Description: HashType PrimaryKey Name
    Default: FirstName
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
  EnvironmentName:
    Description: Defines enviroment name
    Type: String
    Default: Staging

Resources:
 GlobalTableTest:
     Type: 'AWS::DynamoDB::GlobalTable'
     Properties:
         TableName: mytable1
         AttributeDefinitions:
         - AttributeName: !Ref 'HashKeyElementName'
           AttributeType: !Ref 'HashKeyElementType'
         KeySchema:
         - AttributeName: !Ref 'HashKeyElementName'
           KeyType: HASH
         BillingMode: PROVISIONED
         StreamSpecification:
            StreamViewType: NEW_AND_OLD_IMAGES
         
         WriteProvisionedThroughputSettings:
           WriteCapacityAutoScalingSettings:
              MinCapacity : 4
              MaxCapacity : 10
              SeedCapacity : 5
              TargetTrackingScalingPolicyConfiguration:
                       DisableScaleIn: False
                       ScaleInCooldown: 60
                       ScaleOutCooldown: 60
                       TargetValue: 70


         Replicas:
         - Region: us-east-2
           PointInTimeRecoverySpecification:
             PointInTimeRecoveryEnabled: true
           Tags:
             - Key: Name
               Value: mytable1
             - Key: Region
               Value: east
             - Key: Env
               Value: !Ref 'EnvironmentName'
           ReadProvisionedThroughputSettings: 
               ReadCapacityUnits: 5
           
         - Region: us-west-1
           PointInTimeRecoverySpecification:
               PointInTimeRecoveryEnabled: false
           Tags:
            - Key: Name
              Value: mytable1
            - Key: Region
              Value: west 
            - Key: Env
              Value: !Ref 'EnvironmentName'
           ReadProvisionedThroughputSettings:
               ReadCapacityUnits: 4
#            ReadProvisionedThroughputSettings:
#                   MaxCapacity: 4
#                   MinCapacity: 10
#                   SeedCapacity: 5
#                   TargetTrackingScalingPolicyConfiguration: 
#                              DisableScaleIn: False
#                              ScaleInCooldown: 60
#                              ScaleOutCooldown: 60
#                              TargetValue: 70


