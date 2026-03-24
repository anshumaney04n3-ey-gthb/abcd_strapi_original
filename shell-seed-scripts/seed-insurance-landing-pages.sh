#!/bin/bash

source "$(dirname "$0")/config.sh"
echo "Seeding Insurance Landing Pages..."

# Function to create and populate insurance landing page
seed_page() {
    local subProduct="$1"
    local partner="$2"
    local docId="$3"
    
    echo "Seeding: $subProduct - $partner"
    
    # PUT nested components
    if [[ "$subProduct" == "motor" && "$partner" == "Vodafone" ]]; then
        curl -s -X PUT "$BASE_URL/api/insurance-landing-pages/$docId" \
            -H "Content-Type: application/json" \
            -d '{
                "data": {
                    "footerSideImageAlt": "Gold Investment Footer Image",
                    "phoneMockupAlt": "Digital Gold App Preview",
                    "benefits": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "title": "Cashless Claims", "description": "Get instant cashless repairs at network garages"},
                            {"order": 2, "title": "24/7 Support", "description": "Round-the-clock assistance for emergencies"},
                            {"order": 3, "title": "Easy Renewal", "description": "Quick and hassle-free policy renewal"}
                        ]
                    },
                    "newsItems": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "New: Instant claim settlement"},
                            {"order": 2, "text": "Zero depreciation cover now available"}
                        ]
                    },
                    "productHighlighters": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "Cashless Repairs at 5000+ Garages", "showIcon": true, "showHeaderIcon": true},
                            {"order": 2, "text": "Lifetime Zero Depreciation", "showIcon": true, "showHeaderIcon": true},
                            {"order": 3, "text": "24/7 Roadside Assistance", "showIcon": true, "showHeaderIcon": true}
                        ]
                    },
                    "smartFeatureSip": {
                        "enabled": true,
                        "content": {
                            "number": "01",
                            "title": "Premium Protection"
                        }
                    },
                    "smartFeatureCoins": {
                        "enabled": true,
                        "content": {
                            "number": "02",
                            "title": "Quick Claims",
                            "subtitle": "Fast and easy claim settlement",
                            "description": "Get your claims settled within 24 hours with our streamlined process",
                            "ctaText": "Learn More"
                        }
                    },
                    "comparisonColumns": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "columnId": "comprehensive", "title": "Comprehensive", "isHighlighted": true},
                            {"order": 2, "columnId": "third-party", "title": "Third Party", "isHighlighted": false},
                            {"order": 3, "columnId": "own-damage", "title": "Own Damage", "isHighlighted": false}
                        ]
                    },
                    "comparisonRows": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "rowId": "coverage", "label": "Coverage", "values": {"comprehensive": "Accidents, Theft, Natural Calamities", "third-party": "Third Party Liabilities", "own-damage": "Own Vehicle Damage"}},
                            {"order": 2, "rowId": "premium", "label": "Starting Premium", "values": {"comprehensive": "₹2,500/year", "third-party": "₹1,200/year", "own-damage": "₹1,800/year"}},
                            {"order": 3, "rowId": "claim", "label": "Claim Process", "values": {"comprehensive": "Cashless & Reimbursement", "third-party": "Cashless only", "own-damage": "Reimbursement only"}}
                        ]
                    },
                    "testimonial": {
                        "enabled": true,
                        "content": {
                            "title": "What Our Customers Say",
                            "text": "Excellent service! My claim was settled within 2 days. Highly recommend for comprehensive motor insurance."
                        }
                    },
                    "footerFeatures": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "100% CLAIM SETTLEMENT"},
                            {"order": 2, "text": "24/7 ROAD ASSISTANCE"},
                            {"order": 3, "text": "CASHLESS NETWORK"},
                            {"order": 4, "text": "INSTANT POLICY"}
                        ]
                    },
                    "faqItems": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "question": "What is covered in motor insurance?", "answer": "Motor insurance covers damage to your vehicle due to accidents, theft, and natural calamities.", "isDefaultOpen": true},
                            {"order": 2, "question": "How to claim?", "answer": "You can file a claim through our app or website with just a few clicks.", "isDefaultOpen": false}
                        ]
                    },
                    "trustedPartners": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "alt": "Vodafone"}
                        ]
                    },
                    "addOns": {
                        "enabled": true,
                        "content": [
                            {"label": "Popular", "title": "Roadside Assistance", "description": "Get 24/7 help anywhere", "benefits": ["Towing", "Fuel Delivery", "Flat Tire Help"]},
                            {"label": "Recommended", "title": "Engine Protection", "description": "Coverage for engine damages", "benefits": ["Water Damage", "Oil Leakage", "Electrical"]}
                        ]
                    },
                    "promoBanner": {
                        "enabled": true,
                        "imageUrl": "/images/promo-banner.jpg",
                        "imageAlt": "Special Offer",
                        "ctaText": "Get Quote",
                        "ctaUrl": "/get-quote",
                        "gradientStartColor": "#FFD700",
                        "gradientEndColor": "#FFA500"
                    },
                    "seoMeta": {
                        "enabled": true,
                        "content": {
                            "metaTitle": "Motor Insurance - Comprehensive Vehicle Coverage | Vodafone",
                            "metaDescription": "Get comprehensive motor insurance coverage. Cashless claims, 24/7 support, easy renewal.",
                            "metaKeywords": "motor insurance, vehicle insurance, car insurance"
                        }
                    }
                }
            }' | jq -r '.data.id // "failed"'
    elif [[ "$subProduct" == "pocket" && "$partner" == "Vodafone" ]]; then
        curl -s -X PUT "$BASE_URL/api/insurance-landing-pages/$docId" \
            -H "Content-Type: application/json" \
            -d '{
                "data": {
                    "footerSideImageAlt": "Pocket Insurance Footer Image",
                    "phoneMockupAlt": "Pocket Insurance App Preview",
                    "benefits": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "title": "Low Premium", "description": "Starting at just ₹99/month"},
                            {"order": 2, "title": "Instant Coverage", "description": "Get covered immediately"},
                            {"order": 3, "title": "Easy Claims", "description": "Hassle-free claim process"}
                        ]
                    },
                    "newsItems": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "Starting at just ₹99/month"},
                            {"order": 2, "text": "Instant digital policy"}
                        ]
                    },
                    "productHighlighters": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "Instant Coverage", "showIcon": true, "showHeaderIcon": true},
                            {"order": 2, "text": "Digital Policy", "showIcon": true, "showHeaderIcon": true},
                            {"order": 3, "text": "Easy Claims", "showIcon": true, "showHeaderIcon": true}
                        ]
                    },
                    "smartFeatureSip": {
                        "enabled": true,
                        "content": {
                            "number": "01",
                            "title": "Micro Insurance"
                        }
                    },
                    "smartFeatureCoins": {
                        "enabled": true,
                        "content": {
                            "number": "02",
                            "title": "Daily Benefits",
                            "subtitle": "Affordable protection for daily needs",
                            "description": "Get daily hospital cash, device protection and more",
                            "ctaText": "View Plans"
                        }
                    },
                    "comparisonColumns": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "columnId": "basic", "title": "Basic", "isHighlighted": false},
                            {"order": 2, "columnId": "standard", "title": "Standard", "isHighlighted": true},
                            {"order": 3, "columnId": "premium", "title": "Premium", "isHighlighted": false}
                        ]
                    },
                    "comparisonRows": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "rowId": "coverage", "label": "Coverage", "values": {"basic": "Device Damage", "standard": "Device + Theft", "premium": "All Risks"}},
                            {"order": 2, "rowId": "claim", "label": "Claim Limit", "values": {"basic": "₹10,000", "standard": "₹25,000", "premium": "₹50,000"}}
                        ]
                    },
                    "testimonial": {
                        "enabled": true,
                        "content": {
                            "title": "What Our Customers Say",
                            "text": "Perfect for my needs. Affordable and reliable coverage for my smartphone."
                        }
                    },
                    "footerFeatures": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "INSTANT COVERAGE"},
                            {"order": 2, "text": "DIGITAL POLICY"},
                            {"order": 3, "text": "EASY CLAIMS"},
                            {"order": 4, "text": "24/7 SUPPORT"}
                        ]
                    },
                    "faqItems": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "question": "What is pocket insurance?", "answer": "Pocket insurance is affordable micro-insurance covering specific risks.", "isDefaultOpen": true},
                            {"order": 2, "question": "How to buy?", "answer": "Purchase directly from the app in just a few seconds.", "isDefaultOpen": false}
                        ]
                    },
                    "trustedPartners": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "alt": "Vodafone"}
                        ]
                    },
                    "addOns": {
                        "enabled": true,
                        "content": [
                            {"label": "Popular", "title": "Device Protection", "description": "Cover for your smartphone", "benefits": ["Screen damage", "Theft", "Water damage"]}
                        ]
                    },
                    "promoBanner": {
                        "enabled": true,
                        "imageUrl": "/images/pocket-promo.jpg",
                        "imageAlt": "Pocket Insurance Offer",
                        "ctaText": "Buy Now",
                        "ctaUrl": "/buy-pocket",
                        "gradientStartColor": "#9C27B0",
                        "gradientEndColor": "#E040FB"
                    },
                    "seoMeta": {
                        "enabled": true,
                        "content": {
                            "metaTitle": "Pocket Insurance - Affordable Coverage | Vodafone",
                            "metaDescription": "Affordable pocket insurance starting at ₹99/month. Instant coverage, easy claims.",
                            "metaKeywords": "pocket insurance, micro insurance, affordable insurance"
                        }
                    }
                }
            }' | jq -r '.data.id // "failed"'
    elif [[ "$subProduct" == "travel" && "$partner" == "Vodafone" ]]; then
        curl -s -X PUT "$BASE_URL/api/insurance-landing-pages/$docId" \
            -H "Content-Type: application/json" \
            -d '{
                "data": {
                    "footerSideImageAlt": "Travel Insurance Footer Image",
                    "phoneMockupAlt": "Travel Insurance App Preview",
                    "benefits": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "title": "Trip Cancellation", "description": "Get refund on cancelled trips"},
                            {"order": 2, "title": "Medical Coverage", "description": "Healthcare expenses covered abroad"},
                            {"order": 3, "title": "Baggage Loss", "description": "Compensation for lost luggage"}
                        ]
                    },
                    "newsItems": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "COVID-19 coverage included"},
                            {"order": 2, "text": "Multi-trip plans available"}
                        ]
                    },
                    "productHighlighters": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "Medical Coverage", "showIcon": true, "showHeaderIcon": true},
                            {"order": 2, "text": "Trip Cancellation", "showIcon": true, "showHeaderIcon": true},
                            {"order": 3, "text": "Baggage Loss", "showIcon": true, "showHeaderIcon": true}
                        ]
                    },
                    "smartFeatureSip": {
                        "enabled": true,
                        "content": {
                            "number": "01",
                            "title": "Global Protection"
                        }
                    },
                    "smartFeatureCoins": {
                        "enabled": true,
                        "content": {
                            "number": "02",
                            "title": "Trip Benefits",
                            "subtitle": "Travel with peace of mind",
                            "description": "Flight delay compensation, personal liability coverage and more",
                            "ctaText": "Know More"
                        }
                    },
                    "comparisonColumns": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "columnId": "basic", "title": "Basic", "isHighlighted": false},
                            {"order": 2, "columnId": "standard", "title": "Standard", "isHighlighted": true},
                            {"order": 3, "columnId": "premium", "title": "Premium", "isHighlighted": false}
                        ]
                    },
                    "comparisonRows": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "rowId": "medical", "label": "Medical Coverage", "values": {"basic": "$50,000", "standard": "$150,000", "premium": "$500,000"}},
                            {"order": 2, "rowId": "trip", "label": "Trip Cancellation", "values": {"basic": "₹10,000", "standard": "₹25,000", "premium": "Unlimited"}}
                        ]
                    },
                    "testimonial": {
                        "enabled": true,
                        "content": {
                            "title": "What Our Customers Say",
                            "text": "Best travel insurance I have ever purchased. Smooth claims process and great coverage."
                        }
                    },
                    "footerFeatures": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "GLOBAL COVERAGE"},
                            {"order": 2, "text": "24/7 ASSISTANCE"},
                            {"order": 3, "text": "CASHLESS TREATMENT"},
                            {"order": 4, "text": "COVID COVER"}
                        ]
                    },
                    "faqItems": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "question": "What does travel insurance cover?", "answer": "It covers medical emergencies, trip cancellations, baggage loss, and more.", "isDefaultOpen": true},
                            {"order": 2, "question": "How to claim?", "answer": "Contact our 24/7 helpline or use the app to file a claim.", "isDefaultOpen": false}
                        ]
                    },
                    "trustedPartners": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "alt": "Vodafone"}
                        ]
                    },
                    "addOns": {
                        "enabled": true,
                        "content": [
                            {"label": "Popular", "title": "Adventure Sports", "description": "Coverage for adventure activities", "benefits": ["Trekking", "Scuba Diving", "Skydiving"]}
                        ]
                    },
                    "promoBanner": {
                        "enabled": true,
                        "imageUrl": "/images/travel-promo.jpg",
                        "imageAlt": "Travel Insurance Sale",
                        "ctaText": "Get Quote",
                        "ctaUrl": "/travel-quote",
                        "gradientStartColor": "#2196F3",
                        "gradientEndColor": "#03A9F4"
                    },
                    "seoMeta": {
                        "enabled": true,
                        "content": {
                            "metaTitle": "Travel Insurance - Safe Travels | Vodafone",
                            "metaDescription": "Comprehensive travel insurance. Medical coverage, trip cancellation, baggage loss.",
                            "metaKeywords": "travel insurance, trip insurance, international travel insurance"
                        }
                    }
                }
            }' | jq -r '.data.id // "failed"'
    elif [[ "$subProduct" == "health" && "$partner" == "Vodafone" ]]; then
        curl -s -X PUT "$BASE_URL/api/insurance-landing-pages/$docId" \
            -H "Content-Type: application/json" \
            -d '{
                "data": {
                    "footerSideImageAlt": "Health Insurance Footer Image",
                    "phoneMockupAlt": "Health Insurance App Preview",
                    "benefits": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "title": "Cashless Hospitalization", "description": "Get treated at network hospitals without paying"},
                            {"order": 2, "title": "Pre & Post Hospitalization", "description": "Coverage for medical expenses before and after hospital stay"},
                            {"order": 3, "title": "No Claim Bonus", "description": "Increase your sum insured for claim-free years"}
                        ]
                    },
                    "newsItems": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "Tax benefits under Section 80D"},
                            {"order": 2, "text": "Cashless hospitalization at 10000+ hospitals"}
                        ]
                    },
                    "productHighlighters": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "Cashless Hospitalization", "showIcon": true, "showHeaderIcon": true},
                            {"order": 2, "text": "Pre & Post Coverage", "showIcon": true, "showHeaderIcon": true},
                            {"order": 3, "text": "No Claim Bonus", "showIcon": true, "showHeaderIcon": true}
                        ]
                    },
                    "smartFeatureSip": {
                        "enabled": true,
                        "content": {
                            "number": "01",
                            "title": "Family Coverage"
                        }
                    },
                    "smartFeatureCoins": {
                        "enabled": true,
                        "content": {
                            "number": "02",
                            "title": "Wellness Benefits",
                            "subtitle": "Stay healthy with our wellness programs",
                            "description": "Free health checkups, teleconsultation and discounts on medicines",
                            "ctaText": "Explore"
                        }
                    },
                    "comparisonColumns": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "columnId": "silver", "title": "Silver", "isHighlighted": false},
                            {"order": 2, "columnId": "gold", "title": "Gold", "isHighlighted": true},
                            {"order": 3, "columnId": "platinum", "title": "Platinum", "isHighlighted": false}
                        ]
                    },
                    "comparisonRows": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "rowId": "sum", "label": "Sum Insured", "values": {"silver": "₹3 Lakhs", "gold": "₹5 Lakhs", "platinum": "₹10 Lakhs"}},
                            {"order": 2, "rowId": "room", "label": "Room Rent", "values": {"silver": "₹3,000/day", "gold": "₹5,000/day", "platinum": "No Limit"}},
                            {"order": 3, "rowId": "ncb", "label": "No Claim Bonus", "values": {"silver": "10%/year", "gold": "20%/year", "platinum": "50%/year"}}
                        ]
                    },
                    "testimonial": {
                        "enabled": true,
                        "content": {
                            "title": "What Our Customers Say",
                            "text": "Excellent health insurance policy. The cashless hospitalization feature is a lifesaver."
                        }
                    },
                    "footerFeatures": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "CASHLESS HOSPITALIZATION"},
                            {"order": 2, "text": "TAX BENEFITS"},
                            {"order": 3, "text": "LIFETIME RENEWAL"},
                            {"order": 4, "text": "NO CLAIM BONUS"}
                        ]
                    },
                    "faqItems": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "question": "What is covered under health insurance?", "answer": "It covers hospitalization, pre/post medical expenses, day care treatments, and more.", "isDefaultOpen": true},
                            {"order": 2, "question": "How to renew?", "answer": "Renew easily through the app with instant policy issuance.", "isDefaultOpen": false}
                        ]
                    },
                    "trustedPartners": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "alt": "Vodafone"}
                        ]
                    },
                    "addOns": {
                        "enabled": true,
                        "content": [
                            {"label": "Popular", "title": "Critical Illness Cover", "description": "Lump sum payment on diagnosis", "benefits": ["Cancer", "Heart Attack", "Stroke"]},
                            {"label": "Recommended", "title": "Maternity Coverage", "description": "Coverage for pregnancy expenses", "benefits": ["Hospitalization", "Delivery", "Newborn"]}
                        ]
                    },
                    "promoBanner": {
                        "enabled": true,
                        "imageUrl": "/images/health-promo.jpg",
                        "imageAlt": "Health Insurance Offer",
                        "ctaText": "Buy Now",
                        "ctaUrl": "/health-quote",
                        "gradientStartColor": "#4CAF50",
                        "gradientEndColor": "#8BC34A"
                    },
                    "seoMeta": {
                        "enabled": true,
                        "content": {
                            "metaTitle": "Health Insurance - Complete Medical Coverage | Vodafone",
                            "metaDescription": "Comprehensive health insurance. Cashless hospitalization, pre & post coverage, no claim bonus.",
                            "metaKeywords": "health insurance, medical insurance, family health insurance"
                        }
                    }
                }
            }' | jq -r '.data.id // "failed"'
    elif [[ "$subProduct" == "motor" && "$partner" == "default" ]]; then
        curl -s -X PUT "$BASE_URL/api/insurance-landing-pages/$docId" \
            -H "Content-Type: application/json" \
            -d '{
                "data": {
                    "footerSideImageAlt": "Gold Investment Footer Image",
                    "phoneMockupAlt": "Digital Gold App Preview",
                    "benefits": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "title": "Cashless Claims", "description": "Get instant cashless repairs at network garages"},
                            {"order": 2, "title": "24/7 Support", "description": "Round-the-clock assistance for emergencies"},
                            {"order": 3, "title": "Easy Renewal", "description": "Quick and hassle-free policy renewal"}
                        ]
                    },
                    "newsItems": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "New: Instant claim settlement"},
                            {"order": 2, "text": "Zero depreciation cover now available"}
                        ]
                    },
                    "productHighlighters": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "Cashless Repairs at 5000+ Garages", "showIcon": true, "showHeaderIcon": true},
                            {"order": 2, "text": "Lifetime Zero Depreciation", "showIcon": true, "showHeaderIcon": true},
                            {"order": 3, "text": "24/7 Roadside Assistance", "showIcon": true, "showHeaderIcon": true}
                        ]
                    },
                    "smartFeatureSip": {
                        "enabled": true,
                        "content": {
                            "number": "01",
                            "title": "Premium Protection"
                        }
                    },
                    "smartFeatureCoins": {
                        "enabled": true,
                        "content": {
                            "number": "02",
                            "title": "Quick Claims",
                            "subtitle": "Fast and easy claim settlement",
                            "description": "Get your claims settled within 24 hours",
                            "ctaText": "Learn More"
                        }
                    },
                    "comparisonColumns": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "columnId": "comprehensive", "title": "Comprehensive", "isHighlighted": true},
                            {"order": 2, "columnId": "third-party", "title": "Third Party", "isHighlighted": false},
                            {"order": 3, "columnId": "own-damage", "title": "Own Damage", "isHighlighted": false}
                        ]
                    },
                    "comparisonRows": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "rowId": "coverage", "label": "Coverage", "values": {"comprehensive": "Accidents, Theft, Natural Calamities", "third-party": "Third Party Liabilities", "own-damage": "Own Vehicle Damage"}},
                            {"order": 2, "rowId": "premium", "label": "Starting Premium", "values": {"comprehensive": "₹2,500/year", "third-party": "₹1,200/year", "own-damage": "₹1,800/year"}}
                        ]
                    },
                    "testimonial": {
                        "enabled": true,
                        "content": {
                            "title": "What Our Customers Say",
                            "text": "Excellent service! My claim was settled within 2 days. Highly recommended."
                        }
                    },
                    "footerFeatures": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "text": "100% CLAIM SETTLEMENT"},
                            {"order": 2, "text": "24/7 ROAD ASSISTANCE"},
                            {"order": 3, "text": "CASHLESS NETWORK"},
                            {"order": 4, "text": "INSTANT POLICY"}
                        ]
                    },
                    "faqItems": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "question": "What is covered in motor insurance?", "answer": "Motor insurance covers damage to your vehicle due to accidents, theft, and natural calamities.", "isDefaultOpen": true},
                            {"order": 2, "question": "How to claim?", "answer": "You can file a claim through our app or website with just a few clicks.", "isDefaultOpen": false}
                        ]
                    },
                    "trustedPartners": {
                        "enabled": true,
                        "content": [
                            {"order": 1, "alt": "MMTC-PAMP"}
                        ]
                    },
                    "addOns": {
                        "enabled": true,
                        "content": [
                            {"label": "Popular", "title": "Roadside Assistance", "description": "Get 24/7 help anywhere", "benefits": ["Towing", "Fuel Delivery", "Flat Tire Help"]},
                            {"label": "Recommended", "title": "Engine Protection", "description": "Coverage for engine damages", "benefits": ["Water Damage", "Oil Leakage", "Electrical"]}
                        ]
                    },
                    "promoBanner": {
                        "enabled": true,
                        "imageUrl": "/images/motor-promo.jpg",
                        "imageAlt": "Motor Insurance Offer",
                        "ctaText": "Get Quote",
                        "ctaUrl": "/motor-quote",
                        "gradientStartColor": "#FF5722",
                        "gradientEndColor": "#FF9800"
                    },
                    "seoMeta": {
                        "enabled": true,
                        "content": {
                            "metaTitle": "Motor Insurance - Comprehensive Vehicle Coverage",
                            "metaDescription": "Get comprehensive motor insurance coverage. Cashless claims, 24/7 support, easy renewal.",
                            "metaKeywords": "motor insurance, vehicle insurance, car insurance"
                        }
                    }
                }
            }' | jq -r '.data.id // "failed"'
    fi
}

