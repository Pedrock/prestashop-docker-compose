### Build containers and push to registry
```bash
docker login registry.gitlab.com

docker-compose build

docker-compose push
```

### Deploy to the swarm

Create deploy token.

Configure host with docker-machine.

Configure the secrets.

Add a label to the host:
```bash
docker node update --label-add my-service=true ID
```

Login into the registry:
```bash
docker login registry.gitlab.com -u <username> -p <deploy_token>
```

Deploy:
```bash
./deploy.sh
```