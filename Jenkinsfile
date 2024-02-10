pipeline {
    agent any
    stages{
        stage ('Deploy to stage environment'){
            steps {
                sshagent(['jenkins-key']) {
                    sh 'ssh -t -t ubuntu@10.0.3.234 -o StrictHostKeyChecking=no "ansible-playbook -i /etc/ansible/stage_hosts /home/ubuntu/playbooks/stage-autodiscoscrpt.yml && ansible-playbook -i /etc/ansible/stage_hosts /home/ubuntu/playbooks/deployment.yml"'
                }
            }
        }
        stage ('Continous Testing'){
            steps {
                sshagent(['QAkey']) {
                    sh 'ssh -t -t ec2-user@10.0.3.127 -o StrictHostKeyChecking=no "rm -rvf /home/ec2-user/FunctionalTesting && git clone https://github.com/Daicon001/FunctionalTesting && java -jar /home/ec2-user/FunctionalTesting/k8FunctionalTest3.jar"'
                }
            }
        }
        stage('Send Notification'){
            steps{
                slackSend channel: 'jenkin-alert', message: 'App was deployed to staging environment and continuous testing was successfull. Needs approval to deploy to prod envrionment', teamDomain: 'daiconit', tokenCredentialId: 'slack-cred'
            }
        }
        stage ('Needs Approval'){
            steps{
                timeout(activity: true, time: 5) {
                    input message: 'Needs approval to deploy to prod environment', submitter: 'admin'
                }
            }
        }
        stage ('Deploy to production environment'){
            steps{
                sshagent(['jenkins-key']) {
                    sh 'ssh -t -t ubuntu@10.0.2.190 -o StrictHostKeyChecking=no "ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/prod-autodiscoscrpt.yml && ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/deployment.yml && ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/monitoring.yml"'
                }
            }
        }
            
    }
    post {
        success {
            slackSend channel: 'jenkin-alert', message: 'App has successfully been deployed to production environment', teamDomain: 'daiconit', tokenCredentialId: 'slack-cred'
        }
        failure {
            slackSend channel: 'jenkin-alert', message: 'Build fail. App is not deployed', teamDomain: 'daiconit', tokenCredentialId: 'slack-cred'
        }
    }
}