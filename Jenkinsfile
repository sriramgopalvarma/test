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
                } 
            }
            steps {
                sh "echo hii"
            }
        }
    }
}
