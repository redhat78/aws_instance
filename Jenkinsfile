#!groovy
@Library('github.com/releaseworks/jenkinslib') _

// Build Parameters


  sh 'aws sts assume-role --role-arn arn:aws:iam::093469567457:role/SuperAdminRole --role-session-name SuperAdminRole'
withAWS(role: 'arn:aws:iam::093469567457:role/SuperAdminRole', ) {
  sh 'aws s3api list-buckets'

node {
  env.PATH += ":/root/terraform_29082019"

  stage ('Checkout') {
    checkout scm
  }

  stage ('aws sts assume-role') {
    sh 'aws sts assume-role --role-arn arn:aws:iam::093469567457:role/SuperAdminRole --role-session-name SuperAdminRole'
  }

  withAWS(role: 'arn:aws:iam::093469567457:role/SuperAdminRole', ) {
    sh 'aws s3api list-buckets'
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

  stage ('Notification') {
    mail from: "a.hadj-chaib@si2m.fr",
         to: "a.hadj-chaib@si2m.fr",
         subject: "Terraform build complete",
         body: "Jenkins job ${env.JOB_NAME} - build ${env.BUILD_NUMBER} complete"
  }
}
