pipeline {
    agent {
        node {
            // https://jenkins.test/computer/(built-in)/configure
            label 'docker-enabled'
        }
    }

    environment {
        publicPort = "80"
    }

    stages {
        stage('Setup .env') {
            steps {
                sh "cp env-example .env"
            }
        }

        stage('Docker Compose') {
            steps {
                sh "PORT=${publicPort} docker-compose up -d"
            }
        }
    }
}
