#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Gold Loan Eligibility Configs..."
curl -X POST "$BASE_URL/api/gl-eligibility-configs" -H "Content-Type: application/json" -d '{"data":{"rule_name":"Minimum Age Requirement","rule_code":"MIN_AGE","description":"Applicant must be at least 21 years old","condition_value":"21","condition_type":"GREATER_THAN_EQUAL","field_name":"age","is_mandatory":true,"priority":1}}'
curl -X POST "$BASE_URL/api/gl-eligibility-configs" -H "Content-Type: application/json" -d '{"data":{"rule_name":"Gold Purity","rule_code":"GOLD_PURITY","description":"Gold must be at least 18K purity","condition_value":"18","condition_type":"GREATER_THAN_EQUAL","field_name":"purity","is_mandatory":true,"priority":2}}'
curl -X POST "$BASE_URL/api/gl-eligibility-configs" -H "Content-Type: application/json" -d '{"data":{"rule_name":"Minimum Gold Weight","rule_code":"MIN_WEIGHT","description":"Minimum 10 grams of gold required","condition_value":"10","condition_type":"GREATER_THAN_EQUAL","field_name":"gold_weight","is_mandatory":true,"priority":3}}'
curl -X POST "$BASE_URL/api/gl-eligibility-configs" -H "Content-Type: application/json" -d '{"data":{"rule_name":"KYC Verification","rule_code":"KYC_VERIFIED","description":"Customer must have completed KYC verification","condition_value":"true","condition_type":"EQUALS","field_name":"kyc_status","is_mandatory":true,"priority":4}}'
curl -X POST "$BASE_URL/api/gl-eligibility-configs" -H "Content-Type: application/json" -d '{"data":{"rule_name":"Valid Pan Card","rule_code":"PAN_VALID","description":"Valid PAN card must be on file","condition_value":"true","condition_type":"EQUALS","field_name":"pan_valid","is_mandatory":false,"priority":5}}'
echo "Gold Loan Eligibility Configs seeding completed"
