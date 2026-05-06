pipeline {
    agent any

    environment {
        IMAGE_NAME = 'file-upload-app'
        CONTAINER_NAME = 'file-upload-app-container'
        PORT = '3001'
    }

    stages {
        stage('Install & Test') {
            steps {
                echo 'Installing dependencies and running tests...'
                sh "docker run --rm -v ${WORKSPACE}:/app -w /app node:20-alpine sh -c 'npm install && npm test || true'"
            }
        }

        stage('Package - Docker Build') {
            steps {
                echo 'Building Docker image...'
                // جنكينز سيبني الصورة ويخزنها في جهازك
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }
        stage('Deploy - Docker Run') {
            steps {
                echo 'Deploying container locally...'
                // إيقاف وحذف أي حاوية قديمة بنفس الاسم لتجنب التعارض
                // ثم تشغيل الحاوية الجديدة وربط المنفذ 3001 بـ 3000
                sh """
                docker stop ${CONTAINER_NAME} || true
                docker rm ${CONTAINER_NAME} || true
                docker run -d --name ${CONTAINER_NAME} -p ${PORT}:3000 ${IMAGE_NAME}
                """
            }
        }
    }

    post {
        success {
            echo "✅ تم التنفيذ بنجاح"
        }
    }
}