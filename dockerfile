# Pull base image.
FROM ubuntu:14.04

# add required files
# ADD dgidb /home/dgidb/dgidb
# ADD data.sql /home/dgidb/dgidb/data/data.sql
ADD setup.sh /scripts/setup.sh
ADD build.sh /scripts/build.sh
ADD start.sh /scripts/start.sh

# set lang and install system level dependencies
ENV LANGUAGE="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
RUN locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales \
    && apt-get update \
    && apt-get install -y postgresql-9.3 postgresql-contrib-9.3 libpq-dev libxslt-dev libxml2-dev git build-essential libssl-dev zlib1g-dev libcurl4-openssl-dev nodejs libreadline-dev curl wget \
    && ln -s /usr/lib/postgresql/9.3/bin/* /bin \
    && sed -i "s/md5/trust/g" /etc/postgresql/*/main/pg_hba.conf
    

# get rbenv files
RUN git clone git://github.com/sstephenson/rbenv.git /rbenv \
    && mkdir /rbenv/plugins \
    && git clone git://github.com/sstephenson/ruby-build.git /rbenv/plugins/ruby-build \
    && git clone git://github.com/andorchen/rbenv-china-mirror.git /rbenv/plugins/rbenv-china-mirror \
    && mkdir -p /home/dgidb \
    && git clone git://github.com/silenwang/dgidb.git /home/dgidb/dgidb

# create an user and use it to install ruby, dgidb
RUN useradd -ms /bin/bash dgidb | true \
    && chown -R dgidb /home/dgidb \
    && chgrp -R dgidb /home/dgidb \
    && chmod a+r /scripts/setup.sh /scripts/build.sh \
    && /bin/bash /scripts/setup.sh


# #Occasionally the database may get into a confused state and this command no longer works properly
# #In that case you can try this:
# psql -h localhost -d dgidb -f db/structure.sql
# psql -h localhost -d dgidb -f data/data.sql

# Run Service on Start
WORKDIR /home/dgidb/dgidb
CMD /etc/init.d/postgresql start && /bin/bash /scripts/start.sh