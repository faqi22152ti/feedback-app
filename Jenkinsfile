pipeline {
    agent any

    environment {
        IMAGE_NAME = 'feedback-app:latest'
        CONTAINER_NAME = 'feedback-app-container'
        APP_PORT = '8080'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/faqi22152ti/feedback-app.git'
            }
        }

        stage('Build') {
            steps {
                echo '📦 Building Docker image feedback-app:latest...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

       stage('Manual Approval (QA)') {
    steps {
        echo "⏳ Menunggu persetujuan QA..."
        input message: 'Approve deployment?', ok: 'Yes, Deploy'
        echo "✅ Disetujui QA! Lanjut ke deployment..."
    }
}

        stage('Deploy') {
            steps {
                echo '🚀 Deploying Docker container feedback-app:latest...'
                sh '''
                    if [ $(docker ps -aq -f name=$CONTAINER_NAME) ]; then
                        docker stop $CONTAINER_NAME || true
                        docker rm $CONTAINER_NAME || true
                    fi

                    docker run -d --name $CONTAINER_NAME -p $APP_PORT:80 $IMAGE_NAME
                '''
            }
        }
    }
}
