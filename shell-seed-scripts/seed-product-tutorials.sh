#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Product Tutorials..."
curl -X POST "$BASE_URL/api/product-tutorials" -H "Content-Type: application/json" -d '{"data":{"title":"Getting Started with Gold Loans","description":"Complete beginner guide to gold loans","video_url":"https://www.youtube.com/embed/dQw4w9WgXcQ","duration_minutes":5,"difficulty_level":"Beginner","order":1}}'
curl -X POST "$BASE_URL/api/product-tutorials" -H "Content-Type: application/json" -d '{"data":{"title":"Digital Gold Investment Guide","description":"How to invest in digital gold safely","video_url":"https://www.youtube.com/embed/jNQXAC9IVRw","duration_minutes":8,"difficulty_level":"Intermediate","order":2}}'
curl -X POST "$BASE_URL/api/product-tutorials" -H "Content-Type: application/json" -d '{"data":{"title":"Gold SIP Strategy","description":"Maximize returns with systematic gold investing","video_url":"https://www.youtube.com/embed/9bZkp7q19f0","duration_minutes":12,"difficulty_level":"Advanced","order":3}}'
echo "Product Tutorials seeding completed"
