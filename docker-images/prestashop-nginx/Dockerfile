FROM nginx:latest

# Make snakeoil certificates available
RUN apt-get update \
&& apt-get install -y ssl-cert \
&& rm -rf /var/lib/apt/lists/*

#Adding NGINX configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf
