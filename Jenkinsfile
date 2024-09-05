pipeline {
    agent {
        label 'my_new_node' // Replace with the actual label or node name
    }

    environment {
        IMAGE_NAME = 'my-docker-image' // Name for the Docker image
        DOCKER_REGISTRY = 'dockerhub_username' // Docker Hub or other registry username
    }

    stages {
        

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "sudo docker compose up --build -d"
                }
            }
        }

       

        
    }

    
}
