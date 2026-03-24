#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Gold Loan Lender Configs..."
curl -X POST "$BASE_URL/api/gl-lender-configs" -H "Content-Type: application/json" -d '{"data":{"name":"ABC Gold Finance Ltd","description":"Leading gold lending partner with 15+ years experience","logo":"https://via.placeholder.com/200x100?text=ABC","rank":1,"is_active":true,"interest_rate_min":8.0,"interest_rate_max":10.0,"processing_fee":1.5,"loan_tenure_max":36,"special_offer":"25% discount on processing fees this month"}}'
curl -X POST "$BASE_URL/api/gl-lender-configs" -H "Content-Type: application/json" -d '{"data":{"name":"XYZ Gold Lenders","description":"Trusted gold lending company","logo":"https://via.placeholder.com/200x100?text=XYZ","rank":2,"is_active":true,"interest_rate_min":8.5,"interest_rate_max":10.5,"processing_fee":2.0,"loan_tenure_max":48,"special_offer":"Free insurance on loans above Rs. 1 Lakh"}}'
curl -X POST "$BASE_URL/api/gl-lender-configs" -H "Content-Type: application/json" -d '{"data":{"name":"PQR Financial Services","description":"Competitive gold loan provider","logo":"https://via.placeholder.com/200x100?text=PQR","rank":3,"is_active":true,"interest_rate_min":7.8,"interest_rate_max":9.8,"processing_fee":1.0,"loan_tenure_max":60,"special_offer":"Cashback on referrals"}}'
echo "Gold Loan Lender Configs seeding completed"
