pipeline {
    agent any

    parameters {
        string(name: 'TenantName', description: 'TenantName Here')
        choice(name: 'Environment', description: 'Environment Here', choices: 'dev\nqa\nloadtest\ndemo\nprod')
        choice(name: 'DeployLine', description: 'Deploy Line Here' , choices: 'a\nb\nc\nd')
        string(name: 'PodsName', description: 'Pod name to be delete' )
        choice(name: 'KUBE_CONFIG' , description: 'Please select the kube_config file', choices: 'US_EAST_1\nUS_WEST_1\nAP_SOUTHEST_1\nAP_SOUTHEST_2\nEU_WEST_1\nDEV')
        string(name: 'IPAddress', description: 'Write IP Address' )
        string(name: 'Port', description: 'Write Port' ) 
        }



    environment {
        // TenantName = "${params.TenantName}"
        // Environment = "${params.Environment}"
        // DeployLine =  "${params.DeployLine}"
        KUBE_CONFIG     = "${params.KUBE_CONFIG}"
        KUBE_NAMESPACE  = "${params.Environment}-${params.TenantName}-${params.DeployLine}"
        PODS_NAME       = "${params.PodsName}"
        PODS_IP         = "${params.IPAddress}-${params.Port}"
    

   
                
                script {
                    sh """#!/bin/bash
                    kubectl -n ${KUBE_NAMESPACE} get pods
                    kubectl exec --stdin --tty ${POD_NAME} -n ${KUBE_NAMESPACE}  -- /bin/bash 
                    sudo yum install telnet -y
                    telnet  ${PODS_IP}               
                    """
                }
               
            }

        }
    }
    post {
        success {
            //notifyBuild("SUCCESSFUL")
            sh "echo success"
        }
        failure {
            //notifyBuild("FAILED")
            sh "echo fail"
        }
    }
}

    