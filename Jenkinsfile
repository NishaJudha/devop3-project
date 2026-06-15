pipeline {

    agent any

    environment {

        DEV_IMAGE="nishajudha/devops-3project"

        PROD_IMAGE="nishajudha/devops3-project"
    }

    stages {

        stage('Clone') {

            steps {
                git branch: "dev",
                url: 'https://github.com/NishaJudha/devop3-project.git'
            }
        }

        stage('Build') {

            steps {
                sh './build.sh'
            }
        }

        stage('Push public') {

            when {
                branch 'dev'
            }

            steps {

                sh '''
                docker tag react-app latest nishajudha/devops-3project:latest
                docker push nishajudha/devops-3project:latest
                '''
            }
        }

        stage('Push private') {

            when {
                branch 'main'
            }

            steps {

                sh '''
                docker tag react-app latest nishajudha/devops3-project:latest
                docker push nishajudha/devops3-project:latest
                '''
            }
        }

        stage('Deploy') {

            steps {
                sh './deploy.sh'
            }
        }
    }
}

