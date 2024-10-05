FROM debian:buster

COPY ./tools/nginx_init.sh /
RUN chmod +x /nginx_init.sh
RUN /nginx_init.sh


COPY conf/nginx.conf /etc/nginx/

CMD [ "nginx", "-g", "daemon off;" ]
