pipeline {
  agent any

  environment {
    IMAGE_NAME = "Livinglazer/simple-node-app"
  }

  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/Livinglaser3/Jenkins.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          docker.build("${IMAGE_NAME}:latest")
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withDockerRegistry([credentialsId: 'Test', url: '']) {
          script {
            docker.image("${IMAGE_NAME}:latest").push()
          }
        }
      }
    }

    stage('Run Container') {
      steps {
        sh 'docker rm -f app || true'
        sh 'docker run -d --name app -p 3000:3000 yourdockerhubusername/simple-node-app:latest'
      }
    }
  }
}
