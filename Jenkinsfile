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
            }
        }
        stage('Test'){
            steps {
                sh 'ls'
                 
            }
        }
        stage('Deploy') {
            steps {
                sh 'ls'
            }
        }
    }
}
