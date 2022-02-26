pipeline {
    agent {label 'mvn' }
    tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "Terraform"
    }
    parameters {
        string(name: 'WORKSPACE', defaultValue: 'development', description:'setting up workspace for terraform')
    }
    environment {
        TF_HOME = tool('Terraform')
        TP_LOG = "WARN"
        PATH = "$TF_HOME:$PATH"

    }
    stages {
        stage('TerraformInit'){
            steps {
                  
                    sh "terraform init -input=false"
                    sh "echo \$PWD"
                    sh "whoami"
                
            }
        }

        stage('TerraformFormat'){
            steps {
                  
                    sh "terraform fmt -list=true -write=false -diff=true -check=true"
               
            }
        }

        stage('TerraformValidate'){
            steps {
                
                    sh "terraform validate"
                
            }
        }

        stage('TerraformPlan'){
            steps {
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'test-user-aws',secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]){
                    sh " terraform plan -out terraform.tfplan"
 
                
            }
        }
        }    
        stage('TerraformApply'){
            steps {withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'test-user-aws',secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]){
                            script{
                    def apply = false
                    try {
                        input message: 'Can you please confirm the apply', ok: 'Ready to Apply the Config'
                        apply = true
                    } catch (err) {
                        apply = false
                         currentBuild.result = 'UNSTABLE'
                    }
                    if(apply){
                          
                            unstash "terraform-plan"
                            sh 'terraform apply terraform.tfplan --auto-approve' 
                        
                    }
                }    
            }

            }
        }
    }
}