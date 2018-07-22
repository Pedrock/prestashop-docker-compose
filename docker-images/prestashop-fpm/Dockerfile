FROM prestashop/base:7.2-fpm

ENV PS_VERSION 1.7.4.1

# Get PrestaShop
ADD https://www.prestashop.com/download/old/prestashop_1.7.4.1.zip /tmp/prestashop.zip

# Extract
RUN mkdir -p /tmp/data-ps \
	&& unzip -q /tmp/prestashop.zip -d /tmp/data-ps/ \
	&& bash /tmp/ps-extractor.sh /tmp/data-ps \
&& rm /tmp/prestashop.zip


# Install and enable APCu
# RUN pecl install apcu-5.1.8 \
# && ( \
#   echo "extension=apcu.so"; \
#   echo "apc.enabled=1"; \
#   echo "apc.enable_cli=1"; \
#   ) > /usr/local/etc/php/conf.d/ext-apcu.ini

# Install memcached extension
RUN apt-get update \
&& apt-get install -y libmemcached-dev \
&& pecl install memcached \
&& apt-mark manual libmemcachedutil2 \
&& apt-get purge -y libmemcached-dev --auto-remove \
&& rm -rf /var/lib/apt/lists/* \
&& ( \
  echo "extension=memcached.so"; \
  ) > /usr/local/etc/php/conf.d/ext-memcached.ini