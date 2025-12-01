#!/bin/bash

# Stop on error
set -e

echo "Deploying to production..."

# Pull latest changes (if using git on server)
# git pull origin main

# Build and start containers
echo "Building and starting containers..."
docker compose -f docker-compose.prod.yml up -d --build

# Prune unused images to save space
echo "Cleaning up unused images..."
docker image prune -f

echo "Deployment complete! App is running on port 3000."
