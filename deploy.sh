#!/bin/bash

# Variables
USER="ndgserver"  
HOST="201.190.115.29"  
REMOTE_DIR="/Users/ndgserver/electivadiadespliegues/bryanBenavides"  # Updated to /home
REPO_URL="https://github.com/Rainydata/BackendserverSSH.git"
BRANCH="main"
LOCAL_DIR="/mnt/c/Users/benav/OneDrive/Documentos/my_api"

# Connect to the server
ssh -t $USER@$HOST << EOF
  
    # Create the remote directory if it doesn't exist
    if [ ! -d "$REMOTE_DIR" ]; then
        echo "Cloning the repository into $REMOTE_DIR..."
        git clone $REPO_URL $REMOTE_DIR
    fi

    # Navigate to the remote directory
    cd $REMOTE_DIR

    # Update the repository
    echo "Updating the repository..."
    git fetch origin
    git reset --hard origin/$BRANCH

    # Generate greetings.txt
    echo "Creating greetings.txt..."
    echo "Deployment successful for the microservices class." > greetings.txt

    echo "Deployment completed on the remote server."
EOF

echo "Deployment completed locally."