#!groovy



node {
  env.PATH += ":/root/terraform_29082019"

  stage ('Checkout') {
    checkout scm
  }
  stage ('Charge Variables' ) {
    sh 'source /var/lib/jenkins/.charge_var_aws.sh'
  }
  stage ('Terraform init Ali') {
    sh 'terraform init'
  }
  stage ('Terraform Plan Ali') {
    sh 'terraform plan'
  }

  // Optional wait for approval
  // input 'Voulez-vous déployer la stack Ali?'

  stage ('Terraform Apply Ali') {
    sh 'terraform apply -auto-approve'
  }

  stage ('Post Run Tests') {
    echo "Insert your infrastructure test of choice and/or application validation here."
    sleep 2
    sh 'terraform show'
  }

}
