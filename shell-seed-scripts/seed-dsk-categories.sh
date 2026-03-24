#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding DSK Categories..."
curl -X POST "$BASE_URL/api/dsk-categories" -H "Content-Type: application/json" -d '{"data":{"name":"Gold Loans","description":"Short-term secured loans against gold","icon":"https://via.placeholder.com/100x100?text=Loan","order":1,"active":true}}'
curl -X POST "$BASE_URL/api/dsk-categories" -H "Content-Type: application/json" -d '{"data":{"name":"Digital Gold","description":"Buy and invest in digital gold","icon":"https://via.placeholder.com/100x100?text=Digital","order":2,"active":true}}'
curl -X POST "$BASE_URL/api/dsk-categories" -H "Content-Type: application/json" -d '{"data":{"name":"Gold Savings","description":"Regular savings plans in gold","icon":"https://via.placeholder.com/100x100?text=Savings","order":3,"active":true}}'
echo "DSK Categories seeding completed"
