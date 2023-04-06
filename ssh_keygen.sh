# Script to generate an SSH key pair
# Usage: ./ssh_keygen.sh [email_address] [file_name]

#!/bin/bash

# Prompt the user for their email address if not provided
if [[ -z "${1}" ]]; then
  read -p "Enter email address: " email
else
  email="${1}"
fi

# Prompt the user for a file name to save the key pair if not provided
if [[ -z "${2}" ]]; then
  read -p "Enter file name to save key pair: " filename
else
  filename="${2}"
fi

# Prompt the user to enter a passphrase for the key pair
read -s -p "Enter passphrase for key pair (blank for none): " passphrase
echo

# Generate SSH key pair
ssh-keygen -t ed25519 -C "${email}" -f "$HOME/.ssh/ed25519_${filename}" -q -N "${passphrase}"

# Print public key to terminal
echo "Public key file : $HOME/.ssh/ed25519_${filename}"
echo "Public key:" `cat $HOME/.ssh/ed25519_${filename}.pub`
