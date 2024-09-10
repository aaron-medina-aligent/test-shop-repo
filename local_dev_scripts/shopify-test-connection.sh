#!/bin/bash

# Load common utility functions and variables
source "$(dirname "$0")/utils.sh"

# Load environment variables
load_env


# Check if required variables are set
if [ -z "$SHOPIFY_STORE" ] || [ -z "$SHOPIFY_ACCESS_TOKEN" ]; then
    echo "Error: SHOPIFY_STORE or SHOPIFY_ACCESS_TOKEN is not set in the .env file."
    exit 1
fi

# Test connection to Shopify using the access token
response=$(curl -s -o /dev/null -w "%{http_code}" -X GET "https://${SHOPIFY_STORE}/admin/api/2023-07/shop.json" \
    -H "X-Shopify-Access-Token: $SHOPIFY_ACCESS_TOKEN")

# Check the HTTP status code
if [ "$response" -eq 200 ]; then
    echo "Connection to Shopify store '${SHOPIFY_STORE}' is successful. Access token is valid."
elif [ "$response" -eq 401 ]; then
    echo "Error: Unauthorized. The access token is invalid or has insufficient permissions."
elif [ "$response" -eq 403 ]; then
    echo "Error: Forbidden. The access token is valid but does not have the necessary permissions."
else
    echo "Error: Failed to connect to Shopify store. HTTP status code: $response."
fi
