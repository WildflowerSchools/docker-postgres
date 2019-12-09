FROM postgres:11.6

RUn apt-get update
RUN apt-get install -y wget

RUN wget https://github.com/wal-g/wal-g/releases/download/v0.2.14/wal-g.linux-amd64.tar.gz -O wal-g.linux-amd64.tar.gz

RUN tar -zxvf wal-g.linux-amd64.tar.gz

RUN mv wal-g /bin/wal-g
RUN chmod +x /bin/wal-g

COPY ./archive_command.sh /usr/local/sbin/archive_command.sh
RUN chmod +x /usr/local/sbin/archive_command.sh
COPY ./make_basebackup.sh /usr/local/sbin/make_basebackup.sh
RUN chmod +x /usr/local/sbin/make_basebackup.sh

COPY ./restore_command.sh /usr/local/sbin/restore_command.sh
RUN chmod +x /usr/local/sbin/restore_command.sh

COPY ./restore-entrypoint.sh /usr/local/sbin/restore-entrypoint.sh
RUN chmod +x /usr/local/sbin/restore-entrypoint.sh

COPY ./setup_archive.sh /docker-entrypoint-initdb.d/setup_archive.sh
RUN chmod +x /docker-entrypoint-initdb.d/setup_archive.sh

ENTRYPOINT ["restore-entrypoint.sh"]

CMD ["postgres"]
