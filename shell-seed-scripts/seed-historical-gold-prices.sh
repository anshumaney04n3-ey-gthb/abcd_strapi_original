#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Historical Gold Prices..."
# Generate 31 days of sample gold price data
for i in $(seq 30 -1 0); do
  date=$(date -d "$i days ago" +%Y-%m-%d)
  price=$(shuf -i 6300-6700 -n 1)
  curl -X POST "$BASE_URL/api/historical-gold-prices" -H "Content-Type: application/json" -d "{\"data\":{\"date\":\"$date\",\"price_per_gram\":$price.00,\"price_per_ounce\":205000.00,\"currency\":\"INR\",\"source\":\"Market Data\"}}"
done
echo "Historical Gold Prices seeding completed"
