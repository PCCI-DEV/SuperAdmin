#!/bin/bash
# Error handling
set -e
SOURCE_FOLDER="hub"
if [ -f ".provisoned" ]; then
    echo "Provisioning already done. Skipping..."
    # Start the React app
    echo "Starting the React app..."
    cd "/home/vagrant/TekenaERP/$SOURCE_FOLDER"
    npm start
fi
    # Update apt-get
    echo "Updating apt-get..."
    sudo apt-get update

    # Install Node.js and npm
    echo "Installing developer packages..."
    sudo apt-get install build-essential curl -y

    #echo "Installing Git..."
    #sudo apt-get install git -y
    sudo su
    echo "Installing npm..."
    curl -sL https://deb.nodesource.com/setup_22.x | sudo -E bash -
    export NODE_OPTIONS="--max-old-space-size=8192"

    sudo apt-get update

    sudo apt-get install --yes nodejs
    npm install -g npm@latest
    sudo touch .provisoned

    # Set environment variables
    export NODE_ENV=development

    # Create project directory
    TEKENAERP_DIR="/home/vagrant/TekenaERP"
    if [ ! -d "$TEKENAERP_DIR" ]; then
        mkdir -p "$TEKENAERP_DIR"
    fi

    # Navigate to the synced folder
    cd "$TEKENAERP_DIR"
    
    # Clean npm cache
    echo "Cleaning npm cache..."
    sudo npm cache clean --force

    # Install create-react-app globally
    echo "Installing create-react-app globally..."
    sudo npm install -g create-react-app

    # Create a new React app
    echo "Creating a new React app..."
    sudo npx create-react-app@latest "$SOURCE_FOLDER"

    # Navigate to the newly created app directory
    cd "$SOURCE_FOLDER"
    
    # Build the React app
    #echo "Building the React app..."
    npm run build

    # Start the React app
    echo "Starting the React app..."
    npm start



