FROM debian:bullseye
RUN apt-get update && apt install mariadb-server -y
ADD startup startup
RUN chmod 700 startup
CMD ["/startup"]
EXPOSE 3306
