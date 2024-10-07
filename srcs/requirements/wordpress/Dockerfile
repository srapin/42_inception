FROM debian:buster

COPY ./tools/wordpress_init.sh /
RUN chmod +x /wordpress_init.sh
RUN /wordpress_init.sh


COPY conf/php-fpm.conf /etc/php81/php-fpm.conf

CMD ["php-fpm81", "-F"]
