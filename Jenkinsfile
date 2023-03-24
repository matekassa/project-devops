pipeline {
    agent { dockerfile true }
    

    environment {
        GITHUB_REPOSITORY = 'https://github.com/matekassa/project-devops.git'
        DOCKER_REGISTRY = 'https://registry.hub.docker.com'
        DOCKER_REGISTRY_CREDENTIALS = 'jenkins-docker'
        DOCKER_IMAGE = 'https://hub.docker.com/r/matekassa/hello-flask-app'
        //SERVER_IP = 'your-server-ip'
        //SERVER_SSH_CREDENTIALS = 'server-ssh-credentials'
        //CONTAINER_NAME = 'hello-flask-app'
    }

    stages {

        stage("Build the docker image from the Dockerfile and push the docker image to Docker Hub registry") { 
            // git branch: 'master', url: "${GITHUB_REPOSITORY}"
            when {
                branch 'master'
            }
            steps {
                script {
                    def dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_REGISTRY_CREDENTIALS}") {
                        dockerImage.push()
                        dockerImage.push('latest') 
                    }
                }

            }

        //stage("Deploy the application to the server from the registry of the pushed image") {

            //steps {
                //sshagent(credentials: ["${SERVER_SSH_CREDENTIALS}"]) {
                //sh "ssh -o StrictHostKeyChecking=no -l root ${SERVER_IP} 'docker pull ${DOCKER_IMAGE}:latest && docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME} || true && docker run -d -p 80:80 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}:latest'"
                //}
            //}
        //}

        }
    }
}