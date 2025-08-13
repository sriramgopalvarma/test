pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    parameters {
        string(name: 'VERSION', defaultValue: 'v1', description: 'Enter the version (e.g., v25)')
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
                stage ('Version override') {
                    when {
                        allOf { 
                            branch 'feature*'
                            changeset "dev/**"
                        } 
                    }
                    steps {
                        sh """
                        sed -i "s|test|${VERSION}|g" README.md
                        cat README.md
                        """
                    }
                }
            }
        }    
    }
}
