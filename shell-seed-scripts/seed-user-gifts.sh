#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding User Gifts..."
curl -X POST "$BASE_URL/api/user-gifts" -H "Content-Type: application/json" -d '{"data":{"customer_id":"CUST_001","gift_type":"GOLD_VOUCHER","gift_value":7500.00,"currency":"INR","issued_date":"2026-03-17","expiry_date":"2026-09-13","status":"ACTIVE","redeemed":false,"gift_code":"GIFT_001_123"}}'
curl -X POST "$BASE_URL/api/user-gifts" -H "Content-Type: application/json" -d '{"data":{"customer_id":"CUST_002","gift_type":"CASHBACK","gift_value":1200.00,"currency":"INR","issued_date":"2026-03-07","expiry_date":"2026-08-14","status":"ACTIVE","redeemed":true,"gift_code":"GIFT_002_456","redeemed_date":"2026-03-17"}}'
curl -X POST "$BASE_URL/api/user-gifts" -H "Content-Type: application/json" -d '{"data":{"customer_id":"CUST_003","gift_type":"DISCOUNT_COUPON","gift_value":15,"currency":"PERCENT","issued_date":"2026-03-17","expiry_date":"2026-06-15","status":"ACTIVE","redeemed":false,"gift_code":"GIFT_003_789"}}'
echo "User Gifts seeding completed"
