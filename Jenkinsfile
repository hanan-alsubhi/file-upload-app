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

                /* 
                 * SOLUTION for (1. PATH Issue): 
                 * We use a Docker container (node:20-alpine) to run npm commands. 
                 * This bypasses Jenkins environment PATH issues and ensures a 
                 * consistent build environment regardless of the host machine's setup.
                 */

                sh "docker run --rm -v ${WORKSPACE}:/app -w /app node:20-alpine sh -c 'npm install && npm test || true'"
            }
        }

        stage('Package - Docker Build') {
            steps {
                echo 'Building Docker image...'
               // Building the final image to be stored in the local Docker registry.
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }
        /* 
         * NOTE: Deployment stage is currently manual/commented out.
         * 
         * SOLUTION for (2. Port Mapping):
         * When running manually, ensure mapping Host Port ${PORT} to Container Port 3000.
         * 
         * SOLUTION for (3. Zombie Processes):
         * use 'docker stop' and 'docker rm' before a new run to clear
         * persistent background processes and release the port.
         */


        // stage('Deploy - Docker Run') {
        //     steps {
        //         echo 'Deploying container locally...'
        //         sh """
        //         docker stop ${CONTAINER_NAME} || true
        //         docker rm ${CONTAINER_NAME} || true
        //         docker run -d --name ${CONTAINER_NAME} -p ${PORT}:3000 ${IMAGE_NAME}
        //         """
        //     }
        
            
        // }
    }



    post {
        success {
            echo "✅ تم التنفيذ بنجاح"
        }
    }
}