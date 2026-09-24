# Storage Types Research

Cloud computing uses different types of storage depending on how data needs to be accessed and managed. The three common types are Block Storage, File Storage, and Object Storage.

| Storage Type | Description | Primary Use Case | Cloud Provider Example |
|---|---|---|---|
| Block Storage | Stores data in fixed-size blocks that can be accessed individually by an operating system. | Virtual machines, databases, and applications that require fast disk-like storage. | AWS EBS |
| File Storage | Stores data as files organized in folders and directories that can be shared across systems. | Shared files, documents, and applications that need a common file system. | AWS EFS |
| Object Storage | Stores data as objects together with metadata and a unique identifier inside containers called buckets. | Images, videos, backups, documents, and other large amounts of unstructured data. | Amazon S3 |

## Why Object Storage is Suitable for User-Uploaded Images

Object Storage is suitable for the client's photo-sharing application because it is designed to handle large amounts of unstructured data such as images and videos. It also allows files to be organized into buckets and accessed through web-based APIs, making it appropriate for applications that may need to store millions of user-uploaded photos.
