FROM debian:bullseye
RUN apt-get update -y && apt install mariadb-server -y && apt install mariadb-client -y
ADD startup startup
RUN chmod 700 startup
CMD ["/startup"]
EXPOSE 3306
