pipeline {
    agent { label 'sxalable' }
    stages {
        stage ('test') {
            parallel {
                stage ('Lint Test for Backend') {
                    when { 
                        allOf { 
                            branch 'main'
                            changeset "README.md"
                        } 
                    }
                    steps {
                        sh "echo hii"
                    }
                }
                stage ('unit Test for Backend') {
                    when { 
                        allOf { 
                            branch 'main'
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
