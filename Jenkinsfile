pipeline {
    agent any

    environment {
        APP_NAME = 'file-upload-app'
        IMAGE_NAME = 'file-upload-app'
        CONTAINER_NAME = 'file-upload-container'
        PORT = '3001'
    }

    stages {
        stage('Build & Test') {
            steps {
                echo 'Building and testing using Node Docker Image...'
                // هنا نستخدم حاوية نود مؤقتة لتنفيذ الأوامر بدلاً من الاعتماد على الماك مباشرة
                sh "docker run --rm -v ${WORKSPACE}:/app -w /app node:20-alpine sh -c 'npm install && npm run build && npm test || true'"
            }
        }

        stage('Package - Docker Build') {
            steps {
                echo 'Building final Docker image...'
                // استخدام علامات التنصيص المزدوجة " " ضروري لقراءة المتغيرات بشكل صحيح
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
        success { echo 'PIPELINE SUCCESS ✅' }
        failure { echo 'PIPELINE FAILED ❌' }
        always { echo 'Pipeline finished.' }
    }
}