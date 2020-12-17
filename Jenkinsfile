
node {
    deleteDir()
     stage("checkoutSCM") {
         checkout scm
     }
    stage("iac-prereqisites"){
        sh "/var/lib/jenkins/terraform --version"
        Map config=[:]
        String servicePrincipleId = config['servicePrincipleId'] ?: 'azureserviceprincipalid'

        withCredentials([azureServicePrincipal(servicePrincipleId)]) {
            String cloudName = config['cloudName'] ?: 'AzureCloud'
            String subscriptionId = config['subscriptionId'] ?: AZURE_SUBSCRIPTION_ID
            String azLoginCmd = "sudo /root/bin/az login --service-principal"
            azLoginCmd = "${azLoginCmd} --tenant ${AZURE_TENANT_ID}"
            azLoginCmd = "${azLoginCmd} --username ${AZURE_CLIENT_ID}"
            azLoginCmd = "${azLoginCmd} --password ${AZURE_CLIENT_SECRET}"

            sh("sudo /root/bin/az cloud set --name ${cloudName}")
            sh(azLoginCmd)
            sh("sudo /root/bin/az account set -s ${subscriptionId}")
        }
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