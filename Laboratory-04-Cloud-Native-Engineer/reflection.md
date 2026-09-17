# Mission Reflection

This laboratory activity helped me understand the difference between Virtual Machines and Docker containers and how containerization can be useful in cloud computing. One of the biggest differences I noticed is the boot time and setup process. A Virtual Machine needs a complete operating system to be installed and started, which usually requires more time and system resources. In comparison, a Docker container uses the host operating system's resources and can start much faster. With Docker, I was able to deploy an Nginx web server using only a few commands.

The port mapping `-p 8080:80` is necessary because the Nginx web server runs on port 80 inside the container. The container has its own isolated network environment, so port 80 is not automatically available through the host. By mapping port 8080 on the host to port 80 inside the container, I was able to access the Nginx server using `http://localhost:8080`. This showed me how Docker can connect services running inside containers to the outside environment.

I also learned what happens when using the `docker rm` command. When a container is removed, the container itself and its writable data are deleted. This means that data stored only inside the container may be lost after removal. Important data should therefore be stored using persistent storage such as Docker volumes.

Containerization can also improve the way developers and IT operations teams work together. Developers can package an application and its required dependencies into a container, while IT operations teams can deploy the same container in different environments. This can make deployment more consistent and support DevOps practices.

Lastly, my GitHub portfolio is becoming more organized as I add laboratory activities and technical documentation. This activity allowed me to include Docker commands, research, screenshots, and my own reflection, making my portfolio a record of the skills I am developing in cloud computing.

