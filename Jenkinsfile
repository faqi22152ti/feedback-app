pipeline {
    agent any

    environment {
        IMAGE_NAME = 'feedback-app'
        IMAGE_TAG = 'latest' // bisa kamu ubah sesuai kebutuhan
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/faqi22152ti/feedback-app.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building Docker image ${IMAGE_NAME}:${IMAGE_TAG}..."
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Manual Approval (QA)') {
            steps {
                input message: 'Approve to deploy?', ok: 'Deploy'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying Docker container ${IMAGE_NAME}:${IMAGE_TAG}..."
                // stop dan hapus container lama dulu (jika ada)
                sh '''
                if docker ps -q --filter "name=feedback-app-container" | grep -q .; then
                    docker stop feedback-app-container
                    docker rm feedback-app-container
                fi
                '''
                // run container baru dengan nama agar gampang kontrol
                sh "docker run -d --name feedback-app-container -p 8080:80 ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
    }
}
