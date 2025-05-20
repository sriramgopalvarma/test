pipeline {
    agent { label 'sxalable' }
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
    }
    stages {
        stage ('test') {
            parallel {
                stage ('Lint Test for Backend') {
                    when { branch 'main' }
                    steps {
                        sh "echo ${params.PERSON}"
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
                        sh "echo ${params.CHOICE}"
                    }
                }
            }
        }    
    }
}
