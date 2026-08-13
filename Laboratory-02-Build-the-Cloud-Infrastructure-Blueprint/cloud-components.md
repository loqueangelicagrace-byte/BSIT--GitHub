# Cloud Infrastructure Components Analysis

## 1. Compute Resources
* **Description:** Physical or virtual processing power (CPUs, vCPUs, RAM) required to execute applications and workloads.
* **Importance in Cloud:** Serves as the primary engine that runs user applications, processes requests, and executes system instructions dynamically.
* **KillerCoda Context:** Identified via the AMD EPYC vCPUs and 3.8 GiB RAM allocated to the Linux instance to execute commands and scripts.

## 2. Storage Resources
* **Description:** Persistent or non-persistent digital media used to retain files, databases, system binaries, and backups.
* **Importance in Cloud:** Ensures data persistence across reboots and scales according to application storage demands.
* **KillerCoda Context:** Represented by the 40 GiB `/dev/sda1` root disk partition formatted as an `ext4` file system.

## 3. Networking Resources
* **Description:** The interconnectivity infrastructure (virtual networks, IP addressing, routers, firewalls) enabling communication between systems[cite: 1].
* **Importance in Cloud:** Allows cloud services to communicate with each other, receive user traffic, and establish secure external connections.
* **KillerCoda Context:** Observed through the `eth0` network interface and local assigned IP address facilitating terminal communication.

## 4. Operating System
* **Description:** The software layer that manages hardware resources and provides system services for application execution[cite: 1].
* **Importance in Cloud:** Provides the standardized execution environment and interface for applications deployed across cloud virtual machines.
* **KillerCoda Context:** Provided as Ubuntu 22.04 LTS Linux running kernel version 5.15.0-88-generic.
