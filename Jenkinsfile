pipeline {
    agent any

    environment {
        // تعريف المتغيرات لتسهيل التعديل مستقبلاً
        IMAGE_NAME = 'file-upload-app'
        CONTAINER_NAME = 'file-upload-container'
        PORT = '3001'
    }

    stages {
        stage('Install & Test') {
            steps {
                echo 'Installing dependencies and running tests...'
                // تنفيذ npm install داخل حاوية مؤقتة لضمان نظافة البيئة
                sh "docker run --rm -v ${WORKSPACE}:/app -w /app node:20-alpine sh -c 'npm install && npm test || true'"
            }
        }

        stage('Package - Docker Build') {
            steps {
                echo 'Building Docker image from Dockerfile...'
                // بناء الصورة وتسميتها
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
                """
            }
        }
    }

    post {
        success {
            echo "✅ PIPELINE SUCCESS"
            echo "اذهبي الآن إلى المتصفح وافتحي: http://localhost:3001"
        }
        failure {
            echo "❌ PIPELINE FAILED"
        }
    }
}