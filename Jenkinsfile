pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Pulling code from GitHub...'
                git branch: 'main', url: 'https://github.com/hanan-alsubhi/file-upload-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing npm packages...'
                bat  'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running basic check...'
                bat  'node -v'
                bat  'npm -v'
            }
        }

        stage('Build') {
            steps {
                echo 'Build stage (no build step needed for this app)'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Starting application...'
            }
        }
    }

    post {
        success {
            echo 'Pipeline SUCCESS 🎉'
        }

        failure {
            echo 'Pipeline FAILED ❌'
        }
    }
}