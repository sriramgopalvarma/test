pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage ('Lint Test for Backend') {
            when { 
                anyOf {
                    allOf {
                        anyOf { 
                            branch 'feature*';
                            branch 'main'
                        }
                        changeset "README.md"
                    }
                    branch 'PR-*'
                } 
            }
            steps {
                sh "echo hii"
            }
        }
        
    }
}
