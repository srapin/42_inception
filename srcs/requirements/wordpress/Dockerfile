FROM debian:buster

COPY ./tools/wordpress_init.sh /
RUN chmod +x /wordpress_init.sh
RUN /wordpress_init.sh


# COPY conf/nginx.conf /etc/nginx/nginx.conf

# CMD [ "nginx", "-g", "daemon off;" ]
