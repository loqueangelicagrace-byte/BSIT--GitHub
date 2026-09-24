# Mission 5 Reflection

This laboratory activity helped me understand how object storage is used in cloud computing and why it is useful for applications that handle large amounts of files. Object storage is well suited for storing millions of photos because each file can be stored as an object with its own metadata and identifier. Unlike traditional block storage, object storage is designed for large amounts of unstructured data and can be accessed through applications and web-based services. This makes it practical for a photo-sharing application where users may continuously upload images.

Docker made deploying MinIO easier because I did not need to manually install and configure every component of the storage server. By using one Docker command, I was able to download the MinIO image, create a container, configure the administrator credentials, and expose the required ports. The environment variables also allowed me to define the username and password when the container was started.

A bucket is a container used to organize objects in object storage. In this activity, I created a bucket named `client-photos` and uploaded a test file to verify that the storage system was working.

Large enterprise companies can protect their object storage data by using multiple copies of data, redundancy, backups, replication, and geographically separated storage systems. These methods can help reduce the risk of permanent data loss when hardware or physical servers experience failures.

My confidence in using the Linux command line is also improving. At first, commands such as Docker commands and Linux terminal operations may seem difficult to remember, but practicing them makes the process more familiar. This activity also helped me understand how command-line tools, containers, networking ports, and cloud storage work together. Overall, the laboratory gave me practical experience in deploying and documenting a cloud storage service.

