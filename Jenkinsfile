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

        stage('Docker Build') {
            steps {
                sh "docker-compose build"
            }
        }

        stage('Docker Up') {
            steps {
                sh "PORT=${publicPort} docker-compose up -d --remove-orphans"
            }
        }

        stage('Laravel migrate') {
            steps {
                sh "docker-compose exec -T app php artisan migrate:fresh"
            }
        }
    }
}
