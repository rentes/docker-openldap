#!/bin/bash -e
# Author: Miguel Rentes

startcontainer() {
    docker run --name ldap-service --hostname ldap-service --detach osixia/openldap
    docker run --name phpldapadmin-service --hostname phpldapadmin-service --link ldap-service:ldap-host --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host -p 443:443 --detach osixia/phpldapadmin

    echo "Go to: https://localhost/"
    echo "Login DN: cn=admin,dc=example,dc=org"
    echo "Password: admin"
}

stopcontainer() {
    docker stop ldap-service
    docker stop phpldapadmin-service
    docker rm ldap-service
    docker rm phpldapadmin-service
}

case "$1" in 
    start)   startcontainer ;;
    stop)    stopcontainer ;;
    restart) stopcontainer; startcontainer ;;
    *) echo "usage: $0 start|stop|restart" >&2
       exit 1
       ;;
esac
