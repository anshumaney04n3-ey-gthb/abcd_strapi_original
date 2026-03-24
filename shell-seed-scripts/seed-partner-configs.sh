#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Partner Configs..."
curl -X POST "$BASE_URL/api/partner-configs" -H "Content-Type: application/json" -d '{"data":{"name":"Primary Partner Config","partner_name":"ABC Financial Services","partner_logo":"https://via.placeholder.com/200x100?text=ABC","min_loan_amount":25000,"max_loan_amount":5000000,"interest_rate":8.5,"processing_fee":1.5,"enabled":true,"priority":1}}'
curl -X POST "$BASE_URL/api/partner-configs" -H "Content-Type: application/json" -d '{"data":{"name":"Secondary Partner Config","partner_name":"XYZ Gold Finance","partner_logo":"https://via.placeholder.com/200x100?text=XYZ","min_loan_amount":50000,"max_loan_amount":10000000,"interest_rate":9.25,"processing_fee":2.0,"enabled":true,"priority":2}}'
curl -X POST "$BASE_URL/api/partner-configs" -H "Content-Type: application/json" -d '{"data":{"name":"Tertiary Partner Config","partner_name":"PQR Lenders Ltd","partner_logo":"https://via.placeholder.com/200x100?text=PQR","min_loan_amount":100000,"max_loan_amount":25000000,"interest_rate":7.8,"processing_fee":1.0,"enabled":true,"priority":3}}'
echo "Partner Configs seeding completed"
