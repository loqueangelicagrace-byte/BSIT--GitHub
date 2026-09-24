# Cloud Storage Research: Block, File, and Object Storage

Before building the storage server, I looked into how the three main types of cloud storage differ, since choosing the right storage type is important when dealing with millions of files.

| **Storage Type**   | **How does it store data?**                                                                                                           | **Primary Use Case**                                                                                           | **Cloud Provider Example** |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------- |
| **Block Storage**  | Chops data into fixed-size blocks, each addressed individually, then attaches directly to a server like a raw hard drive.             | Databases, boot volumes, and applications requiring fast, low-latency reads and writes.                        | AWS EBS                    |
| **File Storage**   | Keeps data in a familiar folder and file hierarchy, shared over a network protocol such as NFS or SMB.                                | Shared drives, home directories, and situations where multiple users or servers need access to the same files. | AWS EFS                    |
| **Object Storage** | Treats each item as a standalone object consisting of the file, metadata, and a unique identifier, stored in a flat bucket structure. | Large volumes of unstructured data such as photos, videos, backups, and static assets.                         | AWS S3                     |

## Why Object Storage Wins Here

Millions of photos are exactly the type of data that object storage is designed to handle. Instead of relying on a traditional folder hierarchy, object storage keeps each file as a separate object with its own identifier and metadata.

This approach makes it suitable for handling very large amounts of unstructured data. Unlike block and file storage, object storage does not require the data to be managed like a traditional disk or shared filesystem.

Object storage is also commonly accessed through HTTP-based APIs instead of being mounted as a traditional disk. This makes it a natural choice for web applications that need to upload, store, retrieve, and serve images to users.
