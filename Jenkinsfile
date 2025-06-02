pipeline {
    agent any

    environment {
        IMAGE_NAME = 'feedback-app'
    }

    stages {
        // hapus stage Clone Repo karena Jenkins otomatis clone repo sesuai konfigurasi job
        stage('Build') {
            steps {
                echo "Building Docker image ${env.IMAGE_NAME}..."
                sh "docker build -t ${env.IMAGE_NAME} ."
            }
        }

        stage('Manual Approval (QA)') {
            steps {
                script {
                    def userInput = input(
                        id: 'Approval', message: 'Approve to deploy?', parameters: [
                            string(name: 'APPROVER_NAME', defaultValue: '', description: 'Masukkan nama Anda untuk approval')
                        ]
                    )
                    env.APPROVER = userInput
                    echo "Approved by: ${env.APPROVER}"
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying Docker container by ${env.APPROVER}..."
                sh '''
                    if docker ps -q --filter name=feedback-app-container; then
                        docker stop feedback-app-container
                        docker rm feedback-app-container
                    fi
                    docker run -d --name feedback-app-container -p 8080:80 ${IMAGE_NAME}
                '''
                sh "echo 'Approved by: ${env.APPROVER}' > approved-by.txt"
                archiveArtifacts artifacts: 'approved-by.txt', fingerprint: true
            }
        }
    }
}
