#!groovy

// Build Parameters
properties([ parameters([
  string( name: 'AWS_ACCESS_KEY_ID', defaultValue: ''),
  string( name: 'AWS_SECRET_ACCESS_KEY', defaultValue: '')
  string( name: 'AWS_SESSION_TOKEN', defaultValue: '')
]), pipelineTriggers([]) ])

// Environment Variables
env.AWS_ACCESS_KEY_ID = AWS_ACCESS_KEY_ID
env.AWS_SECRET_ACCESS_KEY = AWS_SECRET_ACCESS_KEY
env.AWS_SESSION_TOKEN = AWS_SESSION_TOKEN

node {
  env.PATH += ":/root/terraform_29082019"

  stage ('Checkout') {
    checkout scm
  }
  stage ('Terraform init Ali') {
    sh 'terraform init'
  }
  stage ('Terraform Plan Ali') {
    sh 'terraform plan'
  }

  // Optional wait for approval
  input 'Voulez-vous déployer la stack Ali?'

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
