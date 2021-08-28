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
                sh 'terraform init'
                
                sh 'terraform plan'
            }
        }
        stage('Test'){
            steps {
                sh 'ls'
                sh 'pwd'
                 
            }
        }
        stage('Deploy') {
            steps {
                sh 'ls'
            }
        }
    }
}
