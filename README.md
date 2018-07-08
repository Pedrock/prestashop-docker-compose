### Build containers and push to registry
```bash
docker login registry.gitlab.com

docker-compose build

docker-compose push
```

### Deploy to the swarm

Create deploy token

On the server run:
```bash
docker login registry.gitlab.com -u <username> -p <deploy_token>
```