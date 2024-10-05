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

apt_mariadb(){
    apt_up
    apt_install "mariadb-server" #"vim" "curl" "OpenSSL"
}

# dir_creation(){
#     for dir in "/etc/nginx/ssl" "/var/run/nginx"; do
#         mkdir -p $dir
#     done
# }

# dir_creation
apt_mariadb