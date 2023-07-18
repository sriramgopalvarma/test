pipeline {
    agent any
    
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage ('lint test') {
            steps {
                sh """
                echo 'lint-test'
                """
            }
        } 

        stage ('unit-test') {
            when { anyOf { branch 'dev*'; branch 'main' } }
            triggers {
                cron(''H/5 * * * *'')
            }
            steps {
                script {
                    sh """
                    echo 'unit test '
                    """ 
                }
            }
        }
        stage("build stage") {
            when {
                  branch 'main'  }
            steps {
                sh """echo "this is build stage for master only"
                """
            }
        }
        stage("pr stage") {
            when {
                  branch 'main'  }
            steps {
                sh """echo "this is build stage for master only"
                """
            }
        }
        stage('Example Deploy') {
            when {
                allOf {
                    environment name: 'CHANGE_ID', value: ''
                    branch 'main'
                }
            }
            steps {
                sh """
                echo "not a pull request so do something
                """
            }
        }
    }
}
