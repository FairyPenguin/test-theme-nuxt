#!/bin/bash
set -e  # Exit on error
set -x  # Enable debugging

# Login to Docker Hub
# echo '${{ secrets.DOCKERHUB_TOKEN }}' | docker login --username ${{ secrets.DOCKERHUB_USERNAME }} --password-stdin
echo "$DOCKERHUB_TOKEN" | docker login --username "$DOCKERHUB_USERNAME" --password-stdin

echo "Starting deployment as user: $(whoami)"

# Remove only the old containers for the nest-backend service

# Pull the latest image
# docker pull greyfighter/prepre:nest-app-v2 

# Navigate to the project directory
cd /opt/projects/frontend-nuxt

# docker compose 
# docker-compose -f docker-compose.yml pull

docker-compose rm -f nuxt-frontend || true

docker pull greyfighter/prepre:nuxt-app-v1


# docker-compose -f docker-compose.yml up -d --force-recreate --scale nest-backend=3

# Remove any lingering containers
docker rm -f $(docker ps -a -q -f name=nnuxt-frontend) || true
# docker rm -f $(docker ps -a -q -f name=backend-nest_database_1) || true

# Remove existing container names to avoid conflicts
docker compose rm -f || true

docker-compose -f docker-compose-frontend.yml up -d --force-recreate --scale nnuxt-frontend=3
# Start fresh with new containers
# docker compose up -d --force-recreate --scale nest-backend=3



# Verify deployment
echo "Verifying deployment..."
sleep 10  # Give containers time to start
docker ps | grep nnuxt-frontend || echo "No nest-backend containers running"    echo "Number of running instances:"
docker ps -q -f name=nnuxt-frontend | wc -l

sleep 10

 
: || {
a or --all: This option tells Docker to remove all unused images, not just the dangling ones. This means it will remove any images that are not currently associated with a container, regardless of whether they have a tag.
f or --force: This option forces the removal of the images without prompting for confirmation. It’s useful for automation or scripts where you don’t want to manually confirm the action.
}

# Remove all unused images (those not in use by any container)
docker image prune -a -f

# sshpass -p "$VPS_PASSWORD" ssh -i ~/.ssh/id_rsa admin@49.13.174.222 'bash -s' 
# cd # Navigate to the project directory # cd #
cd /opt/projects/frontend-nuxt/scripts
echo ${pwd}
sudo rm deploy.sh