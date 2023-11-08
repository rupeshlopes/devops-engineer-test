# devops-engineer-test
Repository for devops tech test

Cloud Run Standalone Example
This example showcases the full deployment Secure Cloud Run with harness infrastructure included.

## Task 1 == Steps Below

## Step 1
Create a Terraform directory locally or clone the public GitHub Repo

## Step 2
Update the provider.tf and replace `PROJECT_ID` with your project

## Step 3 to be followed
###############################
terraform init to get the plugins.
terraform plan to see the infrastructure plan.
terraform apply to apply the infrastructure build.


## Step 4 
Post sucessfull execution of the terraform apply / pipeline the output will display the service URL for the Hello Wold Application

service_url = "https://app-v2jtqt4naq-uc.a.run.app"

## Task 2 == Steps Below

## Step 1
The iam.tf will create a new service account with the invoker role to run cloud run

## Task 3 == Steps Below
Configuration of the Jenkins CI/CD pipeline has been listed below
Step 1: Install Terraform Plugin on Jenkins
Step 2: Install Terraform Binary
Step 3: Prepare the Terraform Config (The config is hosted on Github)
Step 4: Create a Jenkins Pipeline - TFJenkinsDemo

Step 5: Jenkins Pipeline Script

pipeline {
    agent any

    parameters {
      choice(
        name: 'Env',
        choices: ['DEV', 'QA', 'UAT', 'PROD'],
        description: 'Passing the Environment'
      )

       choice(
          choices: ['plan', 'apply', 'show', 'preview-destroy', 'destroy'],
           description: 'Terraform action to apply',
          name: 'action'
        )
    }

    stages {

      stage('Environment') {
        steps {
           echo " The environment is ${params.Env}"
        }
      }


        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: '<CREDS>', url: 'https://github.com/sumeetninawe/tf-tuts'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
      
        stage('Terraform action') {
            steps {
                sh 'terraform ${action} --auto-approve'
            }
        }
      
    }
}

Step 6: Configuring Access to GCP
Step 7: Testing the Pipeline - Navigate to: “Dashboard > TFJenkinsDemo

Step 8: Destroy the Infrastructure Using Jenkins

“Choice Parameters ”  used to configure the enviroments where the terraform scripts need to be deployed i.e. DEV/ QA / UAT/ PROD 
“Choice Parameters ” configured as below to supply " terraform apply or terraform destroy" 
