#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Dashboard Contents..."
curl -X POST "$BASE_URL/api/dashboard-contents" -H "Content-Type: application/json" -d '{"data":{"channel":"WEB","partner":{"partner_Id":"PARTNER_001","name":"ABC Gold Lenders","gold_partner":"true","gold_partner_logo":"https://via.placeholder.com/200x100?text=ABC"},"key_highlights":{"title":"Key Features","items":["Fast Approval","Secure Storage","Flexible Repayment"]}}}'
curl -X POST "$BASE_URL/api/dashboard-contents" -H "Content-Type: application/json" -d '{"data":{"channel":"APP","partner":{"partner_Id":"PARTNER_002","name":"XYZ Gold Finance","gold_partner":"true","gold_partner_logo":"https://via.placeholder.com/200x100?text=XYZ"},"key_highlights":{"title":"App Benefits","items":["24/7 Access","Mobile Verification","Instant Decisions"]}}}'
echo "Dashboard Contents seeding completed"
