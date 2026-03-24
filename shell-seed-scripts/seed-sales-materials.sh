#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Sales Materials..."
curl -X POST "$BASE_URL/api/sales-materials" -H "Content-Type: application/json" -d '{"data":{"title":"Product Brochure - Gold Loans","description":"Comprehensive brochure covering all gold loan features","category":"Brochure","content_type":"PDF","download_url":"https://via.placeholder.com/400x300?text=Brochure1","version":"2.0","published":true}}'
curl -X POST "$BASE_URL/api/sales-materials" -H "Content-Type: application/json" -d '{"data":{"title":"Quick Reference Guide","description":"Quick reference for loan terms and conditions","category":"Guide","content_type":"PDF","download_url":"https://via.placeholder.com/400x300?text=Reference","version":"1.5","published":true}}'
curl -X POST "$BASE_URL/api/sales-materials" -H "Content-Type: application/json" -d '{"data":{"title":"FAQs Document","description":"Comprehensive FAQ document for customer support","category":"FAQ","content_type":"PDF","download_url":"https://via.placeholder.com/400x300?text=FAQs","version":"3.0","published":true}}'
curl -X POST "$BASE_URL/api/sales-materials" -H "Content-Type: application/json" -d '{"data":{"title":"Case Studies Collection","description":"Success stories from existing customers","category":"Case Study","content_type":"PDF","download_url":"https://via.placeholder.com/400x300?text=CaseStudy","version":"1.0","published":true}}'
echo "Sales Materials seeding completed"
