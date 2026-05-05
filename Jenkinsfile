pipeline {
    agent any

    environment {
        APP_NAME = 'file-upload-app'
        IMAGE_NAME = 'file-upload-app'
        CONTAINER_NAME = 'file-upload-container'
        PORT = '3000'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'npm test'
            }
        }

        stage('Package - Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Deploy - Docker Run') {
            steps {
                echo 'Deploying container locally...'
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                docker run -d --name $CONTAINER_NAME -p $PORT:$PORT $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo 'PIPELINE SUCCESS ✅'
        }
        failure {
            echo 'PIPELINE FAILED ❌'
        }
        always {
            echo 'Pipeline finished.'
        }
    }
}