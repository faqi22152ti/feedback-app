pipeline {
    agent any

    environment {
        IMAGE_NAME = 'feedback-app'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/faqi22152ti/feedback-app.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Manual Approval (QA)') {
            steps {
                input message: 'Approve to deploy?', ok: 'Deploy'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying Docker container...'
                sh 'docker run -d -p 8080:80 $IMAGE_NAME'
            }
        }
    }
}
