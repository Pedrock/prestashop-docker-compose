
# Load .env variables
set -a
source .env
set +a

docker stack deploy -c docker-compose.yml prestashop