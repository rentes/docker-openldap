#!/bin/bash -e
docker run --name ldap-client --hostname ldap-client --link ldap-service:ldap-service --detach osixia/openldap
docker exec -it ldap-client ldapsearch -D "cn=admin,dc=example,dc=org" -h ldap-service -w admin -b "dc=example,dc=org" -s sub "(objectclass=*)"
