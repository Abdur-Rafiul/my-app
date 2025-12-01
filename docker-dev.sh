#!/bin/bash

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Docker is not running. Please start Docker first."
    exit 1
fi

# Build and start the containers
echo "Building and starting Next.js development container..."
docker-compose up -d --build

echo "Next.js development server is starting..."
echo "The application will be available at: http://localhost:3000"
echo "To view logs, run: docker-compose logs -f"