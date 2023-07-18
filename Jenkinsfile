pipeline {
    agent any
    triggers {
        cron('H/2 * * * *') 
    }
    
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
                triggeredBy 'TimerTrigger'
            }
            steps {
                sh """echo "this is timetrigger test"
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
