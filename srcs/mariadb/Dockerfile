FROM debian:bullseye
RUN apt-get update -y && apt install mariadb-server -y && apt install mariadb-client -y
ADD startup startup
RUN echo "[mysqld]" >> /etc/mysql/my.cnf
RUN echo "skip-networking=0" >> /etc/mysql/my.cnf
RUN echo "skip-bind-address" >> /etc/mysql/my.cnf
RUN chmod 700 startup
CMD ["/startup"]
EXPOSE 3306
