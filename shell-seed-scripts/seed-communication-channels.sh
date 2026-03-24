#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Communication Channels..."
curl -X POST "$BASE_URL/api/communication-channels" -H "Content-Type: application/json" -d '{"data":{"name":"Email","description":"Email communication channel","enabled":true}}'
curl -X POST "$BASE_URL/api/communication-channels" -H "Content-Type: application/json" -d '{"data":{"name":"SMS","description":"SMS notification channel","enabled":true}}'
curl -X POST "$BASE_URL/api/communication-channels" -H "Content-Type: application/json" -d '{"data":{"name":"Push Notification","description":"Mobile push notifications","enabled":true}}'
curl -X POST "$BASE_URL/api/communication-channels" -H "Content-Type: application/json" -d '{"data":{"name":"WhatsApp","description":"WhatsApp messaging channel","enabled":false}}'
echo "Communication Channels seeding completed"
