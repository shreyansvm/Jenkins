def return_linux_host() {
	withCredentials([string(credentialsId: 'MY_TESTLINUX_HOST', variable: 'linux_host')]) {
		echo "\tReturning linux_host"
		return $linux_host
	}
}

def return_linux_user() {
	withCredentials([string(credentialsId: 'MY_TESTLINUX_USER', variable: 'linux_user')]) {
		echo "\tReturning linux_user"
		return $linux_user
	}
}

def return_linux_pass() {
	withCredentials([string(credentialsId: 'MY_TESTLINUX_PASSWD', variable: 'linux_pass')]) {
		echo "\tReturning linux_pass"
		return $linux_pass
	}
}

withCredentials([string(credentialsId: 'MY_TESTLINUX_HOST', variable: 'linux_host'), string(credentialsId: 'MY_TESTLINUX_USER', variable: 'linux_user'), string(credentialsId: 'MY_TESTLINUX_PASSWD', variable: 'linux_pass')]) {
	echo "linux_host - $linux_host"
	echo "linux_user - $linux_user"
}

def remote = [:]
remote.allowAnyHosts = true
remote.name = "smulkutk"
remote.host = "smulkutk.abc.com"
remote.user = "smulkutk"
remote.password = "smulkutk"

pipeline {
    agent any
    options {
	// Specifying a global execution timeout of one hour, after which Jenkins will abort the Pipeline run.
        timeout(time: 180, unit: 'SECONDS')
	
	// timestamps() 
    }

    environment {
	// specifies a sequence of key-value pairs which will be defined as environment variables for the all steps, or stage-specific steps, depending on where the environment directive is located within the Pipeline.

	MY_TESTLINUX_HOST   = credentials('MY_TESTLINUX_HOST')
	MY_TESTLINUX_USER   = credentials('MY_TESTLINUX_USER')
	MY_TESTLINUX_PASSWD = credentials('MY_TESTLINUX_PASSWD')
    }

    parameters {
	// The parameters directive provides a list of parameters which a user should provide when triggering the Pipeline. 
	// The values for these user-specified parameters are made available to Pipeline steps via the params object.
	// Example :
	string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
	// 	Later in the stages->stage->steps it can be access as :
	//		echo "Hello ${params.PERSON}"
    }

    triggers {
	// The triggers directive defines the automated ways in which the Pipeline should be re-triggered.
	// For Pipelines which are integrated with a source such as GitHub or BitBucket, triggers may not be necessary as webhooks-based integration will likely already be present. 
	// The triggers currently available are cron, pollSCM and upstream.
	// 	Example : cron('H */4 * * 1-5')

	pollSCM('* * * * *')
    }

    stages {
	// Containing a sequence of one or more stage directives, the stages section is where the bulk of the "work" described by a Pipeline will be located.	

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
				
				// remote.name = $MY_TESTLINUX_USER
				// remote.host = $MY_TESTLINUX_HOST
				// remote.user = $MY_TESTLINUX_USER
				// remote.password = $MY_TESTLINUX_PASSWD
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
	// The post section defines one or more additional steps that are run upon the completion of a Pipeline’s or stage’s run (depending on the location of the post section within the Pipeline).
	// 'post' can support any of of the following post-condition blocks: always, changed, fixed, regression, aborted, failure, success, unstable, unsuccessful, and cleanup. 

        always {
            echo "Always running post stages code ..\n"
        }
        failure {
            echo "Jenkins job - ${env.JOB_NAME} build-id - ${env.BUILD_ID} running on ${env.JENKINS_URL} has FAILED"
	}
    }
}
