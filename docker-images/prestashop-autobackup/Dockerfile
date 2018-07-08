FROM perconalab/percona-xtrabackup:2.4.11
# duplicacy-autobackup by christophetd/duplicacy-autobackup
MAINTAINER Pedro Câmara <camara-pedro@hotmail.com>

#--
#-- Environment variables
#--
ENV BACKUP_SCHEDULE='* * * * *' \
    BACKUP_NAME='' \
    BACKUP_LOCATION='' \
    BACKUP_ENCRYPTION_KEY='' \
    BACKUP_IMMEDIATLY='no' \
    BACKUP_IMMEDIATELY='no' \
    DUPLICACY_BACKUP_OPTIONS='-threads 4 -stats' \
    DUPLICACY_INIT_OPTIONS='' \
    AWS_ACCESS_KEY_ID='' \
    AWS_SECRET_KEY='' \
    B2_ID='' \
    B2_KEY='' \
    HUBIC_TOKEN_FILE='' \
    SSH_PASSWORD='' \
    SSH_KEY_FILE='' \
    DROPBOX_TOKEN='' \
    AZURE_KEY='' \
    GCD_TOKEN='' \
    GCS_TOKEN_FILE='' \
ONEDRIVE_TOKEN_FILE=''

# Install cron
RUN apt-get update \
    && apt-get install -y cron \
    && rm -rf /var/lib/apt/lists/*

# Install duplicacy
RUN wget https://github.com/gilbertchen/duplicacy/releases/download/v2.1.0/duplicacy_linux_x64_2.1.0 \
    -O /usr/local/bin/duplicacy && \
    chmod +x /usr/local/bin/duplicacy

RUN mkdir /app
WORKDIR /app
ADD *.sh ./
RUN chmod +x *.sh
COPY scripts /scripts

VOLUME ["/data"]
ENTRYPOINT ["/app/entrypoint.sh"]
# ENTRYPOINT ["bash"]
