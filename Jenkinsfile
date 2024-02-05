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
                    when { branch 'feature/*' }
                    steps {
                        script {
                            def changes = sh(script: 'git diff --name-only HEAD^ HEAD', returnStdout: true).trim()
        
                            if (changes) {
                                echo "Changed"
                            } 
                            else {
                                echo "Not Changed"
                            }
                        }
                    }
                }
            }
        }    
    }
}
