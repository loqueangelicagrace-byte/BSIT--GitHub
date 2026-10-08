# Mission Reflection

## 1. How does writing a `docker-compose.yml` file make a cloud engineer's job easier compared to manually typing commands?

Writing a `docker-compose.yml` file makes deployment easier because all the configuration is stored in one file. Instead of manually typing many Docker commands for each container, a cloud engineer can define the services, images, ports, environment variables, and other settings in the YAML file. The same configuration can then be reused whenever the application needs to be deployed again.

## 2. What happens if you make an indentation error (like using a Tab instead of Spaces) in a YAML file?

A YAML indentation error can cause the configuration to become invalid. YAML depends on proper spacing to understand the relationship between different settings. If a Tab is used instead of spaces or the indentation is incorrect, Docker Compose may display an error and fail to read or deploy the configuration. This showed me why careful formatting is important when working with infrastructure files.

## 3. Why did we use environment variables (like `MYSQL_PASSWORD`) in the Compose file?

Environment variables were used to provide configuration values to the containers, especially the database credentials and database name. They allow the Nextcloud application and MariaDB database to use the same required settings without hard-coding those values into the application itself. This also makes the deployment easier to configure and modify.

## 4. How did it feel to deploy a fully functional enterprise cloud storage system (Nextcloud) in just a few minutes?

It felt convenient and impressive to deploy Nextcloud in only a few minutes. Using Docker Compose allowed the application and database to be started together with a simple command. Seeing the Nextcloud dashboard running in the browser helped me understand how containers can simplify the deployment of real-world cloud applications.

## 5. How has your understanding of Cloud Computing evolved since Mission 1?

Since Mission 1, my understanding of Cloud Computing has become more practical. I learned that cloud computing is not only about using online services but also involves deployment, networking, storage, containers, databases, and automation. This mission helped me understand how different components can work together to create a functional cloud application.

