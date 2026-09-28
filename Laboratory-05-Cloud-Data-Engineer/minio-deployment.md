# MinIO Deployment

This document contains the technical documentation for deploying an S3-compatible object storage server using MinIO and Docker.

## EXACT DOCKER COMMAND USED

The MinIO storage server was deployed using the following Docker command:

```bash
docker run -d --name minio-server -p 9000:9000 -p 9001:9001 -e MINIO_ROOT_USER=cloudadmin -e MINIO_ROOT_PASSWORD=CloudNova2026! quay.io/minio/minio server /data --console-address ":9001"
```

The `-d` flag runs the container in detached mode.

The `--name minio-server` gives the container the name `minio-server`.

The `-p` flags map the MinIO ports from the container to the host machine.

- Port `9000` maps the MinIO API.
- Port `9001` maps the MinIO Web Console.

## WEB CONSOLE PORT

The MinIO Web Console was accessed using port `9001`.

Port `9001` is used for the MinIO Web Console, while port `9000` is used for the MinIO API.

The Web Console can be accessed through:

```text
http://localhost:9001
```

## BUCKET CREATED

The bucket created in the MinIO Web Console was:

```text
client-photos
```

A sample file was uploaded to the `client-photos` bucket to verify that the object storage was working properly.

The bucket was used to demonstrate that MinIO can store and manage objects through its Web Console.

## ENVIRONMENT VARIABLES

The `-e` flags were used to set environment variables inside the MinIO container.

### Root Username

The following environment variable:

```bash
-e MINIO_ROOT_USER=cloudadmin
```

sets `cloudadmin` as the MinIO root username.

### Root Password

The following environment variable:

```bash
-e MINIO_ROOT_PASSWORD=CloudNova2026!
```

sets the password for the MinIO root account.

These environment variables configure the administrator login credentials when the MinIO container is started.

## DOCKER PORT MAPPING

The Docker command uses two port mappings:

```text
9000:9000
9001:9001
```

The first port number represents the port on the host machine, while the second port number represents the port inside the MinIO container.

| Host Port | Container Port | Purpose |
|-----------|----------------|---------|
| 9000 | 9000 | MinIO API |
| 9001 | 9001 | MinIO Web Console |

## MINIO CONTAINER

The Docker container was named:

```text
minio-server
```

The container name was specified using:

```bash
--name minio-server
```

To check if the MinIO container is running, use:

```bash
docker ps
```

The output should show the `minio-server` container with ports `9000` and `9001` mapped to the host machine.

## VERIFYING THE DEPLOYMENT

The MinIO deployment can be verified by checking the running Docker containers:

```bash
docker ps
```

The MinIO Web Console can then be opened in a web browser using:

```text
http://localhost:9001
```

Log in using the configured credentials:

```text
Username: cloudadmin
Password: CloudNova2026!
```

After logging in, the `client-photos` bucket should be visible in the MinIO Web Console.

## OBJECT STORAGE TEST

To verify that MinIO object storage is working correctly, the following steps were performed:

1. Opened the MinIO Web Console.
2. Logged in using the configured root credentials.
3. Created a bucket named `client-photos`.
4. Opened the `client-photos` bucket.
5. Uploaded a sample file.
6. Verified that the uploaded file appeared inside the bucket.

This confirms that the MinIO server was successfully deployed and that objects can be stored using the MinIO Web Console.

## SUMMARY

MinIO was successfully deployed as an S3-compatible object storage server using Docker.

The deployment used the `quay.io/minio/minio` image and created a container named `minio-server`.

The MinIO Web Console was accessed through port `9001`, while port `9000` was used for the MinIO API.

A bucket named `client-photos` was created, and a sample file was uploaded to verify that the object storage functionality was working properly.

The administrator credentials were configured using the `MINIO_ROOT_USER` and `MINIO_ROOT_PASSWORD` environment variables.
