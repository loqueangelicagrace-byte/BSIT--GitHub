# CloudNova Enterprise Private Cloud Infrastructure

Secure, automated, and observable multi-tier infrastructure deployed on Ubuntu Server via Docker Compose.

## Repository Overview

- `README.md`: Executive summary and quickstart guide.
- `architecture-diagram.png`: Network topology and system diagram.
- `docker-compose.yml`: Multi-tier service orchestration (Nextcloud + MariaDB).
- `automation-script.sh`: Executable database and volume backup script.
- `operational-manual.md`: Comprehensive handover and disaster recovery manual.
- `final-reflection.md`: Technical journey and engineering reflection.

## Quick Start

Clone the repository and configure your `.env` secrets file.

Deploy the stack:

```bash
sudo docker compose up -d
```
