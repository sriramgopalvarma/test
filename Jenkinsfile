pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage ('test') {
            parallel {
                stage ('Lint Test for Backend') {
                    when { branch 'feature*' }
                    steps {
                        sh "echo hii"
                    }
                }
                stage ('unit Test for Backend') {
                    when { branch 'feature*' }
                    steps {
                        script {
                            def changedFiles = sh(script: 'git diff --name-only HEAD^ HEAD', returnStdout: true).trim()
                            def directoryPath = 'dev/'
        
                            if (changedFiles.contains(directoryPath)) {
                                echo "File in the specified directory has been modified."
                            } else {
                                echo "No changes in the specified directory."
                            }
                        }
                    }
                }
            }
        }    
    }
}
