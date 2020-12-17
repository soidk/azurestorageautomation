
node {
    deleteDir()
     stage("checkoutSCM") {
         checkout scm
     }
    stage("iac-prereqisites"){
        sh "/var/lib/jenkins/terraform --version"
//        sh "export ARM_CLIENT_ID=01bc024b-aa5b-4719-840c-29b7a3dff875"
//        sh "export ARM_CLIENT_SECRET=IOB_Bj.T5AheL18zg._ErdEfr8296f.ckC"
//        sh "export ARM_SUBSCRIPTION_ID=cb10d8f8-978c-4bfc-8c34-d26443752202"
//        sh "export ARM_TENANT_ID=777c1949-a60f-47dc-a0d1-457fa0e2b4a6"
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