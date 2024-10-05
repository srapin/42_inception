apt_yes_exec(){
    apt $* -y
}

apt_install(){
    for prog in $*; do
        apt_yes_exec "intall" $prog
    done;
}

apt_mariadb(){
    for cmd in "update" "upgrade"; do
        apt_yes_exec $cmd
    done
    apt_install "mariab-server" "vim" "curl" "OpenSSL"
}

dir_creation(){
    for dir in "/etc/nginx/ssl" "/var/run/nginx"; do
        mkdir -p $dir
    done
}

dir_creation
apt_nginx