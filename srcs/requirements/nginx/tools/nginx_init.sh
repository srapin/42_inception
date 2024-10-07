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

apt_nginx(){
    apt_up
    apt_install "nginx" "vim" "curl" "openssl"
    
}

dir_creation(){
    for dir in "/etc/nginx/ssl" "/run/nginx" "/var/www/html"; do
        mkdir -p $dir
    done
}

dir_creation
apt_nginx
openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=srapin.42.fr/UID=srapin"