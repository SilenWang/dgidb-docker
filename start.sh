/etc/init.d/postgresql start
su - dgidb -c "source /home/dgidb/.bashrc && cd /home/dgidb/dgidb && rails s -b '0.0.0.0' -p 3466" 