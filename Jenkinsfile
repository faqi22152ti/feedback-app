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
                echo "Building Docker image ${env.IMAGE_NAME}..."
                sh "docker build -t ${env.IMAGE_NAME} ."
            }
        }

        stage('Manual Approval (QA)') {
            steps {
                script {
                    // input dengan parameter nama approver
                    def userInput = input(
                        id: 'Approval', message: 'Approve to deploy?', parameters: [
                            string(name: 'APPROVER_NAME', defaultValue: '', description: 'Masukkan nama Anda untuk approval')
                        ]
                    )
                    // simpan nama approver ke environment variable supaya bisa dipakai di stage selanjutnya
                    env.APPROVER = userInput
                    echo "Approved by: ${env.APPROVER}"
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying Docker container by ${env.APPROVER}..."
                sh "docker run -d --name feedback-app-container -p 8080:80 ${env.IMAGE_NAME}"
                // optional simpan info approver ke file agar bisa dicek
                sh "echo 'Approved by: ${env.APPROVER}' > approved-by.txt"
                archiveArtifacts artifacts: 'approved-by.txt', fingerprint: true
            }
        }
    }
}
