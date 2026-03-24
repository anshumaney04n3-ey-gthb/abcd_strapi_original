#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Sub-Categories..."
curl -X POST "$BASE_URL/api/sub-categories" -H "Content-Type: application/json" -d '{"data":{"name":"Personal Loans","displayOrder":1,"category":1}}'
curl -X POST "$BASE_URL/api/sub-categories" -H "Content-Type: application/json" -d '{"data":{"name":"Business Loans","displayOrder":2,"category":1}}'
curl -X POST "$BASE_URL/api/sub-categories" -H "Content-Type: application/json" -d '{"data":{"name":"Secured Gold Savings","displayOrder":1,"category":2}}'
curl -X POST "$BASE_URL/api/sub-categories" -H "Content-Type: application/json" -d '{"data":{"name":"Flexible Plans","displayOrder":2,"category":3}}'
echo "Sub-Categories seeding completed"
