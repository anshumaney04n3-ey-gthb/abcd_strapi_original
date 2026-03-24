#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding User SIPs..."
curl -X POST "$BASE_URL/api/user-sips" -H "Content-Type: application/json" -d '{"data":{"customerRefId":"CUST_REF_001","channel":"WEB","source":"FSD","sips":[{"sip_id":"SIP_001","amount":5000,"start_date":"2024-01-01","frequency":"MONTHLY","status":"ACTIVE"},{"sip_id":"SIP_002","amount":10000,"start_date":"2024-01-15","frequency":"MONTHLY","status":"ACTIVE"}],"total_active":75000.00}}'
curl -X POST "$BASE_URL/api/user-sips" -H "Content-Type: application/json" -d '{"data":{"customerRefId":"CUST_REF_002","channel":"APP","source":"INTERNAL","sips":[{"sip_id":"SIP_003","amount":2000,"start_date":"2024-02-01","frequency":"WEEKLY","status":"PAUSED"}],"total_active":35000.00}}'
echo "User SIPs seeding completed"
