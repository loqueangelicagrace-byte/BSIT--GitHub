

Building the CloudNova private cloud made complex cloud ideas feel real and hands-on. The biggest lesson I learned is that a strong system doesn't happen by accident—it takes careful network setup, strong security, and automated maintenance.

Moving from a basic single container to a multi-tier setup—keeping the Nextcloud web app separate from the private MariaDB database—showed me why security matters. By keeping the database off public networks and using internal Docker networks, we block potential threats. Also, setting up the UFW firewall with a "block-all-first" rule proved that security needs to be locked down at every level, from the server host to the storage volumes.

Another major takeaway is the importance of automated backups. In the real world, manual backups fail because people forget. Writing a custom backup script and connecting it to a daily cron job taught me how to build self-running systems that protect user data 24/7 without needing human help.

Overall, acting as the Systems Architect for this project connected my learning in cloud computing, DevOps, and professional documentation. This experience gives me the confidence to design, secure, deploy, and hand over strong cloud systems for real-world business needs.
