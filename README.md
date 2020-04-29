
# Make VAULT_TOKEN variable

```shell
TAG=2.3
docker build -t dirc/devwebapp-ruby:$TAG .

docker push dirc/devwebapp-ruby:$TAG

# Usage
EXTERNAL_VAULT_ADDR=13.66.89.3
VAULT_ADDR=http://$EXTERNAL_VAULT_ADDR:8200
VAULT_TOKEN=s.Om1eJ8grxKInfsocu29XrE5G

docker run -d --name devwebapp --rm -e VAULT_ADDR=$VAULT_ADDR -e VAULT_TOKEN=$VAULT_TOKEN -p 8080:8080 dirc/devwebapp-ruby:$TAG

docker exec -it devwebapp curl -s localhost:8080

```
