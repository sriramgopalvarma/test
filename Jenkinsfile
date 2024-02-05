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
                    when {
                        allOf {
                            expression {
                                def isFeatureBranch = env.BRANCH_NAME.startsWith('feature')
                                def hasMainGoChanges = script: true, returnStatus: true, script: "git diff --name-only HEAD^ HEAD | grep -q README.md"
                
                                return isFeatureBranch && hasMainGoChanges == 0
                            }
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
