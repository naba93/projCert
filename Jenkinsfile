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
		
		stage('Deploy to K8s')
		{
			steps{
				sshagent(['k8s-jenkins'])
				{
					sh 'scp -r -o StrictHostKeyChecking=no node-deployment.yaml ubuntu@18.219.105.37:/home/ubuntu/'
					
					script{
						try{
							sh 'ssh ubuntu@18.219.105.37 kubectl apply -f /home/ubuntu/node-deployment.yaml --kubeconfig=/home/ubuntu/kube.yaml'

							}catch(error)
							{

							}
					}
				}
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