# Step 1: Create base entries (POST)
echo "=== Creating base entries ==="

echo "Creating motor - Vodafone..."
MOTOR_VODA=$(curl -s -X POST "$BASE_URL/api/insurance-landing-pages" \
    -H "Content-Type: application/json" \
    -d '{
        "data": {
            "subProduct": "motor",
            "partner": "Vodafone",
            "headerLogo": null
        }
    }')
MOTOR_VODA_DOCID=$(echo "$MOTOR_VODA" | jq -r '.data.documentId')
echo "Document ID: $MOTOR_VODA_DOCID"

echo "Creating pocket - Vodafone..."
POCKET_VODA=$(curl -s -X POST "$BASE_URL/api/insurance-landing-pages" \
    -H "Content-Type: application/json" \
    -d '{
        "data": {
            "subProduct": "pocket",
            "partner": "Vodafone",
            "headerLogo": null
        }
    }')
POCKET_VODA_DOCID=$(echo "$POCKET_VODA" | jq -r '.data.documentId')
echo "Document ID: $POCKET_VODA_DOCID"

echo "Creating travel - Vodafone..."
TRAVEL_VODA=$(curl -s -X POST "$BASE_URL/api/insurance-landing-pages" \
    -H "Content-Type: application/json" \
    -d '{
        "data": {
            "subProduct": "travel",
            "partner": "Vodafone",
            "headerLogo": null
        }
    }')
