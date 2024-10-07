#!/bin/bash

apt_yes_exec(){
    apt $* -y
}

apt_up(){
    for cmd in "update" "upgrade"; do
        apt_yes_exec $cmd
    done
}

apt_install(){
    for prog in $*; do
        apt_yes_exec "install" $prog
    done;
}

apt_wordpress(){
    apt_up
    apt_install "install" "curl" "php81" "php-fpm" "php-mysql" "mariadb-client"
    mkdir -p /run/php;
}

get_and_tar(){
    curl -o wordpress.tar.gz -S https://fr.wordpress.org/wordpress-6.6.2-fr_FR.tar.gz 
    tar xfz wordpress.tar.gz && rm -rf wordpress.tar.gz
    mv wordpress /var/www 
    chown -R root:root /var/www/wordpress
}

sed_config(){
    sed -i "s/$1/$2/g" wp-config-sample.php
}

set_config(){
    if [ ! -f ./wp-config.php ]; then
        config_var=("username_here" "password_here" "localhost" "database_name_here")
        env_var=("MYSQL_USER" "MYSQL_PASSWORD" "WORDPRESS_DB_HOST" "MYSQL_DATABASE")

        for i in {0..3}; do
            sed_config ${config_var[i]} '$'${env_var[i]}
        done
        cp wp-config-sample.php wp-config.php
    fi
}

apt_wordpress

get_and_tar

set_config
