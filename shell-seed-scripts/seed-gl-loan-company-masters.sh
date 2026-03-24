#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Gold Loan Company Masters..."
curl -X POST "$BASE_URL/api/gl-loan-company-masters" -H "Content-Type: application/json" -d '{"data":{"company_name":"ABC Gold Finance Ltd","company_code":"ABC_GL","headquarters":"Mumbai, India","contact_email":"support@abcgold.com","contact_phone":"+91-22-XXXX-XXXX","website":"https://www.abcgold.com","registration_number":"REG_ABC_001","is_verified":true,"is_active":true,"pan_number":"AAAA0000AA","license_type":"NBFC","rating":4.5}}'
curl -X POST "$BASE_URL/api/gl-loan-company-masters" -H "Content-Type: application/json" -d '{"data":{"company_name":"XYZ Gold Lenders Limited","company_code":"XYZ_GL","headquarters":"Bangalore, India","contact_email":"info@xyzgold.com","contact_phone":"+91-80-XXXX-XXXX","website":"https://www.xyzgold.com","registration_number":"REG_XYZ_001","is_verified":true,"is_active":true,"pan_number":"AAAB0000AA","license_type":"NBFC","rating":4.3}}'
curl -X POST "$BASE_URL/api/gl-loan-company-masters" -H "Content-Type: application/json" -d '{"data":{"company_name":"PQR Financial Services","company_code":"PQR_GL","headquarters":"Delhi, India","contact_email":"customer@pqrfinance.com","contact_phone":"+91-11-XXXX-XXXX","website":"https://www.pqrfinance.com","registration_number":"REG_PQR_001","is_verified":true,"is_active":true,"pan_number":"AAAC0000AA","license_type":"NBFC","rating":4.4}}'
echo "Gold Loan Company Masters seeding completed"
