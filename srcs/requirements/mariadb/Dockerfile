FROM debian:buster

COPY ./tools/mariadb_init.sh /
COPY ./tools/start.sh /
RUN chmod +x /mariadb_init.sh
RUN chmod +x /start.sh
RUN /mariadb_init.sh

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/
CMD ["./start.sh"]