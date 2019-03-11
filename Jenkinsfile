
pipeline {
    
    agent {
    	dockerfile true
    }

    options {
		// Specifying a global execution timeout of one hour, after which Jenkins will abort the Pipeline run.
	     timeout(time: 180, unit: 'SECONDS')
		
		// timestamps() 
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

		stage('Docker-Hello-World') {
			steps {
				sh 'sudo docker run hello-world'
			}
		}
    
	}

}
