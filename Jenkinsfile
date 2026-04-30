pipeline {
    agent any

    environment {
        IMAGE_NAME = "file-upload-app"
    }

    stages {

        stage('Build') {
            steps {
                echo 'Code already checked out by Jenkins'
            }
        }

        stage('Test') {
            steps {
                bat 'node -v'
                bat 'npm -v'
            }
        }

        stage('Package - Docker Build') {
            steps {
                bat 'docker build -t file-upload-app .'
            }
        }

        stage('Deploy - Docker Run') {
            steps {
                bat 'docker rm -f file-upload-app || exit 0'
                bat 'docker run -d -p 3000:3000 --name file-upload-app file-upload-app'
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