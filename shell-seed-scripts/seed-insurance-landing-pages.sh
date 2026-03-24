#!/bin/bash

source "$(dirname "$0")/config.sh"
echo "Seeding Insurance Landing Pages..."

# SubProduct: motor, Partner: Vodafone
curl -X POST "$BASE_URL/api/insurance-landing-pages" \
  -H "Content-Type: application/json" \
  -d '{
    "subProduct": "motor",
    "partner": "Vodafone",
    "footerReferenceHeading": "Offered by",
    "footerReferenceName": "MMTC-PAMP",
    "footerReferenceCertification": "ISO 27001:2013 certified.",
    "widgetPriceSuffix": "/gm",
    "widgetPriceValidForSeconds": 300,
    "widgetMinAmount": 10,
    "widgetMaxAmount": 500000,
    "widgetMinWeight": 0,
    "widgetMaxWeight": 50,
    "sipCalculatorEnabled": true,
    "heroSlides": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Motor Insurance", "subtitle": "Comprehensive coverage for your vehicle"}
      ]
    },
    "benefits": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Cashless Claims", "description": "Get instant cashless repairs at network garages"},
        {"order": 2, "title": "24/7 Support", "description": "Round-the-clock assistance for emergencies"},
        {"order": 3, "title": "Easy Renewal", "description": "Quick and hassle-free policy renewal"}
      ]
    },
    "smartFeatureSip": {
      "enabled": true,
      "content": {
        "number": "01",
        "title": "Premium Protection",
        "featureChips": [
          {"order": 1, "text": "Comprehensive Coverage"},
          {"order": 2, "text": "Zero Depreciation"},
          {"order": 3, "text": "NCB Protection"}
        ]
      }
    },
    "smartFeatureCoins": {
      "enabled": true,
      "content": {
        "number": "02",
        "title": "Quick Claims",
        "featureChips": [
          {"order": 1, "text": "Instant Settlement"},
          {"order": 2, "text": "Paperless Process"},
          {"order": 3, "text": "Direct Transfer"}
        ]
      }
    },
    "faqItems": {
      "enabled": true,
      "content": [
        {"order": 1, "question": "What is covered in motor insurance?", "answer": "Motor insurance covers damage to your vehicle due to accidents, theft, and natural calamities.", "isDefaultOpen": true},
        {"order": 2, "question": "How to claim?", "answer": "You can file a claim through our app or website with just a few clicks.", "isDefaultOpen": false}
      ]
    }
  }'

echo ""

# SubProduct: pocket, Partner: Vodafone
curl -X POST "$BASE_URL/api/insurance-landing-pages" \
  -H "Content-Type: application/json" \
  -d '{
    "subProduct": "pocket",
    "partner": "Vodafone",
    "footerReferenceHeading": "Offered by",
    "footerReferenceName": "MMTC-PAMP",
    "footerReferenceCertification": "ISO 27001:2013 certified.",
    "widgetPriceSuffix": "/gm",
    "widgetPriceValidForSeconds": 300,
    "widgetMinAmount": 10,
    "widgetMaxAmount": 500000,
    "widgetMinWeight": 0,
    "widgetMaxWeight": 50,
    "sipCalculatorEnabled": true,
    "heroSlides": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Pocket Insurance", "subtitle": "Affordable coverage for everyone"}
      ]
    },
    "benefits": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Low Premium", "description": "Starting at just ₹99/month"},
        {"order": 2, "title": "Instant Coverage", "description": "Get covered immediately"},
        {"order": 3, "title": "Easy Claims", "description": "Hassle-free claim process"}
      ]
    },
    "smartFeatureSip": {
      "enabled": true,
      "content": {
        "number": "01",
        "title": "Micro Insurance",
        "featureChips": [
          {"order": 1, "text": "₹99/month"},
          {"order": 2, "text": "Instant Cover"},
          {"order": 3, "text": "Digital Policy"}
        ]
      }
    },
    "smartFeatureCoins": {
      "enabled": true,
      "content": {
        "number": "02",
        "title": "Daily Benefits",
        "featureChips": [
          {"order": 1, "text": "Hospital Cash"},
          {"order": 2, "text": "Device Protection"},
          {"order": 3, "text": "Travel Cover"}
        ]
      }
    },
    "faqItems": {
      "enabled": true,
      "content": [
        {"order": 1, "question": "What is pocket insurance?", "answer": "Pocket insurance is affordable micro-insurance covering specific risks.", "isDefaultOpen": true},
        {"order": 2, "question": "How to buy?", "answer": "Purchase directly from the app in just a few seconds.", "isDefaultOpen": false}
      ]
    }
  }'

echo ""

