def createchangeset() {
  
  OUT = ""
  StackName="DynamoDBStack-${EnvironmentName}"
  println(StackName)

  //sh 'aws cloudformation wait  stack-exists --stack-name ${StackName} --region $Region'
  //STATUS = sh(script: "echo \$?", returnStatus: true)
  
  STACK_LIST=sh(script: "aws cloudformation list-stacks --region us-east-1 --stack-status-filter CREATE_COMPLETE| jq -r '.[]|.[]|.StackName' >> OUT", returnStatus: true)
  println(STACK_LIST.getClass())
  println(OUT)
  //STACK_LIST = STACK_LIST.split(' ');
  println("Printing stack list"+STACK_LIST)
  
  


if( STACK_LIST.contains(StackName)){
          println("creating change set for existing stack")
  OUT=sh(script: "aws cloudformation create-change-set     --stack-name ${StackName}     --change-set-name my-change-set  --template-body file://dynamo-cf-template.yaml --region $Region  --parameters ParameterKey=PrimaryKeyName,ParameterValue=$PrimaryKeyName ParameterKey=PrimaryKeyType,ParameterValue=$PrimaryKeyType ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName ParameterKey=Region,ParameterValue=$Region --change-set-type UPDATE", returnStatus: true)
          ARN=sh(script: "echo $OUT | jq -r '.Id'", returnStatus: true)
          //echo "printing change set ARN: $ARN"
          //sleep 15
         //aws cloudformation execute-change-set --change-set-name $ARN --region $Region
                 }


 else {
      
          println("creating change set for new stack")
   OUT=sh(script: "aws cloudformation create-change-set     --stack-name ${StackName}     --change-set-name my-change-set   --template-body file://dynamo-cf-template.yaml --region $Region  --parameters ParameterKey=PrimaryKeyName,ParameterValue=$PrimaryKeyName ParameterKey=PrimaryKeyType,ParameterValue=$PrimaryKeyType ParameterKey=EnvironmentName,ParameterValue=$EnvironmentName ParameterKey=Region,ParameterValue=$Region --change-set-type CREATE", returnStatus: true)
          ARN=sh(script: "echo $OUT | jq -r '.Id'")
          //echo "printing change set ARN: $ARN"

          //sleep 15
          //aws cloudformation execute-change-set --change-set-name $ARN --region $Region
}
                 return ARN
  
}


pipeline{
  
  agent any
  parameters {
    
   string(name: 'PrimaryKeyName', description: 'Enter the Primary key of dynamoDB table?')
   string(name: 'PrimaryKeyType', description: 'Enter the type of Primary key of dynamoDB table?')
   choice(name: 'EnvironmentName', choices: ['Staging', 'Perf', 'E2E', 'Production'], description: 'Enter the Environment for the Database to be deployed in?')
   string(name: 'Region', description: 'Enter the region for the Database to be deployed in?')
    
  }
  environment {
       CHANGE_SET_ARN = ''                               //can be used in whole pipeline
   }

  stages{
    
        
        stage('create change set')
        {
          steps{
            
                //sh 'chmod a+x create-change-set.sh'
                //sh './create-change-set.sh'
                 createchangeset()
                 //echo "printing ARN $ARN"
            
             }
        }
        
//         stage('Manual Approval')
    
//         {
//           steps{
            
//                    input "Please review the above changeset and confirm if it can be deployed"
//           }
//         }
    
//         stage('Deploy the changes')
//         {
//           steps{
//                   sh 'chmod a+x cloudformation-stacks.sh'
//                   sh './cloudformation-stacks.sh'
//             }
//         }
  }
}
