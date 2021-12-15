pipeline {
    agent {
        node {
            // https://jenkins.test/computer/(built-in)/configure
            label 'docker-enabled'
        }
    }

    environment {
        // https://hub.docker.com/repositories
        imageName = "widemos/laravel-blog"

        // https://hub.docker.com/settings/security
        registryCredential = 'docker-hub'

        publicPort = "80"
    }

    stages {
        stage('Docker') {
            steps {
                sh "docker-compose up -d"
            }
        }
    }
}
