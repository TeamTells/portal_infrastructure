#!/bin/bash

# Check if command line arguments are passed
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 root@hostname"
    exit 1
fi

# Split the argument into username and hostname
REMOTE="$1"
LOCAL_USERNAME=$(whoami)

# Display the public key and copy it
PUBLIC_KEY=$(cat ~/.ssh/id_rsa.pub)

read -p "Enter a password for the new user: " PASSWORD
echo

# SSH into the remote machine and create a new user with sudo privileges
ssh -t ${REMOTE} "
sudo adduser ${LOCAL_USERNAME} --gecos 'First Last,RoomNumber,WorkPhone,HomePhone' --disabled-password
echo '${LOCAL_USERNAME}:${PASSWORD}' | sudo chpasswd
echo '${LOCAL_USERNAME} ALL=(ALL:ALL) ALL' | sudo tee -a /etc/sudoers

# Create .ssh directory for the new user
sudo mkdir /home/${LOCAL_USERNAME}/.ssh
sudo chmod 700 /home/${LOCAL_USERNAME}/.ssh

# Create authorized_keys file and copy the public key
echo '${PUBLIC_KEY}' | sudo tee /home/${LOCAL_USERNAME}/.ssh/authorized_keys
sudo chmod 600 /home/${LOCAL_USERNAME}/.ssh/authorized_keys
sudo chown -R ${LOCAL_USERNAME}:${LOCAL_USERNAME} /home/${LOCAL_USERNAME}/.ssh
"