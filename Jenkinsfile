pipeline{
  
  agent any
  parameters {
    
   string(name: 'PrimaryKeyName', description: 'Enter the Primary key of dynamoDB table?')
   string(name: 'PrimaryKeyType', description: 'Enter the type of Primary key of dynamoDB table?')
   choice(name: 'EnvironmentName', choices: ['Staging', 'Perf', 'E2E', 'Production'], description: 'Enter the Environment for the Database to be deployed in?')
   string(name: 'Region', description: 'Enter the region for the Database to be deployed in?')
    
  }
  stages{
    
        stage('Manual Approval')
        {
          steps{
          input "Please approve"
          }
        }
        
        stage('create change set')
        {
          steps{
                 // sh 'chmod a+x create-change-set.sh'
                sh 'pwd'
                sh 'ls -la'
                sh './create-change-set.sh'
                //sh('create-change-set.sh')
            
                echo "hello1"
             }
        }
        
        stage('Deploy the changes')
        {
          steps{
                  // sh 'chmod a+x cloudformation-stacks.sh'
                 //  ./cloudformation-stacks.sh
                 echo "hello2"
            }
        }
  }
}
