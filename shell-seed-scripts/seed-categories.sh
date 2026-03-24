#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"

echo "Seeding Categories..."

curl -X POST "$BASE_URL/api/categories" \
  -H "Content-Type: application/json" \
  -d '{"data":{"name":"Gold Loans","displayOrder":1}}'

curl -X POST "$BASE_URL/api/categories" \
  -H "Content-Type: application/json" \
  -d '{"data":{"name":"Digital Gold","displayOrder":2}}'

curl -X POST "$BASE_URL/api/categories" \
  -H "Content-Type: application/json" \
  -d '{"data":{"name":"Savings Plans","displayOrder":3}}'

curl -X POST "$BASE_URL/api/categories" \
  -H "Content-Type: application/json" \
  -d '{"data":{"name":"Investment Products","displayOrder":4}}'

echo "Categories seeding completed"
