#!/bin/bash

rm -rf /data/db/

export DUPLICACY_PASSWORD=$BACKUP_ENCRYPTION_KEY
export DUPLICACY_S3_ID=$AWS_ACCESS_KEY_ID
export DUPLICACY_S3_SECRET=$AWS_SECRET_KEY
export DUPLICACY_B2_ID=$B2_ID
export DUPLICACY_B2_KEY=$B2_KEY
export DUPLICACY_HUBIC_TOKEN=$HUBIC_TOKEN_FILE
export DUPLICACY_SSH_PASSWORD=$SSH_PASSWORD
export DUPLICACY_SSH_KEY_FILE=$SSH_KEY_FILE
export DUPLICACY_DROPBOX_TOKEN=$DROPBOX_TOKEN
export DUPLICACY_AZURE_KEY=$AZURE_KEY
export DUPLICACY_GCD_TOKEN=$GCD_TOKEN
export DUPLICACY_GCS_TOKEN=$GCS_TOKEN_FILE
export DUPLICACY_ONE_TOKEN=$ONEDRIVE_TOKEN_FILE

duplicacy prune -keep 1:7 -exclusive      # Keep 1 backup per day for backups older than 7 days
duplicacy prune -keep 7:30 -exclusive     # Keep 1 backup every 7 days for backups older than 30 days
duplicacy prune -keep 0:180 -exclusive    # Remove all backups older than 180 days
duplicacy prune -exhaustive -exclusive    # Chunks from deleted backups will be removed if deletion criteria are met