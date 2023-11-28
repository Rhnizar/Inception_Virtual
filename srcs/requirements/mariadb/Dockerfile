FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install mariadb-server -y

# Set permissions on directories
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

# Install MariaDB
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db

EXPOSE 3306


COPY ./conf/config.sh /config.sh

ENTRYPOINT ["sh", "/config.sh"]

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]


