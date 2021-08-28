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
                sh 'terraform -help'         
                
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
                sh 'terraform apply'
            }
        }
    }
}
