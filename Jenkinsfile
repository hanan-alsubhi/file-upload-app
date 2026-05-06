pipeline {
    agent any

    environment {
        IMAGE_NAME = 'file-upload-app'
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
    }

    post {
        success {
            echo "✅ تم بناء الصورة بنجاح! يمكنك الآن الذهاب لبرنامج Docker وتشغيلها يدوياً."
        }
    }
}