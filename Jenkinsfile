pipeline {

    agent any
    
    environment {
        GITHUB_REPOSITORY = 'https://github.com/matekassa/project-devops.git'
        DOCKER_REGISTRY = 'https://registry.hub.docker.com'
        DOCKER_REGISTRY_CREDENTIALS = 'jenkins-docker'
        DOCKER_IMAGE = 'matekassa/hello-flask-app'
        SERVER_IP = '192.168.56.10'
        SERVER_SSH_CREDENTIALS = 'server-ssh-credentials'
        CONTAINER_NAME = 'hello-flask-app'
    }

    stages {

        stage('Checkout the branch') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: "${GITHUB_REPOSITORY}"]]])
            }
        }
        
        stage('Build the docker image from the Dockerfile and push the docker image to Docker Hub registry') {
            steps {
                script {
                    def dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}", "-f hello-flask-app/Dockerfile ./hello-flask-app/.")
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_REGISTRY_CREDENTIALS}") {
                        dockerImage.push()
                        dockerImage.push('latest') 
                    }
                }
            }
        }

        stage("Deploy the application to the server from the docker registry") {
            steps {
                sh "cd ./vagrant-ansible/Vagrant && vagrant status && vagrant up && vagrant ssh -c 'sudo docker run -d -p 85:5000 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}:latest'"
            }
        }
        
    }
}