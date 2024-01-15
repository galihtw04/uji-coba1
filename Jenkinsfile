pipeline {
    agent {
           label 'master01'
    }
    stages{
        stage("checkout"){
            steps{
                checkout scm
            }
        }
        stage("Build Image"){
            steps{
                sh 'sudo docker build -t registry-nexus.cloud/apps-caculator:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'registry-docker', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    sh 'sudo docker login registry-nexus.cloud -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh 'sudo docker push registry-nexus.cloud/apps-caculator:latest'
                    sh 'sudo docker logout'
                }
            }
        }

      stage('Docker RUN') {
          steps {
      	     sh 'sudo docker run -d -p 3000 --name app-caculator  registry-nexus.cloud/apps-caculator:latest'
      }
    }
 }
}
