pipeline {
    agent any
    environment {
	MY_TESTLINUX_HOST   = credentials('MY_TESTLINUX_HOST')
	MY_TESTLINUX_USER   = credentials('MY_TESTLINUX_USER')
	MY_TESTLINUX_PASSWD = credentials('MY_TESTLINUX_PASSWD')
	
    }
    stages {
        stage('Checkout: Code') {
            steps {
		echo "Pulling project code.."
                echo "\tcall exact steps to checkout code from your project repo ..\n"
            }
        }
        stage('Yum: Updates') {
            steps {
		echo "Updating libraries (if required) ..\n"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing ..\n'
		sh 'cat Jenkinsfile'
		sh 'chmod 777 telnet_shell_script.sh'
                sh 'printenv'
		sh '$PWD'
                sh 'cat $PWD/telnet_shell_script.sh'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying ...\n'
            }
        }
    }
     
    post {
        always {
            echo "Running post stages code ..\n"
        }
    }
}
