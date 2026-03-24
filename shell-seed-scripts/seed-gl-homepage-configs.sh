#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Gold Loan Homepage Configs..."
curl -X POST "$BASE_URL/api/gl-homepage-configs" -H "Content-Type: application/json" -d '{"data":{"section_name":"Hero Banner","section_key":"HERO_BANNER","section_data":{"title":"Get Gold Loans in 2 Hours","subtitle":"Fastest & Most Secure Gold Loans","image":"https://via.placeholder.com/1200x400?text=Hero","cta_text":"Get Started"},"display_order":1,"is_visible":true}}'
curl -X POST "$BASE_URL/api/gl-homepage-configs" -H "Content-Type: application/json" -d '{"data":{"section_name":"Features Section","section_key":"FEATURES","section_data":{"title":"Why Choose Our Gold Loans?","features":[{"title":"Fast Approval","icon":"rocket"},{"title":"Secure Storage","icon":"lock"},{"title":"Flexible Terms","icon":"chart"}]},"display_order":2,"is_visible":true}}'
curl -X POST "$BASE_URL/api/gl-homepage-configs" -H "Content-Type: application/json" -d '{"data":{"section_name":"Testimonials","section_key":"TESTIMONIALS","section_data":{"title":"What Our Customers Say","show_count":3},"display_order":3,"is_visible":true}}'
curl -X POST "$BASE_URL/api/gl-homepage-configs" -H "Content-Type: application/json" -d '{"data":{"section_name":"FAQ Section","section_key":"FAQ_SECTION","section_data":{"title":"Frequently Asked Questions","show_count":5},"display_order":4,"is_visible":true}}'
curl -X POST "$BASE_URL/api/gl-homepage-configs" -H "Content-Type: application/json" -d '{"data":{"section_name":"CTA Section","section_key":"CTA_SECTION","section_data":{"title":"Ready to Get Started?","description":"Apply for a gold loan today and get approved in 2 hours","button_text":"Apply Now"},"display_order":5,"is_visible":true}}'
echo "Gold Loan Homepage Configs seeding completed"
