pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage ('test') {
            parallel {
                stage ('Lint Test') {
                    when { branch 'feature*' }
                    steps {
                        sh "echo Lint"
                    }
                }
                stage ('unit Test') {
                    when {
                        allOf { 
                            branch 'feature*'
                            changeset "dev/**"
                        } 
                    }
                    steps {
                        echo "unit test"
                    }
                }
            }
        }    
    }
}
