#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Gold Loan Journey Screens..."
curl -X POST "$BASE_URL/api/gl-journey-screens" -H "Content-Type: application/json" -d '{"data":{"screen_name":"Application Start","screen_code":"GL_START","screen_title":"Apply for Gold Loan","description":"Begin your gold loan application process","display_order":1}}'
curl -X POST "$BASE_URL/api/gl-journey-screens" -H "Content-Type: application/json" -d '{"data":{"screen_name":"Gold Details","screen_code":"GL_GOLD_DETAILS","screen_title":"Enter Gold Details","description":"Provide information about your gold","display_order":2}}'
curl -X POST "$BASE_URL/api/gl-journey-screens" -H "Content-Type: application/json" -d '{"data":{"screen_name":"KYC Verification","screen_code":"GL_KYC","screen_title":"Verify Your Identity","description":"Complete KYC verification for faster approval","display_order":3}}'
curl -X POST "$BASE_URL/api/gl-journey-screens" -H "Content-Type: application/json" -d '{"data":{"screen_name":"Loan Terms","screen_code":"GL_TERMS","screen_title":"Review Loan Terms","description":"Review and accept loan terms","display_order":4}}'
curl -X POST "$BASE_URL/api/gl-journey-screens" -H "Content-Type: application/json" -d '{"data":{"screen_name":"Success","screen_code":"GL_SUCCESS","screen_title":"Application Submitted","description":"Your application has been submitted successfully","display_order":5}}'
echo "Gold Loan Journey Screens seeding completed"
