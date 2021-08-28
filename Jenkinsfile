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
                sh 'terraform init'
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
