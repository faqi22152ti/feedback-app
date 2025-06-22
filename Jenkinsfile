pipeline {
    agent any

    environment {
        IMAGE_NAME = 'feedback-app'
        IMAGE_TAG = 'latest'
    }

    #stages {
        #stage('Clone Repo') {
            #steps {
                #git branch: 'main', url: 'https://github.com/faqi22152ti/feedback-app.git'
            #}
     #   }

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
                sh '''
                docker stop feedback-app-container || true
                docker rm feedback-app-container || true
                docker run -d --name feedback-app-container -p 8080:5000 ${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }
    }
}
