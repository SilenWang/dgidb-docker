# run as root
/etc/init.d/postgresql start 

# switch to posstgres
su - postgres -c "createuser -s dgidb"

# switch to dgidb
su - dgidb -s /bin/bash /scripts/build.sh