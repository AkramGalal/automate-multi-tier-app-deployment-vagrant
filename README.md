# automate-multi-tier-app-deployment-vagrant
Automate the deployment of a microservice Java app using Vagrant with Bash scripts. The application architecture is composed of 5 microservices, each one will be deployed on a separate VM, they are: Load Balancer (Nginx), Application written in Java (Maven + Tomcat), Database (MariaDB). Cashing engine (Memcached), and Massage Bus/Queue (RabbitMQ).
