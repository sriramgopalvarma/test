pipeline {
    agent { label 'sxalable' }
    stages {
        stage ('test') {
            parallel {
                stage ('Lint Test for Backend') {
                    when { branch 'main' }
                    steps {
                        sh "echo hii"
                    }
                }
                stage ('unit Test for Backend') {
                    when { 
                        allOf { 
                            branch 'main'
                        } 
                    }
                    steps {
                        sh "cat agw_docker.sh"
                    }
                }
            }
        }    
    }
}
