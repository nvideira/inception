#use debian as base image
FROM debian:bullseye

#install nginx
RUN apt-get update && apt-get install -y nginx

#copy config file
COPY nginx.conf /etc/nginx/nginx.conf

#expose port 80 for http and 443 for https
EXPOSE 80
EXPOSE 443

#start nginx
CMD ["nginx", "-g", "daemon off;"]


