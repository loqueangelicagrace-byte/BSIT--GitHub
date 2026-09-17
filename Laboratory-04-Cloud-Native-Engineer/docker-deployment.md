# Docker Deployment

## Docker Environment

### Check Docker Version

```bash
docker --version
```

This command displays the installed Docker version and confirms that Docker is available in the terminal.

### Check Docker Status

```bash
sudo systemctl status docker
```

This command checks whether the Docker service is currently running.

## Nginx Deployment

### Pull the Nginx Image

```bash
docker pull nginx
```

This command downloads the official Nginx image from Docker Hub.

### Run the Nginx Container

```bash
docker run -d --name nginx-server -p 8080:80 nginx
```

This command creates and starts the Nginx container in the background and connects host port 8080 to container port 80.

### Test the Web Server

```bash
curl http://localhost:8080
```

This command sends a request to the Nginx web server and displays the returned webpage content.

## Container Lifecycle

### List Running Containers

```bash
docker ps
```

This command displays the Docker containers that are currently running.

### Stop the Container

```bash
docker stop nginx-server
```

This command stops the running Nginx container.

### Verify the Container Is Stopped

```bash
docker ps
```

This command checks the running containers and confirms that the Nginx container is no longer running.

### View All Containers

```bash
docker ps -a
```

This command displays both running and stopped containers.

### Remove the Container

```bash
docker rm nginx-server
```

This command removes the stopped Nginx container from the Docker environment.

### Verify the Container Removal

```bash
docker ps -a
```

This command checks the container list and confirms that the Nginx container has been removed.

## Evidence

The screenshots for this activity are stored in the `screenshots` folder.

- `docker-version.png` – Docker version and status verification
- `nginx-running.png` – Successful Nginx web server test
- `container-lifecycle.png` – Container lifecycle operations
