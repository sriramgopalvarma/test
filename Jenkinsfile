pipeline {
    agent any
    triggers {
        cron('H/5 * * * *') // Replace this with your desired cron expression
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
            when { triggeredBy 'TimerTrigger' }
            steps {
                script {
                    sh """
                    echo 'unit test '
                    """ 
                }
            }
        }
        stage("build stage") {
            when { anyOf { branch 'dev*'; branch 'main' } }
            steps {
                sh """echo "this is timetrigger test"
                """
            }
        }
    }
}
