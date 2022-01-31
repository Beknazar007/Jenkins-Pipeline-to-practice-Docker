pipeline{
    agent any
    stages{
        stage('Prepare environment'){
            steps{
                sh 'echo notify'
            }
        }

    }
    post{
        always{
            echo "Job execution complete."
        }
        success{
            archiveArtifacts artifacts : '*.jpg'
        }
        unsuccessful{
            echo "Job execution status is failed, please check error logs"
        }
        cleanup{
                echo 'Cleaning up environment'
                 
        }
    }
}