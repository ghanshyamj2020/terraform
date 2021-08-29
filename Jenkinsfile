pipeline { 
    agent any 
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') { 
            steps { 
                sh 'ls' 
                sh 'pwd'
                sh 'terraform destroy --auto-approve'
                    
                
            }
        }
        stage('Test'){
            steps {
                sh 'ls'
                sh 'pwd'
                sh 'terraform init'
                sh 'terraform plan'
                 
            }
        }
        stage('Deploy') {
            steps {
                sh 'ls'
                sh 'terraform apply --auto-approve'
            }
        }  
        stage('Destroy') {
            steps {
                sh 'ls'
                sh 'terraform destroy --auto-approve'
            }    
        }
    }
  }
