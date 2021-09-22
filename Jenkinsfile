node {    
      def app     
      stage('Clone repository') {               
             
            checkout scm 
      }     
      stage('Build Application image') {         
       
            sh 'make docker_build_Application'   
       }
      stage('Build logging image') {
       
            sh 'make docker_build_logstash'          
       }
      stage('Deploy on cluster') {

            sh 'make kubernetes_deploy'      
       }
      stage('Deploy Serice') {

            sh 'make kubernetes_service'
       }      
     }