TRAVEL_VODA_DOCID=$(echo "$TRAVEL_VODA" | jq -r '.data.documentId')
echo "Document ID: $TRAVEL_VODA_DOCID"

echo "Creating health - Vodafone..."
HEALTH_VODA=$(curl -s -X POST "$BASE_URL/api/insurance-landing-pages" \
    -H "Content-Type: application/json" \
    -d '{
        "data": {
            "subProduct": "health",
            "partner": "Vodafone",
            "headerLogo": null
        }
    }')
HEALTH_VODA_DOCID=$(echo "$HEALTH_VODA" | jq -r '.data.documentId')
echo "Document ID: $HEALTH_VODA_DOCID"

echo "Creating motor - default..."
MOTOR_DEFAULT=$(curl -s -X POST "$BASE_URL/api/insurance-landing-pages" \
    -H "Content-Type: application/json" \
    -d '{
        "data": {
            "subProduct": "motor",
            "partner": "default",
            "headerLogo": null
        }
    }')
MOTOR_DEFAULT_DOCID=$(echo "$MOTOR_DEFAULT" | jq -r '.data.documentId')
echo "Document ID: $MOTOR_DEFAULT_DOCID"

echo ""
echo "=== Adding nested components (PUT) ==="

# Step 2: Add nested components (PUT)
seed_page "motor" "Vodafone" "$MOTOR_VODA_DOCID"
seed_page "pocket" "Vodafone" "$POCKET_VODA_DOCID"
seed_page "travel" "Vodafone" "$TRAVEL_VODA_DOCID"
seed_page "health" "Vodafone" "$HEALTH_VODA_DOCID"
seed_page "motor" "default" "$MOTOR_DEFAULT_DOCID"

echo ""
echo "Insurance Landing Pages seeding completed!"

echo ""
echo "=== Verifying entries ==="
curl -s "$BASE_URL/api/insurance-landing-pages" | jq '.data[] | {id, subProduct, partner}'
