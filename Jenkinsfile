pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage ('Lint Test for Backend') {
            when { 
                allOf { 
                    branch 'feature*'
                    changeset "dev/README.md"
                } 
            }
            steps {
                sh "echo hii"
            }
        }
    }
}
