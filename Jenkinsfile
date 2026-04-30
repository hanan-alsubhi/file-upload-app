pipeline {
    agent any

    environment {
        IMAGE_NAME = "file-upload-app"
    }

    stages {

        stage('Build') {
            steps {
                git 'https://github.com/hanan-alsubhi/file-upload-app.git'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing Node version...'
                bat 'node -v'
                bat 'npm -v'
            }
        }

        stage('Package - Docker Build') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t file-upload-app .'
            }
        }

        stage('Deploy - Docker Run') {
            steps {
                echo 'Running container...'
                bat 'docker run -d -p 3000:3000 file-upload-app'
            }
        }
    }

    post {
        success {
            echo 'PIPELINE SUCCESS 🎉'
        }
        failure {
            echo 'PIPELINE FAILED ❌'
        }
    }
}