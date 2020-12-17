
node {
    deleteDir()
     stage("checkoutSCM") {
         checkout scm
     }
    stage("iac-prereqisites"){
        sh "/var/lib/jenkins/terraform --version"
        export ARM_CLIENT_ID="01bc024b-aa5b-4719-840c-29b7a3dff875"
        export ARM_CLIENT_SECRET="IOB_Bj.T5AheL18zg._ErdEfr8296f.ckC"
        export ARM_SUBSCRIPTION_ID="cb10d8f8-978c-4bfc-8c34-d26443752202"
        export ARM_TENANT_ID="777c1949-a60f-47dc-a0d1-457fa0e2b4a6"

//        Map config=[:]
//        String servicePrincipleId = config['servicePrincipleId'] ?: 'azureserviceprincipalid'
//
//        withCredentials([azureServicePrincipal(servicePrincipleId)]) {
//            String cloudName = config['cloudName'] ?: 'AzureCloud'
//            String subscriptionId = config['subscriptionId'] ?: AZURE_SUBSCRIPTION_ID
//            String azLoginCmd = "sudo /root/bin/az login --service-principal"
//            azLoginCmd = "${azLoginCmd} --tenant ${AZURE_TENANT_ID}"
//            azLoginCmd = "${azLoginCmd} --username ${AZURE_CLIENT_ID}"
//            azLoginCmd = "${azLoginCmd} --password ${AZURE_CLIENT_SECRET}"
//            echo "checking for $subscriptionId"
//            sh("sudo /root/bin/az cloud set --name ${cloudName}")
//            sh(azLoginCmd)
//            sh("sudo /root/bin/az account set -s ${subscriptionId}")
//        }
    }
    dir("${terraform_directory}") {
        echo "=========================================== Initializing Terraform ==========================================="
        sh "/var/lib/jenkins/terraform init"
        sh "/var/lib/jenkins/terraform plan"
        echo "=========================================== Provisioning infrastructure ==========================================="
        sh "/var/lib/jenkins/terraform apply --auto-approve"
        if(destroy) {
            echo "=========================================== Deprovisioning Infrastructure ==========================================="
            sh "/var/lib/jenkins/terraform destroy --auto-approve"
        }
    }

}