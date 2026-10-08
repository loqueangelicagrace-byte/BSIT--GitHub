# Mission 6 - The Cloud Deployment Engineer

## Mission Overview

Mission 6 focuses on deploying a multi-tier private cloud storage system using Docker Compose. The application consists of Nextcloud as the web/application tier and MariaDB as the database tier. Docker Compose is used to define and deploy both containers together using a YAML configuration file.

## Objectives

* Understand the concept of a two-tier application architecture.
* Understand the structure and purpose of a `docker-compose.yml` file.
* Use a Linux command-line text editor to create configuration files.
* Deploy Nextcloud and MariaDB using Docker Compose.
* Verify the running containers.
* Access the Nextcloud web interface through port 8080.
* Document Infrastructure as Code (IaC) concepts using Markdown.

## Commands Executed

```bash
mkdir nextcloud-deployment
cd nextcloud-deployment
nano docker-compose.yml
docker-compose up -d
docker-compose ps
docker-compose down
```

## Skills Learned

Through this mission, I learned how to create a Docker Compose configuration for a multi-container application. I also learned how separate application and database containers communicate using environment variables and Docker Compose service names.

I practiced using YAML configuration files, deploying multiple containers at the same time, checking container status, accessing a web application through a mapped port, and safely stopping the entire application stack.

This activity also helped me understand Infrastructure as Code because the deployment configuration can be written once and used to manage the application environment consistently.

