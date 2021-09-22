docker_build_Application:
	docker build . --file Dockerfile --tag akash007045/flask_app:latest

docker_build_logstash:
	cd ./logging
	docker build . --file Dockerfile --tag akash007045/logstash:latest

kubernetes_deploy:
	kubectl apply -f deployment.yaml

kubernetes_service:
	kubectl expose deployment flask-deployment --type=NodePort --name=flask-service
