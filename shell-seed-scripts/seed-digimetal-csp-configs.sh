#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding DigiMetal CSP Configs..."

# CSP Config 1: gold-common-csp
curl -X POST "$BASE_URL/api/digimetal-csp-configs" \
  -H "Content-Type: application/json" \
  -d '{
    "identifier": "gold-common-csp",
    "subProduct": "gold",
    "partner": "Vodafone",
    "reportUri": "https://csp-report.example.com/vodafone-gold",
    "reportOnly": false,
    "isActive": true,
    "description": "CSP configuration for Vodafone Gold product",
    "directives": [
      {"directive": "default-src", "sources": ["'\''self'\''"]},
      {"directive": "script-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.example.com"]},
      {"directive": "style-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.example.com"]},
      {"directive": "img-src", "sources": ["'\''self'\''", "data:", "https://*.example.com", "https://*.amazonaws.com"]},
      {"directive": "font-src", "sources": ["'\''self'\''", "https://cdn.example.com"]},
      {"directive": "connect-src", "sources": ["'\''self'\''", "https://api.example.com", "wss://*.example.com"]},
      {"directive": "frame-src", "sources": ["'\''self'\''", "https://www.youtube.com", "https://player.vimeo.com"]},
      {"directive": "object-src", "sources": ["'\''none'\''"]},
      {"directive": "base-uri", "sources": ["'\''self'\''"]},
      {"directive": "form-action", "sources": ["'\''self'\''"]}
    ]
  }'

# CSP Config 2: silver-common-csp
curl -X POST "$BASE_URL/api/digimetal-csp-configs" \
  -H "Content-Type: application/json" \
  -d '{
    "identifier": "silver-common-csp",
    "subProduct": "silver",
    "partner": "Vodafone",
    "reportUri": "https://csp-report.example.com/vodafone-silver",
    "reportOnly": false,
    "isActive": true,
    "description": "CSP configuration for Vodafone Silver product",
    "directives": [
      {"directive": "default-src", "sources": ["'\''self'\''"]},
      {"directive": "script-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.example.com"]},
      {"directive": "style-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.example.com"]},
      {"directive": "img-src", "sources": ["'\''self'\''", "data:", "https://*.example.com", "https://*.amazonaws.com"]},
      {"directive": "font-src", "sources": ["'\''self'\''", "https://cdn.example.com"]},
      {"directive": "connect-src", "sources": ["'\''self'\''", "https://api.example.com", "wss://*.example.com"]},
      {"directive": "frame-src", "sources": ["'\''self'\''", "https://www.youtube.com", "https://player.vimeo.com"]},
      {"directive": "object-src", "sources": ["'\''none'\''"]},
      {"directive": "base-uri", "sources": ["'\''self'\''"]},
      {"directive": "form-action", "sources": ["'\''self'\''"]}
    ]
  }'

# CSP Config 3: common-csp
curl -X POST "$BASE_URL/api/digimetal-csp-configs" \
  -H "Content-Type: application/json" \
  -d '{
    "identifier": "common-csp",
    "subProduct": "common",
    "partner": "Vodafone",
    "reportUri": "https://csp-report.example.com/common",
    "reportOnly": true,
    "isActive": true,
    "description": "Common CSP configuration for all DigiMetal products",
    "directives": [
      {"directive": "default-src", "sources": ["'\''self'\''"]},
      {"directive": "script-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "'\''unsafe-eval'\''", "https://cdn.example.com"]},
      {"directive": "style-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.example.com"]},
      {"directive": "img-src", "sources": ["'\''self'\''", "data:", "https:"]},
      {"directive": "font-src", "sources": ["'\''self'\''", "data:", "https://cdn.example.com"]},
      {"directive": "connect-src", "sources": ["'\''self'\''", "https:"]},
      {"directive": "frame-src", "sources": ["'\''self'\''", "https://www.youtube.com"]},
      {"directive": "object-src", "sources": ["'\''none'\''"]},
      {"directive": "base-uri", "sources": ["'\''self'\''"]},
      {"directive": "form-action", "sources": ["'\''self'\''"]},
      {"directive": "media-src", "sources": ["'\''self'\''", "https:"]},
      {"directive": "worker-src", "sources": ["'\''self'\''"]},
      {"directive": "manifest-src", "sources": ["'\''self'\''"]}
    ]
  }'

