#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Help Chips..."
curl -X POST "$BASE_URL/api/help-chips" -H "Content-Type: application/json" -d '{"data":{"label":"How to Apply","icon":"https://via.placeholder.com/32x32?text=Apply","order":1,"page":"home"}}'
curl -X POST "$BASE_URL/api/help-chips" -H "Content-Type: application/json" -d '{"data":{"label":"Check Status","icon":"https://via.placeholder.com/32x32?text=Status","order":2,"page":"home"}}'
curl -X POST "$BASE_URL/api/help-chips" -H "Content-Type: application/json" -d '{"data":{"label":"Loan Calculator","icon":"https://via.placeholder.com/32x32?text=Calculator","order":3,"page":"home"}}'
curl -X POST "$BASE_URL/api/help-chips" -H "Content-Type: application/json" -d '{"data":{"label":"Contact Support","icon":"https://via.placeholder.com/32x32?text=Support","order":4,"page":"home"}}'
echo "Help Chips seeding completed"
