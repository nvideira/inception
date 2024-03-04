#use debian as base image
FROM debian:oldstable-slim

#install nginx
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y nginx && apt-get -y install openssl

RUN mkdir /etc/nginx/ssl

# req -x509 - we want to use a self-signed certificate
# -nodes means "no DES", ie ssl will not encrypt the p_key when generating the seld-signed certificate
# -days 365 - validy period of the key
# -newkey rsa:2048 - a new 2048bit rsa key will be generated along with the certificate
# -keyout /path/... - specifies the output file where the key will be stored
# -out /path/... - output file where the certificate will be stored
# -subj "..." - subject information for the certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=PT/L=Lisbon/O=42/CN=nvideira.42.fr"

#copy config file
COPY ./conf/nginx.conf /etc/nginx/conf.d

#expose port 443 for https
#EXPOSE 443

#start nginx
CMD ["nginx", "-g", "daemon off;"]


