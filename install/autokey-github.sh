#!/usr/bin/bash
# Requirements
#   You will need to have created a GitHub Access Token with admin:public_key permissions

# Usage
#   chmod +x autokey-github.sh
#   ./autokey-github.sh <YOUR-GITHUB-ACCESS-TOKEN>
# Reference
#   https://gist.github.com/petersellars/c6fff3657d53d053a15e57862fc6f567
#   https://nathanielhoag.com/blog/2014/05/26/automate-ssh-key-generation-and-deployment/
#   https://gist.github.com/nhoag/7043570bfe32003eb8a1
#   https://help.github.com/articles/testing-your-ssh-connection/
#   https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
#   https://developer.github.com/v3/users/keys/

set -e

npm install -g @bitwarden/cli
bw login --apikey || true
echo "Logged in!"
export BW_SESSION
BW_SESSION=$(bw unlock --passwordenv BW_PASSWORD --raw)
echo "unlocked"

# Generate SSH Key and Deploy to Github
TOKEN=$(bw get item github.com | jq -r '.fields[0].value')

ssh-keygen -t ed25519 -C "joe.davidson.21111@gmail.com" -f ~/.ssh/github_rsa

PUBKEY=$(cat ~/.ssh/github_rsa.pub)
TITLE=$(hostname)

RESPONSE=$(curl -s -H "Authorization: token ${TOKEN}" \
    -X POST --data-binary "{\"title\":\"${TITLE}\",\"key\":\"${PUBKEY}\"}" \
    https://api.github.com/user/keys)

echo "$RESPONSE"
KEYID=$(echo "$RESPONSE" |
    grep -o '\"id.*' |
    grep -o "[0-9]*" |
    grep -m 1 "[0-9]*")

echo "Public key deployed to remote service"

# Add SSH Key to the local ssh-agent"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_rsa

echo "Added SSH key to the ssh-agent"

# Test the SSH connection

ssh -T git@github.com || true
echo "GITHUB_ACCESS_TOKEN=$TOKEN" >"$DOTFILES_DIR/system/.private_env"
