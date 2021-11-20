pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('5d9444c7-7934-40ae-b8ab-9e6035e6f8ab')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t nabanita93/samplejavaapp:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push nabanita93/samplejavaapp:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
