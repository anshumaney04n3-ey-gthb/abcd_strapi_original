#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Help Topics..."
curl -X POST "$BASE_URL/api/help-topics" -H "Content-Type: application/json" -d '{"data":{"title":"How to Apply for a Gold Loan","description":"Step-by-step guide to apply for gold loan online","content":"Complete documentation about the application process including eligibility, required documents, and approval timeline.","order":1}}'
curl -X POST "$BASE_URL/api/help-topics" -H "Content-Type: application/json" -d '{"data":{"title":"Understanding Interest Rates","description":"Learn about interest rates and loan charges","content":"Detailed explanation of how interest rates are calculated and what factors affect your loan charges.","order":2}}'
curl -X POST "$BASE_URL/api/help-topics" -H "Content-Type: application/json" -d '{"data":{"title":"Gold Storage & Safety","description":"How your gold is stored and kept safe","content":"Information about our secure vaults, insurance coverage, and gold safety measures.","order":3}}'
curl -X POST "$BASE_URL/api/help-topics" -H "Content-Type: application/json" -d '{"data":{"title":"Repayment Options","description":"Various ways to repay your gold loan","content":"Detailed guide on EMI, lump sum payment, and flexible repayment schedule options.","order":4}}'
echo "Help Topics seeding completed"
