#!/bin/bash -e
docker run --name ldap-service --hostname ldap-service --detach osixia/openldap
docker run --name phpldapadmin-service --hostname phpldapadmin-service --link ldap-service:ldap-host --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host -p 443:443 --detach osixia/phpldapadmin

echo "Go to: https://localhost/"
echo "Login DN: cn=admin,dc=example,dc=org"
echo "Password: admin"

