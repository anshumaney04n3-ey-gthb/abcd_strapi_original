#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Order History V2s..."
curl -X POST "$BASE_URL/api/order-history-v-twos" -H "Content-Type: application/json" -d '{"data":{"order_id":"ORD_V2_001","customer_id":"CUST_001","timestamp":"2026-02-20","product_type":"GOLD_LOAN","transaction_amount":550000.00,"status":"SUCCESS","payment_gateway":"Stripe","transaction_id":"TXN_001"}}'
curl -X POST "$BASE_URL/api/order-history-v-twos" -H "Content-Type: application/json" -d '{"data":{"order_id":"ORD_V2_002","customer_id":"CUST_002","timestamp":"2026-03-02","product_type":"DIGITAL_GOLD","transaction_amount":60000.00,"status":"SUCCESS","payment_gateway":"RazorPay","transaction_id":"TXN_002"}}'
curl -X POST "$BASE_URL/api/order-history-v-twos" -H "Content-Type: application/json" -d '{"data":{"order_id":"ORD_V2_003","customer_id":"CUST_003","timestamp":"2026-03-12","product_type":"GOLD_SIP","transaction_amount":12000.00,"status":"SUCCESS","payment_gateway":"ICICI Bank","transaction_id":"TXN_003"}}'
echo "Order History V2s seeding completed"
