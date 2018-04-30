#!/bin/bash
set -e

REPO_PATH='id-sk/idsk_template'

echo "Add config for $REPO_PATH"

git config --global user.name "ID-SK CI"
git config --global user.email "ernest.walzel+idsk@slovensko.digital"

# This openssl command was generated automatically by `travis encrypt-file`, see `.travis/README.md` for more details
openssl aes-256-cbc -K $encrypted_7dd2cccca12c_key -iv $encrypted_7dd2cccca12c_iv -in .travis/secrets.tar.enc -out .travis/secrets.tar -d

tar xvf .travis/secrets.tar
mkdir -p ~/.gem/
mv secrets/gem_credentials ~/.gem/credentials
chmod 0600 ~/.gem/credentials
mv secrets/npmrc ~/.npmrc
