# College of Information Technology

# OPERATIONAL MANUAL BOOK
**CCM101 – Cloud Computing**

**By:**

Benitez, Germen A.  
Javier, Gerald Q.  
Manuel, Eula Faith D.  
Mende, Rogelio A.  
Palaylay, Mark Reynald E.  
Peña, Jenel Mae M.  
Soriano, Khian Jay H.  
Tabobo, Oliver V.  
Loque, Angelica Grace O.

# CLOUDNOVA ENTERPRISE PRIVATE CLOUD

## Section 1: Executive Overview & System Specs

This operational manual documents the deployment, perimeter hardening, and automated maintenance procedures for the CloudNova private cloud infrastructure.

| Specification | Key Detail / Value | Notes |
|---|---|---|
| Host Hypervisor | Oracle VirtualBox | Minimum requirement: 2+ vCPU, 2GB+ RAM |
| Base OS | Ubuntu Server 24.04 LTS | Hostname: cloudnova-server |
| Container Runtime | Docker Engine & Docker Compose | Compose V2 specification engine |
| Service Containers | cloudnova-nextcloud, cloudnova-database | Nextcloud (Apache runtime), MariaDB LTS |
| Storage Architecture | Docker Named Volumes | Volumes: cloudnova_db_data, nextcloud_data |
| Perimeter Firewall | Uncomplicated Firewall (UFW) | Policy: Default Deny Inbound |

## Section 2: Table of Contents

| Section | Title | Reference Page |
|---|---|---|
| Section 1 | Executive Overview & System Specs | Page 2 |
| Section 2 | Architecture & Network Topology | Page 3 |
| Section 3 | Environment Setup & Prerequisites | Page 4 |
| Section 4 | Infrastructure as Code (docker-compose.yml) | Page 5 |
| Section 5 | System Deployment & Stack Initialization | Page 6 |
| Section 6 | Service Verification & Database Connectivity | Page 7 |
| Section 7 | Host Hardening & Firewall Configuration | Page 8 |
| Section 8 | Disaster Recovery & Automated Backup Script | Page 9 |
| Section 9 | Cron Automation & Log Management | Page 10 |
| Section 10 | Operational Troubleshooting & Health Diagnostics | Page 11 |
| Section 11 | Final Reflection & Emergency Escalation | Page 12 |

## Section 3: Network Topology & Container Layout

The CloudNova architecture enforces strict network isolation. The Nextcloud web application container sits on a bridge network (frontend) accessible via port 8080, while the MariaDB container resides exclusively on a private backend network (backend) with no direct external exposure.

| Tier | Component | Container Network | Binding / Exposure Bounds |
|---|---|---|---|
| Edge Ingress | Web Application Proxy | frontend | Host Port 8080 mapping to Container Port 80 |
| Application Layer | cloudnova-nextcloud | frontend, backend | Dual homed; orchestrates data & presentation |
| Database Tier | cloudnova-database | backend | Strictly isolated; reachable only by Nextcloud |
| Persistent Storage | Local Storage Engine | Local Volume Driver | Persistent mounts to /var/lib/mysql & /var/www/html |

## Section 4: Host Provisioning & Docker Installation

Prior to stack deployment, the base system must be updated and initialized with the official Docker Engine repository.

### Step 1: System Package Update

Update existing APT package caches and deploy transport prerequisites:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl ca-certificates gnupg lsb-release
```

### Step 2: Docker Engine & Compose Installation

Install modern container runtime tooling and initialize daemon:

```bash
sudo apt install -y docker.io docker-compose-v2
sudo systemctl enable --now docker
```

## Section 5: Docker Compose Stack Definition

The entire infrastructure stack is defined inside `/opt/cloudnova/docker-compose.yml`.

```yaml
services:
  db:
    image: mariadb:lts
    container_name: cloudnova-database
    restart: unless-stopped
    environment:
      MARIADB_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MARIADB_DATABASE: ${MYSQL_DATABASE}
      MARIADB_USER: ${MYSQL_USER}
      MARIADB_PASSWORD: ${MYSQL_PASSWORD}
    volumes:
      - db_data:/var/lib/mysql
    networks:
      - backend

  app:
    image: nextcloud:apache
    container_name: cloudnova-nextcloud
    restart: unless-stopped
    ports:
      - "8080:80"
    environment:
      MYSQL_HOST: db
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
      NEXTCLOUD_ADMIN_USER: ${NEXTCLOUD_ADMIN_USER}
      NEXTCLOUD_ADMIN_PASSWORD: ${NEXTCLOUD_ADMIN_PASSWORD}
    volumes:
      - nextcloud_data:/var/www/html
    networks:
      - frontend
      - backend
    depends_on:
      - db

