#!/bin/bash


# Remove existing Docker packages (if any)
echo "Warning: This will (re)install the Docker on the system to ensure compatibility. Select 'n' if you want to skip it"
read -p "(Re)install Docker? (Requires apt package manager on the system)  (y/n): " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo "Installing Docker..."
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
        sudo apt-get remove $pkg
    done

    # Add Docker's official GPG key
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update and install Docker
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
    echo "Attempting to use the current Docker installation"
fi

# Warning message before running the prune command
echo "Do you want to prune docker?"
echo "Warning: This will delete all unused containers, images, volumes, and networks."
echo "This operation cannot be undone."

# Prompt user for confirmation
read -p "Are you sure you want to proceed? (y/n): " confirm

# Check if user confirmed
if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo "Proceeding with docker system prune..."
    sudo docker system prune -af --volumes
else
    echo "Operation canceled."
fi

# Allow Docker to access X server (useful for GUI apps or containers)
xhost +local:docker

# Start Docker Compose
sudo docker compose up

