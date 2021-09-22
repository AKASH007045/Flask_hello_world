# Flask_hello_world Containerised demo application.

# Prerequisite:
Setup Docker and kubernetes local cluster in hostmachine.

Docker inStallation guide : https://docs.docker.com/get-docker/
Kubernetes installation guide : https://kubernetes.io/releases/download/

Jenkins setup is also required to test CI/CD using Jenkinsfile.


# Deployments.
This project is using make build process for deploying application on localmachine.
Steps :
1. make docker_build_Application.

(To build and tag application container)

2. make docker_build_logstash

(To build and tag sidecar container for application logging)

3. make kubernetes_deploy

(To deploy application on local kubernetes cluster)

4. make kubernetes_service

(To expose the application on service endpoint)


# CI/CD Details : 
We have used 2 approaches to acheive CI and CD deployment for this application.

1. Using Github Actions.

File Name : github_cicd_workflow.yaml

We have pushed and tested the workflow run in the github repository itself. This is just a demo file in the repository for understanding.

2. Using Jenkins:

   Filename: Jenkinsfile

   We have pushed the Jenkinsfile in repository. Set up a Multibranch pipeline project in jenkins console and configure the branch source as       "https://github.com/AKASH007045/Flask_hello_world.git". 
   keep rest of the settings as it is.

# Uptime/Downtime Detection.
We have used liveness probe in our deployment yaml to keep the check on application pods health.
For enhance monitoring : 
1. We have setup an sidecar container to capture application logs, which could be used to setup an alerting around slack or email based on error messages.
2. A seperate container running cronjob could also be maintained to do uptime monitoring.

#Miscellaneous
We have added a logstash sidecar container which could be used to ship and analyse application logs. We have also setup and using a shared volume for application logging.

# Folder Structure :
Dockerfile : Dockerfile to build flask application.

Makefile : Defines set of tasks to be executed for deploying this application.

app.py : We have modified this file to add a custom route for healthcheck endpoint.

deployment.yaml : Deployment template to be used for application deployment.


logging : Folder containing sidecar container i.e;"logstash" setup and Dockerfile.
