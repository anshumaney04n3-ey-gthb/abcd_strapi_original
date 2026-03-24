#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Gold Loan Toggle Configs..."
curl -X POST "$BASE_URL/api/gl-toggle-configs" -H "Content-Type: application/json" -d '{"data":{"feature_name":"Gold Loan Product","feature_key":"GL_ENABLED","description":"Enable/disable the gold loan product","is_enabled":true,"environment":"PRODUCTION"}}'
curl -X POST "$BASE_URL/api/gl-toggle-configs" -H "Content-Type: application/json" -d '{"data":{"feature_name":"Quick Approval Feature","feature_key":"QUICK_APPROVAL","description":"Enable quick approval with AI scoring","is_enabled":true,"environment":"PRODUCTION"}}'
curl -X POST "$BASE_URL/api/gl-toggle-configs" -H "Content-Type: application/json" -d '{"data":{"feature_name":"Video KYC","feature_key":"VIDEO_KYC","description":"Enable video-based KYC verification","is_enabled":false,"environment":"PRODUCTION"}}'
curl -X POST "$BASE_URL/api/gl-toggle-configs" -H "Content-Type: application/json" -d '{"data":{"feature_name":"Same Day Disbursal","feature_key":"SAME_DAY_DISBURSAL","description":"Enable same-day loan disbursal","is_enabled":true,"environment":"PRODUCTION"}}'
curl -X POST "$BASE_URL/api/gl-toggle-configs" -H "Content-Type: application/json" -d '{"data":{"feature_name":"Mobile App Integration","feature_key":"MOBILE_APP","description":"Enable mobile app features","is_enabled":true,"environment":"PRODUCTION"}}'
curl -X POST "$BASE_URL/api/gl-toggle-configs" -H "Content-Type: application/json" -d '{"data":{"feature_name":"Renewal Feature","feature_key":"RENEWAL_ENABLED","description":"Allow customers to renew loans","is_enabled":false,"environment":"PRODUCTION"}}'
echo "Gold Loan Toggle Configs seeding completed"
