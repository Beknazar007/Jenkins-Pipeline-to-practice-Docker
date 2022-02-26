pipeline {
  agent  any
    stages {

      stage ('Checkout SCM'){
        steps {
          checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [] ])
        }
      }

     
      stage('Set Terraform path') {
       steps {
         script {
            def tfHome = tool name: 'Terraform'
            env.PATH = "${tfHome}:${env.PATH}"
         }
     }
  }
  stage('terraform init') {
 
       steps {
            
                script {
                                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'test-user-aws',secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'terraform init -no-color'
                    }
              
           }
        }
      }

  stage('terraform Plan') {
 
       steps {
           
            
               script {
                                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'test-user-aws',secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]){
                    sh 'terraform plan  '
                    }
                
            }
        }
      }

  stage('Waiting for Approvals') {
            
      steps{
          input('Plan Validated? Please approve to create VPC Network in AWS?')
			  }
      }    

  stage('terraform Apply') {
 
       steps {
            
            
              script {
                                    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'test-user-aws',secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]){
                    sh 'terraform apply -no-color -auto-approve plan.out'
                    sh "terraform output"
                    }
               
            
           }
        }
      }
   }
}