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
                        changeset "Dashboard/Backend/**"
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