networks:
  frontend:
  backend:

volumes:
  db_data:
    name: cloudnova_db_data
  nextcloud_data:
```

## Section 6: Stack Deployment Steps

### Step 1: Directory Setup

```bash
sudo mkdir -p /opt/cloudnova
cd /opt/cloudnova
```

### Step 2: Provision Stack

```bash
sudo docker compose up -d
```

### Step 3: Verify Container States

```bash
sudo docker compose ps
```

## Section 7: Nextcloud & Database Handshake Verification

To confirm full multi-tier communication, execute the Nextcloud OCC status query inside the web container.

**Command:**

```bash
sudo docker exec -it cloudnova-nextcloud php occ status
```

**Expected Output Verification:**

```text
- installed: true
- version: 35.0.2.2
- versionstring: 35.0.2
- maintenance: false
- needsDbUpgrade: false
- productname: Nextcloud
```

## Section 8: UFW Perimeter Defense Configuration

Host-level security is enforced using Uncomplicated Firewall (UFW) with a strict default-deny policy.

### Firewall Rules Setup

Execute the hardening script sequence:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp comment 'SSH Administration'
sudo ufw allow 8080/tcp comment 'Nextcloud Web Access'
sudo ufw enable
```

### Firewall Status Verification

Ensure rules are compiled and active:

```bash
sudo ufw status verbose
```

## Section 9: Database & Volume Backup Script (backup.sh)

Automated disaster recovery is powered by a custom executable Bash script located at `/opt/cloudnova/backup.sh`.

```bash
#!/bin/bash

BACKUP_DIR="/var/backups/cloudnova"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
DB_CONTAINER="cloudnova-database"
DB_NAME="nextcloud"
DB_USER="nextcloud"

mkdir -p ${BACKUP_DIR}

echo "[$(date)] Starting MariaDB database dump..."
sudo docker exec ${DB_CONTAINER} mariadb-dump -u ${DB_USER} -p${MYSQL_PASSWORD} ${DB_NAME} > ${BACKUP_DIR}/db_backup_${TIMESTAMP}.sql

echo "[$(date)] Compressing database dump..."
gzip ${BACKUP_DIR}/db_backup_${TIMESTAMP}.sql

echo "[$(date)] Cleaning up backups older than 7 days..."
find ${BACKUP_DIR} -type f -name "*.sql.gz" -mtime +7 -delete

echo "[$(date)] Backup process completed successfully."
```

## Section 10: Cron Job Scheduling & Verification

Disaster recovery execution is scheduled via root cron jobs to run automatically every night at 2:00 AM.

### Crontab Entry Configuration

Deploy through:

```bash
sudo crontab -e
```

Add the following entry:

```bash
0 2 * * * /opt/cloudnova/backup.sh >> /var/log/cloudnova_backup.log 2>&1
```

### Automated Output Verification

Monitor generation of daily gzipped archive sets:

```bash
ls -la /var/backups/cloudnova/
```

## Section 11: Standard Operating Procedures (SOP)

| Incident Scenario | Primary Inspection Command | Resolution Standard Operating Procedure |
|---|---|---|
| Container shows (unhealthy) or crashing | `sudo docker compose logs db --tail=50` | Inspect log for crash recovery or disk space bounds. Check memory saturation. |
| Web page inaccessible | `sudo ufw status` | Ensure UFW port 8080 is explicitly set to ALLOW across local subnet bounds. |
| Database connection refusal | `sudo docker exec -it cloudnova-nextcloud php occ status` | Verify MariaDB container is active and reachable within backend bridge network. |
| Disk space low | `sudo docker system df` | Execute `sudo docker system prune -f` to purge dangling cache layers and unused networks. |

## Section 12: Architectural Reflection & System Handover

### System Handover Statement

The CloudNova enterprise private cloud stack has undergone rigorous end-to-end verification. All components—including host virtualization, multi-tier Docker containerization, default-deny perimeter security, and automated disaster recovery—have been validated for submission and live demo.
