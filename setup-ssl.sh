#!/bin/bash

# Stop on error
set -e

echo "=== SSL Certificate Setup for hoopnetic.cloud ==="
echo ""

# Check if email is provided
if [ -z "$1" ]; then
    echo "Usage: ./setup-ssl.sh your-email@example.com"
    exit 1
fi

EMAIL=$1
DOMAIN="hoopnetic.cloud"

echo "Email: $EMAIL"
echo "Domain: $DOMAIN"
echo ""

# Update the email in docker-compose.prod.yml
sed -i "s/your-email@example.com/$EMAIL/g" docker-compose.prod.yml

echo "Step 1: Starting Nginx and Next.js containers..."
docker compose -f docker-compose.prod.yml up -d nextjs nginx

echo ""
echo "Step 2: Waiting for Nginx to be ready..."
sleep 5

echo ""
echo "Step 3: Obtaining SSL certificate from Let's Encrypt..."
docker compose -f docker-compose.prod.yml run --rm certbot

echo ""
echo "Step 4: Restarting Nginx to load SSL certificates..."
docker compose -f docker-compose.prod.yml restart nginx

echo ""
echo "=== SSL Setup Complete! ==="
echo ""
echo "Your site should now be accessible at:"
echo "  https://$DOMAIN"
echo "  https://www.$DOMAIN"
echo ""
echo "Certificate auto-renewal cron job:"
echo "Add this to your crontab (run 'crontab -e'):"
echo "0 0 * * 0 cd $(pwd) && docker compose -f docker-compose.prod.yml run --rm certbot renew && docker compose -f docker-compose.prod.yml restart nginx"
echo ""
