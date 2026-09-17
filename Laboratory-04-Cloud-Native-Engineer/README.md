# Laboratory 04 – The Cloud-Native Engineer

## Mission Overview

This laboratory activity introduced me to cloud-native computing and containerization using Docker. I learned how containers are different from traditional Virtual Machines and why containers can be useful for deploying applications. Using the KillerCoda Playground, I practiced basic Docker commands and deployed an Nginx web server inside a container.

## Objectives

The objectives of this laboratory activity were to:

* Understand the difference between Virtual Machines and containers.
* Access and use a Docker-enabled Linux environment.
* Execute basic Docker CLI commands.
* Download and run an Nginx container.
* Configure port mapping for a containerized web server.
* Test the Nginx web server using `curl`.
* Manage the lifecycle of a Docker container.
* Document technical procedures using Markdown.
* Organize and update my GitHub Cloud Computing Portfolio.

## Docker Commands Executed

### Docker Verification

```bash
docker --version
```

Used to check the installed Docker version.

```bash
docker info
```

Used to check the current status of the Docker service.

### Nginx Deployment

```bash
docker pull nginx
```

Used to download the official Nginx image from Docker Hub.

```bash
docker run -d --name nginx-server -p 8080:80 nginx
```

Used to create and run the Nginx container in detached mode while mapping host port `8080` to container port `80`.

```bash
curl http://localhost:8080
```

Used to send a request to the Nginx server and verify that the web page was accessible.

### Container Management

```bash
docker ps
```

Used to display currently running containers.

```bash
docker stop nginx-server
```

Used to stop the Nginx container.

```bash
docker ps -a
```

Used to display both running and stopped containers.

```bash
docker rm nginx-server
```

Used to remove the stopped Nginx container.

## Skills Learned

Through this activity, I learned how to use Docker in a Linux environment and became familiar with several basic Docker commands. I learned how to pull an image, create and run a container, map a network port, test a web server, stop a container, and remove it. I also learned the basic differences between Virtual Machines and containers. In addition, I practiced creating technical documentation using Markdown and organizing screenshots and files in GitHub.

## Challenges Encountered

One challenge I encountered was becoming familiar with Docker commands and understanding what each option in a command means. I also needed to understand how port mapping allows a service inside a container to be accessed from the host. Another challenge was checking the container after stopping it because `docker ps` only displays running containers. I learned that `docker ps -a` can be used to view stopped containers. By carefully observing the terminal output and following each step, I was able to complete the Docker deployment and container lifecycle activities.

## Screenshots

The screenshots used as evidence for this laboratory activity are located in the `screenshots` folder.

* `docker-version.png` – Docker installation and status verification
* `nginx-running.png` – Successful Nginx web server test
* `container-lifecycle.png` – Container lifecycle operations

