#!/bin/bash
export AWS_ACCESS_KEY_ID=${bamboo.AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${bamboo.AWS_SECRET_ACCESS_KEY_PASSWORD}
export AWS_DEFAULT_REGION=eu-west-1

export APPLICATION_NAME=Product-Store-API

export ECS_REPOSITORY=012177264511.dkr.ecr.eu-west-1.amazonaws.com/ecr-euw1-ap-pe-product-store-api
export S3_BUCKET=s3-euw1-ap-pe-docker

export TAG=$APPLICATION_NAME-build-${bamboo.buildNumber}
export SONAR_SERVER_URL=${bamboo.SONAR_SERVER_URL}

# For test cases
export NODE_ENV=test
export CREATE_MANIFEST=true
export SKIP_TEST=true
export SKIP_SONAR=true
export SKIP_TYPINGS=true

export MEMORY=2048
export HOST_PORT=8200
export CONTAINER_PORT=3000

# this will replace all the github ssh urls with the token urls.
# references.
# https://git-scm.com/docs/git-config#git-config-urlltbasegtinsteadOf
# https://stackoverflow.com/questions/23210437/npm-install-private-github-repositories-by-dependency-in-package-json

git config --global url."https://${bamboo_GH_TOKEN_PASSWORD}@github.com".insteadOf ssh://git@github.com

git archive --remote=ssh://git@bitbucket.org:shibir19/testmigration.git HEAD: unsdg/node/ebs | tar -x
bash testmigration/test.sh
