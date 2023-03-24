pipeline {
    // Where to execute
    agent any 

    stages {
        // Where the "work" happens
        stage("build") { 

            steps {
                echo "Build the application"
            }

        }

        stage("test") {

            steps {
                echo "Test the application"
            }        

        }

        stage("deploy") {

            steps {
                echo "Deploy the application"
            }        

        }

    }
}