
# devwebapp-ruby

Extended version of [burtlo/devwebapp-ruby:k8s](https://hub.docker.com/r/burtlo/devwebapp-ruby)

The web app used to demo consuming secrets from Hashicorp Vault. The image of `burtlo` is based on a Vault server in `dev` mode.
For example in this [demo](https://learn.hashicorp.com/vault/getting-started-k8s/external-vault).

This `dirc/devwebapp-ruby` image is an extension. By making the VAULT_TOKEN variable, the webapp can be used for a demo with a Vault server in `dev`, `standalone` or `ha` mode.

## Prerequisites
Follow the instructions documented header
[Integrate a Kubernetes Cluster with an External Vault Server](https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-external-vault?optInFrom=learn)


Note: We need to add the X-Vault-Namespace header to be able to get secrets from HashiCorp Vault Enterprise or HCP Vault.

Change the following step from the instructions mentioned above.

``` shell

cat > devwebapp.yaml <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: devwebapp
  labels:
    app: devwebapp
spec:
  serviceAccountName: internal-app
  containers:
    - name: app
      image: cvanballegooijen/devwebapp-ruby:latest
      env:
      - name: VAULT_ADDR
        value: "http://$EXTERNAL_VAULT_ADDR:8200"
      - name: VAULT_TOKEN
        value: root
      - name: VAULT_NAMESPACE
        value: admin
EOF
```

## Usage

```shell

EXTERNAL_VAULT_ADDR=13.66.89.3
VAULT_ADDR=http://$EXTERNAL_VAULT_ADDR:8200
VAULT_TOKEN=s.Om1eJ8grxKInfsocu29XrE5G
VAULT_NAMESPACE=admin

docker run -d --name devwebapp --rm -e VAULT_ADDR=$VAULT_ADDR -e VAULT_TOKEN=$VAULT_TOKEN -e VAULT_NAMESPACE=admin -p 8080:8080 dirc/devwebapp-ruby:latest

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
