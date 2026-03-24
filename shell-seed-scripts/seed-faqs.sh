#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding FAQs..."
curl -X POST "$BASE_URL/api/faqs" -H "Content-Type: application/json" -d '{"data":{"channel":"WEB","page":"landing","question":"What is a gold loan?","answer":"A gold loan is a secured loan where you pledge your gold jewelry as collateral to borrow money quickly.","category":"General","order":1}}'
curl -X POST "$BASE_URL/api/faqs" -H "Content-Type: application/json" -d '{"data":{"channel":"WEB","page":"dashboard","question":"How much can I borrow against my gold?","answer":"You can typically borrow 70-85% of the current market value of your gold jewelry.","category":"Loan Amount","order":2}}'
curl -X POST "$BASE_URL/api/faqs" -H "Content-Type: application/json" -d '{"data":{"channel":"APP","page":"buy","question":"What is the current gold price?","answer":"Gold prices update daily based on market conditions.","category":"Pricing","order":1}}'
curl -X POST "$BASE_URL/api/faqs" -H "Content-Type: application/json" -d '{"data":{"channel":"APP","page":"sip","question":"Can I start a SIP with small amounts?","answer":"Yes, you can start a gold SIP with amounts as low as Rs. 500.","category":"SIP","order":1}}'
echo "FAQs seeding completed"
