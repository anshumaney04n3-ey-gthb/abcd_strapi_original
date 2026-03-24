#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Non-Executable Quotes..."
curl -X POST "$BASE_URL/api/non-executable-quotes" -H "Content-Type: application/json" -d '{"data":{"customer_id":"CUST_001","gold_weight_grams":100,"purity":"22K","quote_amount":650000.00,"interest_rate":8.5,"processing_fee":1.5,"validity_days":7,"status":"EXPIRED"}}'
curl -X POST "$BASE_URL/api/non-executable-quotes" -H "Content-Type: application/json" -d '{"data":{"customer_id":"CUST_002","gold_weight_grams":250,"purity":"24K","quote_amount":1650000.00,"interest_rate":8.5,"processing_fee":1.5,"validity_days":7,"status":"REJECTED"}}'
curl -X POST "$BASE_URL/api/non-executable-quotes" -H "Content-Type: application/json" -d '{"data":{"customer_id":"CUST_003","gold_weight_grams":50,"purity":"18K","quote_amount":250000.00,"interest_rate":9.0,"processing_fee":2.0,"validity_days":3,"status":"CANCELLED"}}'
echo "Non-Executable Quotes seeding completed"
