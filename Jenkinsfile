
node {
    deleteDir()
     stage("checkoutSCM") {
         checkout scm
     }
    stage("iac-prereqisites"){
         sh "/var/lib/jenkins/terraform --version"
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