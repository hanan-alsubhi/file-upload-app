pipeline {
    agent any 

    stages {
        stage('Check Connection') {
            steps {
                // التأكد أن جنكينز وجد الدوكر في المسار الجديد
                sh 'docker --version'
                sh 'docker run --rm hello-world'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t file-upload-app .'
            }
        }
    }
}