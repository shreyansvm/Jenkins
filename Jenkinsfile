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
                sh 'cat telnet_shell_script.sh'
                sh 'chmod 777 test_shell_script.sh'
                sh 'cat test_shell_script.sh'
   		sh 'sleep 5'
                sh './test_shell_script.sh'
		withCredentials([string(credentialsId: 'MY_TESTLINUX_HOST', variable: 'linux_host'), string(credentialsId: 'MY_TESTLINUX_USER', variable: 'linux_user'), string(credentialsId: 'MY_TESTLINUX_PASSWD', variable: 'linux_pass')]) {
   		    echo "inside withCrendentials block\n"
		}

            }
        }
	stage('Test-SSH') {
			node('Test-ssh-node') {
				def remote = [:]
  				remote.name = 'testlinux12'
  				remote.host = $MY_TESTLINUX_HOST
 				remote.user = $MY_TESTLINUX_USER
  				remote.password = $MY_TESTLINUX_PASSWD
  				remote.allowAnyHosts = true
			} 
                steps {
                	echo "In Test-SSH stage\n"
		}
	}
        stage('Deploy') {
            steps {
                	echo 'Current Build is successful.. Deploying ...\n'
            }
        }
    }
     
    post {
        always {
            echo "Always running post stages code ..\n"
        }
    }
}