# CSP Config 4: gold-airtel-csp
curl -X POST "$BASE_URL/api/digimetal-csp-configs" \
  -H "Content-Type: application/json" \
  -d '{
    "identifier": "gold-airtel-csp",
    "subProduct": "gold",
    "partner": "Airtel",
    "reportUri": "https://csp-report.example.com/airtel-gold",
    "reportOnly": false,
    "isActive": true,
    "description": "CSP configuration for Airtel Gold product",
    "directives": [
      {"directive": "default-src", "sources": ["'\''self'\''"]},
      {"directive": "script-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.airtel.in"]},
      {"directive": "style-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.airtel.in"]},
      {"directive": "img-src", "sources": ["'\''self'\''", "data:", "https://*.airtel.in"]},
      {"directive": "font-src", "sources": ["'\''self'\''", "https://cdn.airtel.in"]},
      {"directive": "connect-src", "sources": ["'\''self'\''", "https://api.airtel.in"]},
      {"directive": "frame-src", "sources": ["'\''none'\''"]},
      {"directive": "object-src", "sources": ["'\''none'\''"]},
      {"directive": "base-uri", "sources": ["'\''self'\''"]},
      {"directive": "form-action", "sources": ["'\''self'\''"]}
    ]
  }'

# CSP Config 5: silver-airtel-csp
curl -X POST "$BASE_URL/api/digimetal-csp-configs" \
  -H "Content-Type: application/json" \
  -d '{
    "identifier": "silver-airtel-csp",
    "subProduct": "silver",
    "partner": "Airtel",
    "reportUri": "https://csp-report.example.com/airtel-silver",
    "reportOnly": false,
    "isActive": true,
    "description": "CSP configuration for Airtel Silver product",
    "directives": [
      {"directive": "default-src", "sources": ["'\''self'\''"]},
      {"directive": "script-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.airtel.in"]},
      {"directive": "style-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.airtel.in"]},
      {"directive": "img-src", "sources": ["'\''self'\''", "data:", "https://*.airtel.in"]},
      {"directive": "font-src", "sources": ["'\''self'\''", "https://cdn.airtel.in"]},
      {"directive": "connect-src", "sources": ["'\''self'\''", "https://api.airtel.in"]},
      {"directive": "frame-src", "sources": ["'\''none'\''"]},
      {"directive": "object-src", "sources": ["'\''none'\''"]},
      {"directive": "base-uri", "sources": ["'\''self'\''"]},
      {"directive": "form-action", "sources": ["'\''self'\''"]}
    ]
  }'

# CSP Config 6: gold-jio-csp
curl -X POST "$BASE_URL/api/digimetal-csp-configs" \
  -H "Content-Type: application/json" \
  -d '{
    "identifier": "gold-jio-csp",
    "subProduct": "gold",
    "partner": "Jio",
    "reportUri": "https://csp-report.example.com/jio-gold",
    "reportOnly": false,
    "isActive": true,
    "description": "CSP configuration for Jio Gold product",
    "directives": [
      {"directive": "default-src", "sources": ["'\''self'\''"]},
      {"directive": "script-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.jio.com"]},
      {"directive": "style-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.jio.com"]},
      {"directive": "img-src", "sources": ["'\''self'\''", "data:", "https://*.jio.com", "https://*.jiohealth.com"]},
      {"directive": "font-src", "sources": ["'\''self'\''", "https://cdn.jio.com"]},
      {"directive": "connect-src", "sources": ["'\''self'\''", "https://api.jio.com"]},
      {"directive": "frame-src", "sources": ["'\''none'\''"]},
      {"directive": "object-src", "sources": ["'\''none'\''"]},
      {"directive": "base-uri", "sources": ["'\''self'\''"]},
      {"directive": "form-action", "sources": ["'\''self'\''"]}
    ]
  }'

# CSP Config 7: silver-jio-csp
curl -X POST "$BASE_URL/api/digimetal-csp-configs" \
  -H "Content-Type: application/json" \
  -d '{
    "identifier": "silver-jio-csp",
    "subProduct": "silver",
    "partner": "Jio",
    "reportUri": "https://csp-report.example.com/jio-silver",
    "reportOnly": false,
    "isActive": true,
    "description": "CSP configuration for Jio Silver product",
    "directives": [
      {"directive": "default-src", "sources": ["'\''self'\''"]},
      {"directive": "script-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.jio.com"]},
      {"directive": "style-src", "sources": ["'\''self'\''", "'\''unsafe-inline'\''", "https://cdn.jio.com"]},
      {"directive": "img-src", "sources": ["'\''self'\''", "data:", "https://*.jio.com", "https://*.jiohealth.com"]},
      {"directive": "font-src", "sources": ["'\''self'\''", "https://cdn.jio.com"]},
      {"directive": "connect-src", "sources": ["'\''self'\''", "https://api.jio.com"]},
      {"directive": "frame-src", "sources": ["'\''none'\''"]},
      {"directive": "object-src", "sources": ["'\''none'\''"]},
      {"directive": "base-uri", "sources": ["'\''self'\''"]},
      {"directive": "form-action", "sources": ["'\''self'\''"]}
    ]
  }'

echo "DigiMetal CSP Configs seeding completed"
