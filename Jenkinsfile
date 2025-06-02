pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/faqi22152ti/feedback-app.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t feedback-app .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'docker run --rm feedback-app pytest tests/'
            }
        }

        stage('Manual Approval (QA)') {
            steps {
                input message: 'QA, please approve to deploy this app.'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Stopping old containers (if any)...'
                sh '''
                    docker stop $(docker ps -q --filter ancestor=feedback-app) || true
                    docker rm $(docker ps -a -q --filter ancestor=feedback-app) || true
                '''
                echo 'Deploying container...'
                sh 'docker run -d -p 5000:80 feedback-app'
            }
        }
    }
}


