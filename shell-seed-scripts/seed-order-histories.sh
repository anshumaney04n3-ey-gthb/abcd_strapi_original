#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Order Histories..."
curl -X POST "$BASE_URL/api/order-histories" -H "Content-Type: application/json" -d '{"data":{"order_number":"ORD_001","customer_id":"CUST_001","order_date":"2026-02-15","product_name":"Gold Loan - 100g","quantity":1,"amount":550000.00,"status":"COMPLETED","payment_method":"Bank Transfer"}}'
curl -X POST "$BASE_URL/api/order-histories" -H "Content-Type: application/json" -d '{"data":{"order_number":"ORD_002","customer_id":"CUST_002","order_date":"2026-02-25","product_name":"Digital Gold - 10g","quantity":1,"amount":60000.00,"status":"COMPLETED","payment_method":"Credit Card"}}'
curl -X POST "$BASE_URL/api/order-histories" -H "Content-Type: application/json" -d '{"data":{"order_number":"ORD_003","customer_id":"CUST_003","order_date":"2026-03-05","product_name":"Gold SIP - Monthly","quantity":12,"amount":135000.00,"status":"PROCESSING","payment_method":"Net Banking"}}'
echo "Order Histories seeding completed"
