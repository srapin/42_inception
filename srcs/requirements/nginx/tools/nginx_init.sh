apt update -y

apt update -y

apt install nginx -y

apt install vim -y    

apt install curl -y   

mkdir -p /etc/nginx/ssl

apt install OpenSSL -y

openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=srapin.42.fr/UID=srapin"

mkdir -p /var/run/nginx