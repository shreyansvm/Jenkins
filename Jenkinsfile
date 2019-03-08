withCredentials([string(credentialsId: 'MY_TESTLINUX_HOST', variable: 'linux_host'), string(credentialsId: 'MY_TESTLINUX_USER', variable: 'linux_user'), string(credentialsId: 'MY_TESTLINUX_PASSWD', variable: 'linux_pass')]) {
	echo "linux_host - $linux_host"
	echo "linux_user - $linux_user"
}

def remote = [:]
remote.name = "smulkutk"
remote.host = "testlinux12.us.alcatel-lucent.com"
remote.user = "smulkutk"
remote.password = "tigris"
remote.allowAnyHosts = true

pipeline {
    agent any
    environment {
	MY_TESTLINUX_HOST   = credentials('MY_TESTLINUX_HOST')
	MY_TESTLINUX_USER   = credentials('MY_TESTLINUX_USER')
	MY_TESTLINUX_PASSWD = credentials('MY_TESTLINUX_PASSWD')
	
	remote.name = credentials('MY_TESTLINUX_USER')
	remote.host = credentials('MY_TESTLINUX_HOST')
	remote.user = credentials('MY_TESTLINUX_USER')
	remote.password = credentials('MY_TESTLINUX_PASSWS')
    }
    stages {
	stage('Build-Details') {
	    steps {
		echo "Running ${env.JOB_NAME} ${env.BUILD_ID} on ${env.JENKINS_URL}"
	    }
	}
        stage('Checkout: Code') {
            steps {
		echo "Pulling project code.."
                echo "\tcall exact steps to checkout code from your project repo ..\n"
            }
        }
        stage('Updates') {
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
                steps {

			withCredentials([string(credentialsId: 'MY_TESTLINUX_HOST', variable: 'linux_host'), string(credentialsId: 'MY_TESTLINUX_USER', variable: 'linux_user'), string(credentialsId: 'MY_TESTLINUX_PASSWD', variable: 'linux_pass')]) {
				echo "linux_host - $linux_host"
				echo "linux_user - $linux_user"
			}

			sshCommand remote: remote, command: "pwd"
			sshCommand remote: remote, command: "./run_mg_express.sh"

                	echo "In Test-SSH stage\n"
                        sshagent(['SSH_testlinux_username_passwd']) {
				sh 'pwd'
				echo "Inside Test-SSH stage, ssh-agent block"
			}
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
        failure {
            echo "Jenkins job - ${env.JOB_NAME} build-id - ${env.BUILD_ID} running on ${env.JENKINS_URL} has FAILED"
	}
    }
}
