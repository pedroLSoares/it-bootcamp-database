FROM mysql
ENV MYSQL_ROOT_PASSWORD=admin
COPY init.sql /docker-entrypoint-initdb.d/
EXPOSE 3306