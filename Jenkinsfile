pipeline{
    agent any
    environment{
      Name = "Mikash"
      AWS_ACCESS_KEY_ID  = credentials('my-aws-key')
      AWS_SECRET_ACCESS_KEY = credentials('my-aws-key')
      AWS_REGION = "us-east-1"
    }
    stages{
    stage("pull the code from the git hub"){
            steps{
                git 'https://github.com/Vikash911/Terraform-Project.git'
            }
        }
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Plan') {
      steps {
        sh 'terraform plan'
      }
    }
    stage('Terraform Apply') {
      steps {
        sh 'terraform apply -auto-approve'
      }
        }
    stage('Pause for 60  Seconds') {
       steps {
        echo 'Pausing for 5 minutes...'
        sleep time: 60, unit: 'SECONDS'
        echo 'Resuming pipeline execution'
    }
}

   stage('Next Stage approval') {
            steps {
                
            
            script {
                Boolean userInput = input(id: 'Proceed1', message: 'Promote build?', parameters: [[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Please approve me to go ahead to next job ?']])
                echo 'userInput: ' + userInput

                if(userInput == true) {
                    // do action
                } else {
                    // not do action
                    echo "Action was aborted."
                }
            
                
            }
        }
        }
  stage('Trigger my-next-job') {
    steps {
        echo 'Triggering my-next-job...'
        build job: 'anible-p'
    }
}

   stage('delete infra') {
            steps {


            script {
                Boolean userInput = input(id: 'Proceed1', message: 'Promote build?', parameters: [[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Please confirm you agree to destroy the infra ?']])
                echo 'userInput: ' + userInput

                if(userInput == true) {
                    // do action
                } else {
                    // not do action
                    echo "Action was aborted."
                }


            }
        }
        }


  stage('Destroy the envirnoment'){
    steps{
		
	sh 'terraform destroy -auto-approve'		

    }

    }
}
}
