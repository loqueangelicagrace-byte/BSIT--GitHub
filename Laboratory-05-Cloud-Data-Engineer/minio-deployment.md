# MinIO Deployment Documentation

## Docker Command Used

```bash
docker run -d -p 9000:9000 -p 9001:9001 --name minio-server \
  -e "MINIO_ROOT_USER=cloudadmin" \
  -e "MINIO_ROOT_PASSWORD=CloudNova2026!" \
  -e "MINIO_BROWSER=on" \
  bitnamilegacy/minio:2025.7.23-debian-12-r5
```

> The original lab sheet called for `minio/minio`, but that image stopped being freely available on Docker Hub as of October 2025. I switched to `bitnamilegacy/minio` instead, which meant adding `MINIO_BROWSER=on`. Without it, the web console does not start properly and may result in a 502 error when accessing it.

## Web Console Port

Port **9001** is where the MinIO web console is accessed.

It is separate from port **9000**, which handles the actual S3 API traffic. Port **9001** is used when accessing the visual web dashboard through a browser.

### Example

```text
http://localhost:9001
```

## Bucket Created

**Bucket name:** `client-photos`

The `client-photos` bucket is used to store the client's photos for this proof-of-concept deployment.

## What the `-e` Flags Actually Do

The `-e` options define environment variables that configure the MinIO container.

* `MINIO_ROOT_USER` — sets the administrator username used to log in to the MinIO console.
* `MINIO_ROOT_PASSWORD` — sets the administrator password.
* `MINIO_BROWSER` — enables or disables the MinIO web console. It is set to `on` to make the web console available.
