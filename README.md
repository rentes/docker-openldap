# docker-openldap
A simple docker-based OpenLDAP client server tutorial

## Requirements

- Docker

## Server

- OpenLDAP is based on docker image from [osixia/openldap:latest](https://hub.docker.com/r/osixia/openldap/).
- phpLDAPadmin is bases on docker image from [osixia/phpldapadmin:latest](https://hub.docker.com/r/osixia/phpldapadmin/).

Usage: server.sh [start|stop].

The start option runs the OpenLDAP + phpLDAPadmin docker containers.
The stop options stops the containers and removes them.

## Client

- OpenLDAP is based on docker image from [osixia/openldap:latest](https://hub.docker.com/r/osixia/openldap/).

Usage: client.sh [start|stop].

The start option runs the OpenLDAP container and performs an ldap search from the command-line.
The stop options stops the container and removes them.
