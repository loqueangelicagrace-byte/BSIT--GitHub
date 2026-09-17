# Docker Deployment

## 1. Check Docker Version

```bash
docker --version
```

This command displays the installed Docker version and confirms that Docker is available in the terminal.

## 2. Check Docker Status

```bash
sudo systemctl status docker
```

This command checks whether the Docker service is currently active and running.

## 3. Pull the Nginx Image

```bash
docker pull nginx
```

This command downloads the official Nginx image from Docker Hub and makes it available for creating a container.

## 4. Run the Nginx Container

```bash
docker run -d --name nginx-server -p 8080:80 nginx
```

This command creates and starts the Nginx container in the background. The `-p 8080:80` option connects port 8080 of the host to port 80 inside the container.

## 5. Test the Web Server

```bash
curl http://localhost:8080
```

This command sends an HTTP request to the Nginx web server through port 8080 and displays the webpage response in the terminal.

If the deployment is successful, the output should contain the Nginx welcome page.

## 6. List Running Containers

```bash
docker ps
```

This command displays the Docker containers that are currently running. The `nginx-server` container should appear in the list.

## 7. Stop the Container

```bash
docker stop nginx-server
```

This command stops the running Nginx container while keeping the container available for later management.

## 8. Verify the Container

```bash
docker ps
```

This command checks the running containers and confirms that the Nginx container is no longer running.

```bash
docker ps -a
```

This command displays all containers, including stopped containers, allowing the stopped `nginx-server` container to be verified.

## 9. Remove the Container

```bash
docker rm nginx-server
```

This command removes the stopped Nginx container from the Docker environment.

## Evidence

The screenshots for the Docker installation, Nginx deployment, and container lifecycle operations are stored in the `screenshots` folder.

* `docker-version.png` – Docker version and status verification
* `nginx-running.png` – Successful Nginx web server test
* `container-lifecycle.png` – Container lifecycle commands and results

