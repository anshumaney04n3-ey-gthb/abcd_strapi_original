#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Gold Loan Campaign Configs..."
curl -X POST "$BASE_URL/api/gl-campaign-configs" -H "Content-Type: application/json" -d '{"data":{"campaign_name":"Gold Loan Special - Jan 2024","campaign_code":"GL_JAN_2024","description":"Special discount on processing fees","discount_percentage":25,"min_loan_amount":50000,"max_loan_amount":5000000,"start_date":"2024-01-01","end_date":"2024-01-31","is_active":true,"terms_conditions":"Valid for new customers. Applicable on loans above Rs. 50,000. Cannot be combined with other offers."}}'
curl -X POST "$BASE_URL/api/gl-campaign-configs" -H "Content-Type: application/json" -d '{"data":{"campaign_name":"Refer & Earn","campaign_code":"GL_REFER","description":"Earn cashback on successful referrals","discount_percentage":5,"min_loan_amount":25000,"max_loan_amount":10000000,"start_date":"2024-01-01","end_date":"2024-12-31","is_active":true,"terms_conditions":"Referral must be a new customer. Cashback credited within 7 days."}}'
curl -X POST "$BASE_URL/api/gl-campaign-configs" -H "Content-Type: application/json" -d '{"data":{"campaign_name":"Loyalty Program","campaign_code":"GL_LOYALTY","description":"Exclusive benefits for existing customers","discount_percentage":0.5,"min_loan_amount":100000,"max_loan_amount":25000000,"start_date":"2024-01-01","end_date":"2024-12-31","is_active":true,"terms_conditions":"Applicable to customers with 2+ previous loans."}}'
echo "Gold Loan Campaign Configs seeding completed"
