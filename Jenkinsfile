pipeline {
    agent any
    triggers {
        cron('0 0 * * *') // Replace this with your desired cron expression
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage ('lint test') {
            when { not { triggeredBy 'TimerTrigger' } }
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
            when { 
                anyOf { branch 'dev*'; branch 'main' }
                not { triggeredBy 'TimerTrigger' }
            }
            steps {
                sh """echo "this is timetrigger test"
                """
            }
        }
    }
}
