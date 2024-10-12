pipeline{
    agent any
    stages{
	stage('Build and push') {
            steps {
                script {
                    if (env.GIT_BRANCH == 'origin/dev') {
			git url:"https://github.com/saravjeetsingh9255/Project-Guvi-React-application.git",branch: "dev"
                        // Build Docker image
                        sh "chmod 777 build.sh"
                        sh "bash build.sh"
                        // Push Docker image to dev repo
                        withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerhubpass",usernameVariable:"dockerhubuser")]){
                            sh "docker tag react-app-test-deploy ${env.dockerhubuser}/dev:latest "
			    sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubpass}"
			    sh "docker push ${env.dockerhubuser}/dev:latest"}
                    } else if (env.GIT_BRANCH == 'origin/master') {
			git url:"https://github.com/saravjeetsingh9255/Project-Guvi-React-application.git",branch: "master"
                        // Build Docker image
                        sh "chmod 777 build.sh"
                        sh "bash build.sh"
                        // Push Docker image to prod repo
                        withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerhubpass",usernameVariable:"dockerhubuser")]){
                            sh "docker tag react-app-test-deploy ${env.dockerhubuser}/prod:latest "
			    sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubpass}"
			    sh "docker push ${env.dockerhubuser}/prod:latest"}
                    }
                }
            }
        }
        stage("Deploy"){
            steps{
                echo "This is deploying the code"
                sh "chmod 777 deploy.sh"
                sh "bash deploy.sh"
            }
        }
    }
}
