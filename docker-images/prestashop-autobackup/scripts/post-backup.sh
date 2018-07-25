#!/bin/bash

rm -rf /data/db/

duplicacy prune -keep 1:7 -exclusive      # Keep 1 backup per day for backups older than 7 days
duplicacy prune -keep 7:30 -exclusive     # Keep 1 backup every 7 days for backups older than 30 days
duplicacy prune -keep 0:180 -exclusive    # Remove all backups older than 180 days
duplicacy prune -exhaustive -exclusive    # Chunks from deleted backups will be removed if deletion criteria are met