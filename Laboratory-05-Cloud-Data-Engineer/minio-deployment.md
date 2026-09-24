# MinIO Deployment

## Overview

For this laboratory activity, I deployed MinIO as an S3-compatible object storage server using Docker. The server was run inside the KillerCoda Ubuntu Playground.

## Docker Deployment Command

The following command was used to create and start the MinIO container:

```bash
docker run -d -p 9000:9000 -p 9001:9001 --name minio-server \
-e "MINIO_ROOT_USER=cloudadmin" \
-e "MINIO_ROOT_PASSWORD=CloudNova2026!" \
minio/minio server /data --console-address ":9001"
