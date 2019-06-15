#!/usr/bin/env bash

set -x
set -e

commitSha=$(git rev-parse --short HEAD)
commitMessage=$(git log --oneline -n 1)

rm -rf /tmp/flutter.cn-prebuilt/ || true

git clone https://cfug-deploy:${CFUG_DEPLOY_KEY}@github.com/cfug-deploy/flutter.cn-prebuilt.git /tmp/flutter.cn-prebuilt

cp -r _site/* /tmp/flutter.cn-prebuilt/

cd /tmp/flutter.cn-prebuilt

git init
git add .
git commit --allow-empty -am "${commitMessage}"

git push -u -f origin master

cd -
