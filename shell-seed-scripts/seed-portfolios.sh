#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Portfolios..."
curl -X POST "$BASE_URL/api/portfolios" -H "Content-Type: application/json" -d '{"data":{"title":"Conservative Gold Portfolio","description":"Low-risk gold investment portfolio for conservative investors","total_value":250000.00,"allocation":{"physical_gold":40,"digital_gold":30,"gold_funds":30},"risk_level":"LOW","recommended_for":"Conservative Investors","returns_1year":6.50}}'
curl -X POST "$BASE_URL/api/portfolios" -H "Content-Type: application/json" -d '{"data":{"title":"Balanced Gold Portfolio","description":"Balanced approach with mixed gold investments","total_value":750000.00,"allocation":{"physical_gold":30,"digital_gold":40,"gold_funds":30},"risk_level":"MEDIUM","recommended_for":"Balanced Investors","returns_1year":10.00}}'
curl -X POST "$BASE_URL/api/portfolios" -H "Content-Type: application/json" -d '{"data":{"title":"Aggressive Gold Portfolio","description":"Higher-return gold portfolio for aggressive investors","total_value":2500000.00,"allocation":{"physical_gold":20,"digital_gold":50,"gold_funds":30},"risk_level":"HIGH","recommended_for":"Aggressive Investors","returns_1year":15.00}}'
echo "Portfolios seeding completed"
