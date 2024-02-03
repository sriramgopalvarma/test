pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage ('Lint Test for Backend') {
            allOf { 
                    branch 'main'
                    changeset "Readme.md"
                }
            steps {
                sh "echo hii"
            }
        }
        
    }
}
