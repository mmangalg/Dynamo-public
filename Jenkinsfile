pipeline{
  
  agent any
  parameters {
    
   string(name: 'PrimaryKeyName', description: 'Enter the Primary key of dynamoDB table?')
   string(name: 'PrimaryKeyType', description: 'Enter the type of Primary key of dynamoDB table?')
   choice(name: 'EnvironmentName', choices: ['Staging', 'Perf', 'E2E', 'Production'], description: 'Enter the Environment for the Database to be deployed in?')
   string(name: 'Region', description: 'Enter the region for the Database to be deployed in?')
    
  }
  stages{
        stage('create change set')
        {
          steps{
           echo "creating change set"
          }
        }
        stage('Manual Approval')
        {
          steps{
          echo "adding manual approval"
          }
        }
        stage('Deploy the changes')
        {
          steps{
          echo "deploying the changes"
          }
        }
  }
}
