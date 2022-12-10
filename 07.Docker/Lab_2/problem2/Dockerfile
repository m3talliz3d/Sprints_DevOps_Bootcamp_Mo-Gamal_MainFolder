FROM httpd:latest

COPY index.html /usr/local/apache2/htdocs/

COPY my-httpd.conf /usr/local/apache2/conf/httpd.conf

ENV CONTAINER "docker"

EXPOSE 9999
CMD echo ${CONTAINER} && CMD httpd -D FOREGROUND