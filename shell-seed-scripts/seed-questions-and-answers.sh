#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Questions and Answers..."
curl -X POST "$BASE_URL/api/questions-and-answers" -H "Content-Type: application/json" -d '{"data":{"question":"Is my gold insured?","answer":"Yes, all gold deposited with us is fully insured against theft, loss, and damage. Insurance is included in the loan charges.","category":"Safety","helpful_count":125,"order":1}}'
curl -X POST "$BASE_URL/api/questions-and-answers" -H "Content-Type: application/json" -d '{"data":{"question":"Can I get my gold back early?","answer":"Yes, you can repay your loan anytime without prepayment charges. Once repaid, your gold will be returned to you immediately.","category":"Repayment","helpful_count":98,"order":2}}'
curl -X POST "$BASE_URL/api/questions-and-answers" -H "Content-Type: application/json" -d '{"data":{"question":"What happens if I cannot repay?","answer":"If you are unable to repay, we offer flexible repayment options and payment plans. Please contact our support team to discuss alternatives.","category":"Repayment","helpful_count":87,"order":3}}'
curl -X POST "$BASE_URL/api/questions-and-answers" -H "Content-Type: application/json" -d '{"data":{"question":"How is the gold value assessed?","answer":"We assess gold based on current market rates, purity (measured in karats), and weight. Our certified valuers provide transparent assessments.","category":"Valuation","helpful_count":156,"order":4}}'
echo "Questions and Answers seeding completed"
