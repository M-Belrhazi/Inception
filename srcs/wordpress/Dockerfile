FROM debian:bullseye
RUN apt update -y && apt upgrade -y \
    && apt install -y lsb-release ca-certificates apt-transport-https \
       software-properties-common gnupg2 unzip wget git \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" \
	| tee /etc/apt/sources.list.d/sury-php.list
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN apt remove apache2 php php-common php-mysql php-gmp php-curl php-intl php-mbstring php-xmlrpc \
               php-gd php-xml php-zip libapache2-mod-php -y
RUN apt update -y && apt upgrade -y && apt install mariadb-client -y
RUN apt install php8.2 -y
RUN apt install php8.2-common php8.2-mysql php8.2-gmp \
		php8.2-curl php8.2-intl php8.2-mbstring \
		php8.2-xmlrpc php8.2-gd php8.2-xml php8.2-cli php8.2-zip php8.2-fpm -y
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xvzf latest.tar.gz
RUN cd wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN service php8.2-fpm start
ADD startup ../startup
RUN chmod 777 ../startup
COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf
CMD ["../startup"]
EXPOSE 9000
