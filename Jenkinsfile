pipeline {
    agent any

    stages {
        stage('fmt') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
            	   ]]) {
                    dir ("web") {
                        sh 'terraform init'
                        sh 'terraform fmt'
                    }
            	   }
            }
        }
    }	
    stages {
        stage('fmt') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
            	   ]]) {
                    dir ("web") {
                        sh 'terraform init'
                        sh 'terraform fmt'
                    }
            	   }
            }
        }
    }
} 
