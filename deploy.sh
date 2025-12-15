#!/bin/bash
set -e

APP_NAME="project-next"
COMPOSE_FILE="docker-compose.yml"

echo "🚀 Starting local deployment of $APP_NAME"

echo "🛑 Stopping existing containers..."
docker compose down

echo "🔄 Rebuilding and starting containers..."
docker compose up -d --build

echo "🧹 Cleaning up old images..."
docker image prune -f

echo "🏥 Checking application health..."
sleep 10

if curl -f http://localhost:3000 > /dev/null 2>&1; then
    echo "✅ Deployment successful! Application is running at http://localhost:3000"
else
    echo "❌ Deployment failed! Application is not responding."
    exit 1
fi

echo "🎉 Deployment completed successfully!"