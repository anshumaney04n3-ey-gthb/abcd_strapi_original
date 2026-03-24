#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding DigiMetal Channel Mappings..."
curl -X POST "$BASE_URL/api/digimetal-channel-mappings" -H "Content-Type: application/json" -d '{"data":{"channelId":"vodafone-gold-default","partnerCode":"Vodafone","utmSources":["vodafone","vi","airtel-x","jio-prime"],"description":"Default channel mapping for Vodafone gold product"}}'
curl -X POST "$BASE_URL/api/digimetal-channel-mappings" -H "Content-Type: application/json" -d '{"data":{"channelId":"vodafone-silver-default","partnerCode":"Vodafone","utmSources":["vodafone","vi","airtel-x","jio-prime"],"description":"Default channel mapping for Vodafone silver product"}}'
curl -X POST "$BASE_URL/api/digimetal-channel-mappings" -H "Content-Type: application/json" -d '{"data":{"channelId":"airtel-gold-default","partnerCode":"Airtel","utmSources":["airtel","airtel-x","jio-prime"],"description":"Default channel mapping for Airtel gold product"}}'
curl -X POST "$BASE_URL/api/digimetal-channel-mappings" -H "Content-Type: application/json" -d '{"data":{"channelId":"airtel-silver-default","partnerCode":"Airtel","utmSources":["airtel","airtel-x","jio-prime"],"description":"Default channel mapping for Airtel silver product"}}'
curl -X POST "$BASE_URL/api/digimetal-channel-mappings" -H "Content-Type: application/json" -d '{"data":{"channelId":"jio-gold-default","partnerCode":"Jio","utmSources":["jio","jio-prime","reliance"],"description":"Default channel mapping for Jio gold product"}}'
curl -X POST "$BASE_URL/api/digimetal-channel-mappings" -H "Content-Type: application/json" -d '{"data":{"channelId":"jio-silver-default","partnerCode":"Jio","utmSources":["jio","jio-prime","reliance"],"description":"Default channel mapping for Jio silver product"}}'
curl -X POST "$BASE_URL/api/digimetal-channel-mappings" -H "Content-Type: application/json" -d '{"data":{"channelId":"web-default","partnerCode":"Web","utmSources":["google","direct","organic"],"description":"Default channel mapping for web traffic"}}'
curl -X POST "$BASE_URL/api/digimetal-channel-mappings" -H "Content-Type: application/json" -d '{"data":{"channelId":"app-default","partnerCode":"App","utmSources":["app","mobile"],"description":"Default channel mapping for app traffic"}}'
echo "DigiMetal Channel Mappings seeding completed"
