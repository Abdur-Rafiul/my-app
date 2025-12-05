#!/bin/bash

# Create necessary directories
mkdir -p nginx
mkdir -p certbot-etc
mkdir -p web-root

# Start all services
docker compose -f docker-compose.prod.yml up -d

# Wait for nginx to be ready
echo "Waiting for nginx to start..."
sleep 10

# Run certbot to get SSL certificates
docker compose -f docker-compose.prod.yml run --rm certbot

# Restart nginx to load SSL certificates
docker compose -f docker-compose.prod.yml restart nginx

echo "SSL setup complete!"