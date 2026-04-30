pipeline {
    agent any

    environment {
        IMAGE_NAME = "file-upload-app"
        CONTAINER_NAME = "file-upload-container"
    }

    stages {

        stage('Build') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running basic test...'
                sh 'node -v'
                sh 'npm -v'
            }
        }

        stage('Package') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Running container...'
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo 'SUCCESS 🎉 App deployed'
        }

        failure {
            echo 'FAILED ❌ Check logs'
        }
    }
}