pipeline {
    environment {
	#Define your enviornment variables

	#Example -
        #BUILD_SCRIPTS_GIT="http://10.100.100.10:7990/scm/~myname/mypipeline.git"
        #BUILD_SCRIPTS='mypipeline'
        #BUILD_HOME='/var/lib/jenkins/workspace'
         
        ### These credentials would have been configured in Jenkins GUI
        #AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        #AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
     
    agent any
     
    stages {
        stage('Checkout: Code') {
            steps {
		echo "Checking project code.."
		#Example-
                #sh "mkdir -p $WORKSPACE/repo;\
                #git config --global user.email 'email@address.com';\
                #git config --global user.name 'myname';\
                #git config --global push.default simple;\
                #git clone $BUILD_SCRIPTS_GIT repo/$BUILD_SCRIPTS"
                #sh "chmod -R +x $WORKSPACE/repo/$BUILD_SCRIPTS"
            }
        }
        stage('Yum: Updates') {
            steps {
		echo "Updating .."
		#Example -
                #sh "sudo chmod +x $WORKSPACE/repo/$BUILD_SCRIPTS/scripts/update.sh"
                #sh "sudo $WORKSPACE/repo/$BUILD_SCRIPTS/scripts/update.sh"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
     
    post {
        always {
            echo "Running post stages code.."
        }
    }
}