# SubProduct: travel, Partner: Vodafone
curl -X POST "$BASE_URL/api/insurance-landing-pages" \
  -H "Content-Type: application/json" \
  -d '{
    "subProduct": "travel",
    "partner": "Vodafone",
    "footerReferenceHeading": "Offered by",
    "footerReferenceName": "MMTC-PAMP",
    "footerReferenceCertification": "ISO 27001:2013 certified.",
    "widgetPriceSuffix": "/gm",
    "widgetPriceValidForSeconds": 300,
    "widgetMinAmount": 10,
    "widgetMaxAmount": 500000,
    "widgetMinWeight": 0,
    "widgetMaxWeight": 50,
    "sipCalculatorEnabled": true,
    "heroSlides": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Travel Insurance", "subtitle": "Safe travels with comprehensive coverage"}
      ]
    },
    "benefits": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Trip Cancellation", "description": "Get refund on cancelled trips"},
        {"order": 2, "title": "Medical Coverage", "description": "Healthcare expenses covered abroad"},
        {"order": 3, "title": "Baggage Loss", "description": "Compensation for lost luggage"}
      ]
    },
    "smartFeatureSip": {
      "enabled": true,
      "content": {
        "number": "01",
        "title": "Global Protection",
        "featureChips": [
          {"order": 1, "text": "Worldwide Coverage"},
          {"order": 2, "text": "24/7 Assistance"},
          {"order": 3, "text": "Cashless Treatment"}
        ]
      }
    },
    "smartFeatureCoins": {
      "enabled": true,
      "content": {
        "number": "02",
        "title": "Trip Benefits",
        "featureChips": [
          {"order": 1, "text": "Flight Delay"},
          {"order": 2, "text": "Personal Liability"},
          {"order": 3, "text": "Passport Loss"}
        ]
      }
    },
    "faqItems": {
      "enabled": true,
      "content": [
        {"order": 1, "question": "What does travel insurance cover?", "answer": "It covers medical emergencies, trip cancellations, baggage loss, and more.", "isDefaultOpen": true},
        {"order": 2, "question": "How to claim?", "answer": "Contact our 24/7 helpline or use the app to file a claim.", "isDefaultOpen": false}
      ]
    }
  }'

echo ""

# SubProduct: health, Partner: Vodafone
curl -X POST "$BASE_URL/api/insurance-landing-pages" \
  -H "Content-Type: application/json" \
  -d '{
    "subProduct": "health",
    "partner": "Vodafone",
    "footerReferenceHeading": "Offered by",
    "footerReferenceName": "MMTC-PAMP",
    "footerReferenceCertification": "ISO 27001:2013 certified.",
    "widgetPriceSuffix": "/gm",
    "widgetPriceValidForSeconds": 300,
    "widgetMinAmount": 10,
    "widgetMaxAmount": 500000,
    "widgetMinWeight": 0,
    "widgetMaxWeight": 50,
    "sipCalculatorEnabled": true,
    "heroSlides": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Health Insurance", "subtitle": "Complete protection for you and your family"}
      ]
    },
    "benefits": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Cashless Hospitalization", "description": "Get treated at network hospitals without paying"},
        {"order": 2, "title": "Pre & Post Hospitalization", "description": "Coverage for medical expenses before and after hospital stay"},
        {"order": 3, "title": "No Claim Bonus", "description": "Increase your sum insured for claim-free years"}
      ]
    },
    "smartFeatureSip": {
      "enabled": true,
      "content": {
        "number": "01",
        "title": "Family Coverage",
        "featureChips": [
          {"order": 1, "text": "Individual & Family"},
          {"order": 2, "text": "Critical Illness"},
          {"order": 3, "text": "Day Care Procedures"}
        ]
      }
    },
    "smartFeatureCoins": {
      "enabled": true,
      "content": {
        "number": "02",
        "title": "Wellness Benefits",
        "featureChips": [
          {"order": 1, "text": "Health Checkup"},
          {"order": 2, "text": "Teleconsultation"},
          {"order": 3, "text": "Discounts"}
        ]
      }
    },
    "faqItems": {
      "enabled": true,
      "content": [
        {"order": 1, "question": "What is covered under health insurance?", "answer": "It covers hospitalization, pre/post medical expenses, day care treatments, and more.", "isDefaultOpen": true},
        {"order": 2, "question": "How to renew?", "answer": "Renew easily through the app with instant policy issuance.", "isDefaultOpen": false}
      ]
    }
  }'

echo ""

# SubProduct: motor, Partner: default
curl -X POST "$BASE_URL/api/insurance-landing-pages" \
  -H "Content-Type: application/json" \
  -d '{
    "subProduct": "motor",
    "partner": "default",
    "footerReferenceHeading": "Offered by",
    "footerReferenceName": "MMTC-PAMP",
    "footerReferenceCertification": "ISO 27001:2013 certified.",
    "widgetPriceSuffix": "/gm",
    "widgetPriceValidForSeconds": 300,
    "widgetMinAmount": 10,
    "widgetMaxAmount": 500000,
    "widgetMinWeight": 0,
    "widgetMaxWeight": 50,
    "sipCalculatorEnabled": true,
    "heroSlides": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Motor Insurance", "subtitle": "Comprehensive coverage for your vehicle"}
      ]
    },
    "benefits": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Cashless Claims", "description": "Get instant cashless repairs at network garages"},
        {"order": 2, "title": "24/7 Support", "description": "Round-the-clock assistance for emergencies"},
        {"order": 3, "title": "Easy Renewal", "description": "Quick and hassle-free policy renewal"}
      ]
    },
    "smartFeatureSip": {
      "enabled": true,
      "content": {
        "number": "01",
        "title": "Premium Protection",
        "featureChips": [
          {"order": 1, "text": "Comprehensive Coverage"},
          {"order": 2, "text": "Zero Depreciation"},
          {"order": 3, "text": "NCB Protection"}
        ]
      }
    },
    "smartFeatureCoins": {
      "enabled": true,
      "content": {
        "number": "02",
        "title": "Quick Claims",
        "featureChips": [
          {"order": 1, "text": "Instant Settlement"},
          {"order": 2, "text": "Paperless Process"},
          {"order": 3, "text": "Direct Transfer"}
        ]
      }
    },
    "faqItems": {
      "enabled": true,
      "content": [
        {"order": 1, "question": "What is covered in motor insurance?", "answer": "Motor insurance covers damage to your vehicle due to accidents, theft, and natural calamities.", "isDefaultOpen": true},
        {"order": 2, "question": "How to claim?", "answer": "You can file a claim through our app or website with just a few clicks.", "isDefaultOpen": false}
      ]
    }
  }'

echo ""
echo "Insurance Landing Pages seeding completed"