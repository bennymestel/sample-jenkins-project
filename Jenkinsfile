pipeline {
    agent any
    
    stages {
        stage('Checkout SCM') {
        	steps {
        		checkout scm
        	}
        }	
        stage('Build') {
            steps {
                echo "Starting the Build stage"
                sh 'docker build . -t app:latest'
            }
         }    
        stage('Test') {
        	steps {
        		echo "Starting the Test stage"
        		sh 'python test.py'
        	}
        } 
        stage('Deploy') {
        	when {
        		expression {
        			currentBuild.result == null || currentBuild.result == 'SUCCESS'
        		}
        	}	
        	steps {
        		echo "Starting the Deploy stage"
        		sh 'docker push app:latest'
        	} 
       }
   }    
post {
	always {
		echo 'Pipeline finished'
	}
	success {
	echo 'Pipeline succeeded'
}
	failure {
		echo 'Pipeline failed'
		mail body: "<b>Bennys</b><br>\n<br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", charset: 'UTF-8', from: 'jenkins@myproject.com', mimeType: 'text/html', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "bennymestel@gmail.com";
	}
}
}
