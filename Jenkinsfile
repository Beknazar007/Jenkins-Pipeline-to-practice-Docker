pipeline {
    agent any

    // parameters {
    //     string(name: 'TenantName', description: 'TenantName Here')
    //     choice(name: 'Environment', description: 'Environment Here', choices: 'dev\nqa\nloadtest\ndemo\nprod')
    //     // choice(name: 'DeployLine', description: 'Deploy Line Here' , choices: 'a\nb\nc\nd')
    //     string(name: 'PodsName', description: 'Pod name to be delete' )
    //     // choice(name: 'KUBE_CONFIG' , description: 'Please select the kube_config file', choices: 'US_EAST_1\nUS_WEST_1\nAP_SOUTHEST_1\nAP_SOUTHEST_2\nEU_WEST_1\nDEV')
    //     string(name: 'IPAddress', description: 'Write IP Address' )
    //     string(name: 'Port', description: 'Write Port' ) 
    //     }



    // environment {
    //     // TenantName = "${params.TenantName}"
    //     // Environment = "${params.Environment}"
    //     // DeployLine =  "${params.DeployLine}"
    //     // KUBE_CONFIG     = "${params.KUBE_CONFIG}"
    //     // KUBE_NAMESPACE  = "${params.Environment}-${params.TenantName}-${params.DeployLine}"
    //     PODS_NAME       = "${params.PodsName}"
    //     PODS_IP         = "${params.IPAddress}-${params.Port}"
    

    stages{
        stage('LOGIN TO CLUSTER'){
            steps{
                script{
                    withCredentials([file(credentialsId: 'KUBE_CONFIG', variable: 'KUBE_CONFIG_FILE')]) {
                        // Setting kube config
                    sh 'pwd'
                    sh 'ls -la'
                    sh 'ip a'
                    sh 'touch beki.file'
                    // sh """kubectl -n birinchi get pods
                    // kubectl config set-context --current --namespace=birinchi
                    // kubectl exec --stdin --tty ngnix   -- /bin/bash
                    // sudo yum update -y
                    // sudo yum install telnet -y
                    // sleep 5
                    // telnet version
                    
                    // """
                    
                }
                }
                // script {
                //     sh """#!/bin/bash
                //     kubectl -n ${KUBE_NAMESPACE} get pods
                //     echo "[INFO] Deleting inactive \"${PODS_NAME}\" pods in \"${KUBE_NAMESPACE}\""
                //     kubectl delete pods \$(kubectl get pods -n ${KUBE_NAMESPACE} | grep ${PODS_NAME} | awk '{print \$1}') -n ${KUBE_NAMESPACE}
                //     echo "[INFO] Current pods in \"${KUBE_NAMESPACE}\""
                //     sleep 5
                //     kubectl -n ${KUBE_NAMESPACE} get pods
                //     """
                // }
               
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

    