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
                echo '🔧 Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                sh 'docker run --rm feedback-app pytest tests/'
            }
        }

        stage('Manual Approval (QA)') {
            steps {
                input message: '✅ Approve deployment to production?', ok: 'Deploy'
            }
        }

        stage('Deploy') {
            steps {
                echo '🚀 Deploying the app...'
                // tambahin command deploy kamu di sini, misalnya copy ke server/hosting
            }
        }
    }

    post {
        failure {
            echo '❌ Build failed. Please check the logs.'
        }
        success {
            echo '🎉 Pipeline completed successfully!'
        }
    }
}

