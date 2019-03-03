pipeline {
    agent any
     
    stages {
        stage('Checkout: Code') {
            steps {
		echo "Checking project code.."
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
