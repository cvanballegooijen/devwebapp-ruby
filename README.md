
# Extended version of [burtlo/devwebapp-ruby:k8s](https://hub.docker.com/r/burtlo/devwebapp-ruby)

The web app used to [demo](https://learn.hashicorp.com/vault/getting-started-k8s/external-vault) the k8s agent injector of Hashicorp Vault. This demo is based on a Vault server in `dev` mode.

By making the VAULT_TOKEN variable, the webapp can be used for a demo with a Vault server in `dev`, `standalone` or `ha` mode.

## Usage

```shell

EXTERNAL_VAULT_ADDR=13.66.89.3
VAULT_ADDR=http://$EXTERNAL_VAULT_ADDR:8200
VAULT_TOKEN=s.Om1eJ8grxKInfsocu29XrE5G

docker run -d --name devwebapp --rm -e VAULT_ADDR=$VAULT_ADDR -e VAULT_TOKEN=$VAULT_TOKEN -p 8080:8080 dirc/devwebapp-ruby:latest

docker exec -it devwebapp curl -s localhost:8080

```

## Build

```shell
TAG=2.3
docker build -t dirc/devwebapp-ruby:$TAG .
docker build -t dirc/devwebapp-ruby:latest .

docker push dirc/devwebapp-ruby:$TAG
docker push dirc/devwebapp-ruby:latest

```
