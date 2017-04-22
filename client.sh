#!/bin/bash -e
# Author: Miguel Rentes

startcontainer() {
    docker run --name ldap-client --hostname ldap-client --link ldap-service:ldap-service --detach osixia/openldap
    echo "Performing LDAP search"
    docker exec -it ldap-client ldapsearch -D "cn=admin,dc=example,dc=org" -h ldap-service -w admin -b "dc=example,dc=org" -s sub "(objectclass=*)"
}

stopcontainer() {
    docker stop ldap-client
    docker rm ldap-client
}

case "$1" in 
    start)   startcontainer ;;
    stop)    stopcontainer ;;
    restart) stopcontainer; startcontainer ;;
    *) echo "usage: $0 start|stop|restart" >&2
       exit 1
       ;;
esac
