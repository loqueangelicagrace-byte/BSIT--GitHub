# Docker Compose Guide

## 1. What does the `services:` block do?

The `services:` block defines the different containers or services that make up the application. In the Docker Compose file used in this mission, there are two services: `database` and `app`.

The `database` service uses the `mariadb:10.6` image and provides the database needed by Nextcloud. The `app` service uses the `nextcloud` image and provides the Nextcloud web application.

Using the `services:` block allows both containers to be defined and managed together as part of one application infrastructure.

## 2. How does the Nextcloud app container find the database container?

The Nextcloud application finds the database container through the `MYSQL_HOST` environment variable.

In the YAML file, the application contains:

```yaml
- MYSQL_HOST=database
```

The value `database` matches the name of the database service defined under `services:`.

Docker Compose creates a network for the services in the project. Because both the `app` and `database` services are connected to this network, the Nextcloud container can use the service name `database` to communicate with the MariaDB container.

This means the application does not need to use an IP address to locate the database.

## 3. Difference Between `docker run` and `docker-compose up -d`

The `docker run` command is normally used to create and start a single Docker container. It requires the user to provide the image and configuration options directly in the command.

For example, in Mission 4, `docker run` was used to deploy an Nginx container.

The `docker-compose up -d` command is used to create and start multiple services defined in a Docker Compose YAML file. Instead of entering all configuration options manually in one long command, the configuration is written in `docker-compose.yml`.

In this mission, Docker Compose started both the Nextcloud application and MariaDB database using one command.

The `-d` option runs the services in detached mode, allowing the containers to continue running in the background while the terminal remains available for other commands.

