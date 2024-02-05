pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage ('test') {
            parallel {
                stage ('Lint Test for Backend') {
                    when { branch 'feature/*' }
                    steps {
                        sh "echo hii"
                    }
                }
                stage ('unit Test for Backend') {
                    when { 
                        allOf { 
                            branch 'feature/*'
                            changeset "README.md"
                        } 
                    }
                    steps {
                        sh "echo hii"
                    }
                }
            }
        }    
    }
}
