#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Gold Loan Calculator Configs..."
curl -X POST "$BASE_URL/api/gl-calculator-configs" -H "Content-Type: application/json" -d '{"data":{"title":"Gold Loan Calculator","description":"Calculate your loan amount based on gold weight and current price","icon":"https://via.placeholder.com/100x100?text=Calculator","min_gold_weight":10,"max_gold_weight":1000,"default_purity":"22K","ltv_percentage":75,"disclaimer":"This is an estimated calculation. Actual loan amount may vary based on market conditions.","cta_text":"Calculate Now"}}'
echo "Gold Loan Calculator Configs seeding completed"
