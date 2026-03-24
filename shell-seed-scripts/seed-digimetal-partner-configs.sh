#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding DigiMetal Partner Configs..."

curl -X POST "$BASE_URL/api/digimetal-partner-configs" \
  -H "Content-Type: application/json" \
  -d '{"partnerCode": "Vodafone", "partnerName": "Vodafone India", "logo": null}'

curl -X POST "$BASE_URL/api/digimetal-partner-configs" \
  -H "Content-Type: application/json" \
  -d '{"partnerCode": "Airtel", "partnerName": "Airtel India", "logo": null}'

curl -X POST "$BASE_URL/api/digimetal-partner-configs" \
  -H "Content-Type: application/json" \
  -d '{"partnerCode": "Jio", "partnerName": "Jio Platforms", "logo": null}'

curl -X POST "$BASE_URL/api/digimetal-partner-configs" \
  -H "Content-Type: application/json" \
  -d '{"partnerCode": "Web", "partnerName": "Web Channel", "logo": null}'

curl -X POST "$BASE_URL/api/digimetal-partner-configs" \
  -H "Content-Type: application/json" \
  -d '{"partnerCode": "App", "partnerName": "Mobile App Channel", "logo": null}'

echo "DigiMetal Partner Configs seeding completed"
