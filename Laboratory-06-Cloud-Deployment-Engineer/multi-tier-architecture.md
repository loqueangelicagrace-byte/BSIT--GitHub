# Multi-Tier Architecture

## Two-Tier Architecture

A two-tier architecture separates an application into two main parts: the web/application tier and the database tier. In this mission, Nextcloud acts as the application tier while MariaDB acts as the database tier.

## The Web/Application Tier

The web/application tier is responsible for providing the user interface and handling requests from users. In this deployment, the Nextcloud container provides the web interface that users access through a browser.

## The Database Tier

The database tier stores persistent information needed by the application. MariaDB is used in this mission to store Nextcloud data such as user information and application-related metadata.

## Why Separate Them?

Separating the application and database into different containers makes the system easier to manage and maintain. Each container has a specific responsibility, which allows the services to be updated, restarted, or scaled independently.
