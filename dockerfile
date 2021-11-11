FROM perl:5.30

# RUN curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add - \
#     && source /etc/lsb-release && echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable"  | sudo tee -a /etc/apt/sources.list \
#     && apt-get -qq update \
#     && apt-get install -y influxdb
# RUN cpan App::cpanminus

WORKDIR /influxdb-schema-updater

ADD influxdb-schema-updater ./
ADD cpanfile ./
RUN cpanm --quiet --installdeps --notest .

ADD docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
# CMD [ "perl", "./influxdb-schema-updater" ]
VOLUME /etc/influxdb/schema/
ENV CONFIG=/etc/influxdb/schema/