#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding DSK Subcategories..."
curl -X POST "$BASE_URL/api/dsk-subcategories" -H "Content-Type: application/json" -d '{"data":{"name":"Personal Gold Loans","description":"Quick loans for personal needs","dsk_category":1,"order":1,"active":true}}'
curl -X POST "$BASE_URL/api/dsk-subcategories" -H "Content-Type: application/json" -d '{"data":{"name":"Business Gold Loans","description":"Financing for business purposes","dsk_category":1,"order":2,"active":true}}'
curl -X POST "$BASE_URL/api/dsk-subcategories" -H "Content-Type: application/json" -d '{"data":{"name":"Physical Digital Gold","description":"Buy physical gold digitally","dsk_category":2,"order":1,"active":true}}'
curl -X POST "$BASE_URL/api/dsk-subcategories" -H "Content-Type: application/json" -d '{"data":{"name":"Gold SIPs","description":"Systematic Investment Plans in gold","dsk_category":3,"order":1,"active":true}}'
echo "DSK Subcategories seeding completed"
