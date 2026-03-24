#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Gold Loan FAQs..."
curl -X POST "$BASE_URL/api/gl-faqs" -H "Content-Type: application/json" -d '{"data":{"question":"What is the maximum loan I can get?","answer":"The maximum loan amount depends on the value of your gold. You can get up to 75-85% of the current market value.","category":"Loan Amount","order":1}}'
curl -X POST "$BASE_URL/api/gl-faqs" -H "Content-Type: application/json" -d '{"data":{"question":"Is my gold insured?","answer":"Yes, all gold deposited is fully insured against theft, loss, and damage. Insurance coverage is included in the loan charges.","category":"Safety & Insurance","order":2}}'
curl -X POST "$BASE_URL/api/gl-faqs" -H "Content-Type: application/json" -d '{"data":{"question":"How is interest calculated?","answer":"Interest is calculated on a monthly basis on the outstanding loan amount. Rates vary from 8-12% per annum depending on market conditions.","category":"Interest & Charges","order":3}}'
curl -X POST "$BASE_URL/api/gl-faqs" -H "Content-Type: application/json" -d '{"data":{"question":"Can I repay early without penalty?","answer":"Yes, you can repay your loan at any time without any prepayment penalty. Your gold will be returned immediately upon full repayment.","category":"Repayment","order":4}}'
curl -X POST "$BASE_URL/api/gl-faqs" -H "Content-Type: application/json" -d '{"data":{"question":"How long does verification take?","answer":"Gold verification typically takes 30 minutes to 1 hour. Assessment is done by our certified valuers using advanced testing equipment.","category":"Process","order":5}}'
echo "Gold Loan FAQs seeding completed"
