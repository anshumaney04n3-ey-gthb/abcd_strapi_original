#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Sales Enablers..."
curl -X POST "$BASE_URL/api/sales-enablers" -H "Content-Type: application/json" -d '{"data":{"title":"Gold Loan Benefits Flyer","description":"Downloadable flyer highlighting benefits of gold loans","type":"document","file_url":"https://via.placeholder.com/400x300?text=Flyer","format":"PDF","file_size":"2.5MB"}}'
curl -X POST "$BASE_URL/api/sales-enablers" -H "Content-Type: application/json" -d '{"data":{"title":"Product Comparison Sheet","description":"Compare gold loan products across different partners","type":"document","file_url":"https://via.placeholder.com/400x300?text=Comparison","format":"PDF","file_size":"1.8MB"}}'
curl -X POST "$BASE_URL/api/sales-enablers" -H "Content-Type: application/json" -d '{"data":{"title":"Digital Marketing Assets","description":"Social media templates and promotional images","type":"media_pack","file_url":"https://via.placeholder.com/400x300?text=Assets","format":"ZIP","file_size":"15.3MB"}}'
curl -X POST "$BASE_URL/api/sales-enablers" -H "Content-Type: application/json" -d '{"data":{"title":"Sales Presentation Template","description":"Customizable PowerPoint presentation for sales teams","type":"presentation","file_url":"https://via.placeholder.com/400x300?text=Presentation","format":"PPTX","file_size":"8.7MB"}}'
echo "Sales Enablers seeding completed"
