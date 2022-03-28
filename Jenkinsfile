pipeline{
  
  agent any
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
