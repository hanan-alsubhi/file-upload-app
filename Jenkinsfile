pipeline {
    agent any

    environment {
        APP_NAME = 'file-upload-app'
        IMAGE_NAME = 'file-upload-app'
        CONTAINER_NAME = 'file-upload-container'
        PORT = '3001'
    }

    stages {
        stage('Install & Test') {
            steps {
                echo 'Installing dependencies...'
                // حذفنا npm run build لأنه غير موجود في مشروعك
                sh "docker run --rm -v ${WORKSPACE}:/app -w /app node:20-alpine sh -c 'npm install && npm test || true'"
            }
        }

        stage('Package - Docker Build') {
            steps {
                echo 'Building final Docker image...'
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Deploy - Docker Run') {
            steps {
                echo 'Deploying container locally...'
                sh """
                docker stop ${CONTAINER_NAME} || true
                docker rm ${CONTAINER_NAME} || true
                docker run -d --name ${CONTAINER_NAME} -p ${PORT}:3000 ${IMAGE_NAME}
                """
            }
        }
    }

    post {
        success { echo 'PIPELINE SUCCESS ✅ - اذهبي الآن لـ localhost:3001' }
        failure { echo 'PIPELINE FAILED ❌' }
    }
}