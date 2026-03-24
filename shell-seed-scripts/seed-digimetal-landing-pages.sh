#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding DigiMetal Landing Pages..."

# SubProduct: gold, Partner: Vodafone
curl -X POST "$BASE_URL/api/digimetal-landing-pages" \
  -H "Content-Type: application/json" \
  -d '{
    "subProduct": "gold",
    "partner": "Vodafone",
    "widgetConsentLabel": "I agree with",
    "widgetTermsText": "Terms & Conditions",
    "widgetTermsUrl": "/terms",
    "widgetPrivacyText": "Privacy Policy",
    "widgetPrivacyUrl": "/privacy",
    "widgetCtaButtonText": "Proceed",
    "widgetTrustText": "Trusted by 10 lakh+ investors",
    "widgetMaxResendAttempts": 3,
    "widgetMaxResendMessage": "Maximum resend attempts reached. Please try again later.",
    "widgetNavigationVariant": "buttons",
    "sectionTitleHowItWorks": "How It Works",
    "sectionCtaHowItWorks": "Get Started",
    "sectionTitleComparison": "Compare Investment Options",
    "sectionTitleSipCalculator": "Gold SIP Calculator",
    "sectionSubtitleSipCalculator": "Plan your gold investment with systematic monthly purchases",
    "sectionTitleAdvantages": "Why Choose Digital Gold?",
    "sectionSubtitleVideos": "Learn More About Gold Investment",
    "footerReferenceHeading": "Offered by",
    "footerReferenceName": "MMTC-PAMP",
    "footerReferenceCertification": "ISO 27001:2013 certified. 100% safe & secure.",
    "phoneMockupAlt": "Digital Gold App Preview",
    "widgetPriceSuffix": "/gm",
    "widgetPriceValidForSeconds": 300,
    "widgetMinAmount": 50,
    "widgetMaxAmount": 500000,
    "widgetMinWeight": 0,
    "widgetMaxWeight": 50,
    "sipCalculatorEnabled": true,
    "headerLogo": null,
    "mobileHeaderLogo": null,
    "securityDesktopBackground": null,
    "securityMobileBackground": null,
    "footerReferenceLogo": null,
    "footerSideImage": null,
    "footerSideImageAlt": "",
    "phoneMockup": null,
    "widgetTabs": {
      "enabled": true,
      "content": [
        {"order": 1, "tabId": "buy", "label": "Buy Gold"},
        {"order": 2, "tabId": "sip", "label": "Gold SIP"},
        {"order": 3, "tabId": "gift", "label": "Gift Gold"}
      ]
    },
    "widgetAmountChips": {
      "enabled": true,
      "content": [
        {"order": 1, "value": "500", "isPopular": false},
        {"order": 2, "value": "1000", "isPopular": true},
        {"order": 3, "value": "5000", "isPopular": false},
        {"order": 4, "value": "10000", "isPopular": false},
        {"order": 5, "value": "25000", "isPopular": false}
      ]
    },
    "widgetGramChips": {
      "enabled": true,
      "content": [
        {"order": 1, "value": "1", "isPopular": false},
        {"order": 2, "value": "2", "isPopular": true},
        {"order": 3, "value": "5", "isPopular": false},
        {"order": 4, "value": "10", "isPopular": false},
        {"order": 5, "value": "20", "isPopular": false}
      ]
    },
    "heroSlides": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Invest in Digital Gold", "subtitle": "Start with as little as ₹50. 100% pure 24K gold stored securely in vault."},
        {"order": 2, "title": "Gold SIP - Systematic Investment", "subtitle": "Invest ₹100/month and build your gold portfolio gradually."},
        {"order": 3, "title": "Gift Gold to Your Loved Ones", "subtitle": "Gift the joy of owning real gold to your family and friends."}
      ]
    },
    "workTabs": {
      "enabled": true,
      "content": [
        {
          "order": 1,
          "tabId": "buy",
          "label": "Buy",
          "ctaText": "Start Buying",
          "steps": [
            {"order": 1, "stepId": "step1", "title": "Enter Amount", "description": "Choose how much gold you want to buy"},
            {"order": 2, "stepId": "step2", "title": "Make Payment", "description": "Pay securely via UPI or bank transfer"},
            {"order": 3, "stepId": "step3", "title": "Gold Added", "description": "Your gold is added to your account instantly"}
          ]
        },
        {
          "order": 2,
          "tabId": "sell",
          "label": "Sell",
          "ctaText": "Start Selling",
          "steps": [
            {"order": 1, "stepId": "step1", "title": "Enter Amount", "description": "Choose how much gold you want to sell"},
            {"order": 2, "stepId": "step2", "title": "Verify Details", "description": "Confirm your bank details for credit"},
            {"order": 3, "stepId": "step3", "title": "Money Credited", "description": "Get instant credit to your bank account"}
          ]
        },
        {
          "order": 3,
          "tabId": "sip",
          "label": "SIP",
          "ctaText": "Start SIP",
          "steps": [
            {"order": 1, "stepId": "step1", "title": "Choose Plan", "description": "Select your monthly investment amount"},
            {"order": 2, "stepId": "step2", "title": "Set Auto-Pay", "description": "Link your bank account for auto-debit"},
            {"order": 3, "stepId": "step3", "title": "Gold Accumulates", "description": "Watch your gold grow every month"}
          ]
        }
      ]
    },
    "benefits": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Start from ₹50", "description": "Begin your gold investment journey with as little as ₹50"},
        {"order": 2, "title": "100% Pure Gold", "description": "Get 24K pure gold, certified by MMTC-PAMP"},
        {"order": 3, "title": "Secure Storage", "description": "Your gold is stored in secure vaults, fully insured"}
      ]
    },
    "securityFeatures": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Bank Grade Security", "description": "Your investment is protected with industry-standard security"},
        {"order": 2, "title": "Fully Insured", "description": "Your gold is fully insured against theft or damage"},
        {"order": 3, "title": "Verified by MMTC-PAMP", "description": "All gold is certified by India'\''s leading gold refiner"},
        {"order": 4, "title": "Transparent Pricing", "description": "Live prices updated every 5 minutes from international markets"}
      ]
    },
    "smartFeatureSip": {
      "enabled": true,
      "content": {
        "number": "01",
        "title": "Gold SIP",
        "featureChips": [
          {"order": 1, "text": "Start from ₹100/month"},
          {"order": 2, "text": "Flexible tenure"},
          {"order": 3, "text": "Rupee cost averaging"},
          {"order": 4, "text": "Auto-redeem option"}
        ]
      }
    },
    "smartFeatureGifting": {
      "enabled": true,
      "content": {
        "number": "02",
        "title": "Gift Gold",
        "featureChips": [
          {"order": 1, "text": "Instant delivery"},
          {"order": 2, "text": "Customized messages"},
          {"order": 3, "text": "Gift tracking"}
        ]
      }
    },
    "smartFeatureCoins": {
      "enabled": true,
      "content": {
        "number": "03",
        "title": "Gold Coins",
        "featureChips": [
          {"order": 1, "text": "Physical delivery"},
          {"order": 2, "text": "24K pure gold"},
          {"order": 3, "text": "Certificate of purity"}
        ]
      }
    },
    "comparisonColumns": {
      "enabled": true,
      "content": [
        {"order": 1, "columnId": "digital-gold", "title": "Digital Gold", "isPopular": true},
        {"order": 2, "columnId": "physical-gold", "title": "Physical Gold", "isPopular": false},
        {"order": 3, "columnId": "gold-etf", "title": "Gold ETF", "isPopular": false}
      ]
    },
    "comparisonRows": {
      "enabled": true,
      "content": [
        {"order": 1, "rowId": "min-invest", "label": "Minimum Investment", "values": {"digital-gold": "₹50", "physical-gold": "₹5,000", "gold-etf": "₹500"}},
        {"order": 2, "rowId": "storage", "label": "Storage", "values": {"digital-gold": "Vault", "physical-gold": "You", "gold-etf": "Demat"}},
        {"order": 3, "rowId": "making-charges", "label": "Making Charges", "values": {"digital-gold": "None", "physical-gold": "8-15%", "gold-etf": "0.5%"}},
        {"order": 4, "rowId": "liquidity", "label": "Liquidity", "values": {"digital-gold": "Instant", "physical-gold": "Moderate", "gold-etf": "T+2 days"}}
      ]
    },
    "testimonial": {
      "enabled": true,
      "content": {
        "title": "What Our Investors Say",
        "text": "Digital Gold has made it so easy to invest in gold. I started with just ₹500 and now have a significant gold portfolio."
      }
    },
    "faqItems": {
      "enabled": true,
      "content": [
        {"order": 1, "question": "What is Digital Gold?", "answer": "Digital Gold is a form of investment where you can buy, sell, and hold gold in a demat form without physically storing it.", "isDefaultOpen": true},
        {"order": 2, "question": "How safe is Digital Gold?", "answer": "Digital Gold is 100% safe. Your gold is stored in insured vaults by MMTC-PAMP.", "isDefaultOpen": false},
        {"order": 3, "question": "What is the minimum investment?", "answer": "You can start investing in Digital Gold with as little as ₹50.", "isDefaultOpen": false},
        {"order": 4, "question": "Can I get physical gold delivered?", "answer": "Yes, you can convert your digital gold to physical gold coins or bars.", "isDefaultOpen": false}
      ]
    },
    "footerFeatures": {
      "enabled": true,
      "content": [
        {"order": 1, "text": "100% SAFE & SECURE"},
        {"order": 2, "text": "24K PURE GOLD"},
        {"order": 3, "text": "INSTANT LIQUIDITY"},
        {"order": 4, "text": "FREE INSURANCE"}
      ]
    },
    "videos": {
      "enabled": true,
      "content": [
        {"order": 1, "videoId": "intro", "title": "Introduction to Digital Gold", "videoUrl": "https://www.youtube.com/watch?v=intro"},
        {"order": 2, "videoId": "benefits", "title": "Benefits of Gold Investment", "videoUrl": "https://www.youtube.com/watch?v=benefits"}
      ]
    },
    "newsItems": {
      "enabled": true,
      "content": [
        {"order": 1, "newsId": "gold-rises", "title": "Gold Prices Surge", "description": "Gold prices reach new highs amid market uncertainty", "date": "2024-01-15"},
        {"order": 2, "newsId": "digital-gold-growth", "title": "Digital Gold Adoption Grows", "description": "More investors turning to digital gold for portfolio diversification", "date": "2024-01-10"}
      ]
    },
    "promoBanner": {
      "enabled": true,
      "content": {
        "order": 1,
        "backgroundColor": "#FFD700",
        "title": "Festive Offer",
        "ctaText": "Claim Now",
        "ctaUrl": "/offers/festive"
      }
    },
    "sipCalculatorConfig": {
      "enabled": true,
      "content": {
        "title": "Gold SIP Calculator",
        "defaultMonthlyAmount": 1000,
        "defaultTenureYears": 5,
        "defaultGoldPricePerGram": 5500
      }
    },
    "cagrConfig": {
      "enabled": true,
      "content": {
        "label": "Expected Returns",
        "defaultValue": 12,
        "minValue": 5,
        "maxValue": 25
      }
    },
    "productHighlighters": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "24K Pure Gold", "description": "Certified pure gold"},
        {"order": 2, "title": "Secure Vault", "description": "Insured storage"},
        {"order": 3, "title": "Instant Buy/Sell", "description": "Real-time pricing"}
      ]
    },
    "educationCards": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Learn About Gold", "description": "Understanding gold investment"}
      ]
    },
    "appStoreButtons": {
      "enabled": true,
      "content": {
        "appStoreUrl": "",
        "playStoreUrl": ""
      }
    }
  }'

# SubProduct: silver, Partner: Vodafone
curl -X POST "$BASE_URL/api/digimetal-landing-pages" \
  -H "Content-Type: application/json" \
  -d '{
    "subProduct": "silver",
    "partner": "Vodafone",
    "widgetConsentLabel": "I agree with",
    "widgetTermsText": "Terms & Conditions",
    "widgetTermsUrl": "/terms",
    "widgetPrivacyText": "Privacy Policy",
    "widgetPrivacyUrl": "/privacy",
    "widgetCtaButtonText": "Proceed",
    "widgetTrustText": "Trusted by 5 lakh+ investors",
    "widgetMaxResendAttempts": 3,
    "widgetMaxResendMessage": "Maximum resend attempts reached. Please try again later.",
    "widgetNavigationVariant": "buttons",
    "sectionTitleHowItWorks": "How It Works",
    "sectionCtaHowItWorks": "Get Started",
    "sectionTitleComparison": "Compare Investment Options",
    "sectionTitleSipCalculator": "Silver SIP Calculator",
    "sectionSubtitleSipCalculator": "Plan your silver investment with systematic monthly purchases",
    "sectionTitleAdvantages": "Why Choose Digital Silver?",
    "sectionSubtitleVideos": "Learn More About Silver Investment",
    "footerReferenceHeading": "Offered by",
    "footerReferenceName": "MMTC-PAMP",
    "footerReferenceCertification": "ISO 27001:2013 certified. 100% safe & secure.",
    "phoneMockupAlt": "Digital Silver App Preview",
    "widgetPriceSuffix": "/gm",
    "widgetPriceValidForSeconds": 300,
    "widgetMinAmount": 50,
    "widgetMaxAmount": 500000,
    "widgetMinWeight": 0,
    "widgetMaxWeight": 1000,
    "sipCalculatorEnabled": true,
    "headerLogo": null,
    "mobileHeaderLogo": null,
    "securityDesktopBackground": null,
    "securityMobileBackground": null,
    "footerReferenceLogo": null,
    "footerSideImage": null,
    "footerSideImageAlt": "",
    "phoneMockup": null,
    "widgetTabs": {
      "enabled": true,
      "content": [
        {"order": 1, "tabId": "buy", "label": "Buy Silver"},
        {"order": 2, "tabId": "sip", "label": "Silver SIP"}
      ]
    },
    "widgetAmountChips": {
      "enabled": true,
      "content": [
        {"order": 1, "value": "500", "isPopular": false},
        {"order": 2, "value": "1000", "isPopular": true},
        {"order": 3, "value": "5000", "isPopular": false},
        {"order": 4, "value": "10000", "isPopular": false}
      ]
    },
    "widgetGramChips": {
      "enabled": true,
      "content": [
        {"order": 1, "value": "10", "isPopular": false},
        {"order": 2, "value": "50", "isPopular": true},
        {"order": 3, "value": "100", "isPopular": false},
        {"order": 4, "value": "250", "isPopular": false}
      ]
    },
    "heroSlides": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Invest in Digital Silver", "subtitle": "Start with as little as ₹50. 999 pure silver stored securely in vault."},
        {"order": 2, "title": "Silver SIP - Systematic Investment", "subtitle": "Invest ₹100/month and build your silver portfolio gradually."}
      ]
    },
    "workTabs": {
      "enabled": true,
      "content": [
        {
          "order": 1,
          "tabId": "buy",
          "label": "Buy",
          "ctaText": "Start Buying",
          "steps": [
            {"order": 1, "stepId": "step1", "title": "Enter Amount", "description": "Choose how much silver you want to buy"},
            {"order": 2, "stepId": "step2", "title": "Make Payment", "description": "Pay securely via UPI or bank transfer"},
            {"order": 3, "stepId": "step3", "title": "Silver Added", "description": "Your silver is added to your account instantly"}
          ]
        },
        {
          "order": 2,
          "tabId": "sell",
          "label": "Sell",
          "ctaText": "Start Selling",
          "steps": [
            {"order": 1, "stepId": "step1", "title": "Enter Amount", "description": "Choose how much silver you want to sell"},
            {"order": 2, "stepId": "step2", "title": "Verify Details", "description": "Confirm your bank details for credit"},
            {"order": 3, "stepId": "step3", "title": "Money Credited", "description": "Get instant credit to your bank account"}
          ]
        }
      ]
    },
    "benefits": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Start from ₹50", "description": "Begin your silver investment journey with as little as ₹50"},
        {"order": 2, "title": "999 Pure Silver", "description": "Get 999 pure silver, certified by MMTC-PAMP"},
        {"order": 3, "title": "Secure Storage", "description": "Your silver is stored in secure vaults, fully insured"}
      ]
    },
    "securityFeatures": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "Bank Grade Security", "description": "Your investment is protected with industry-standard security"},
        {"order": 2, "title": "Fully Insured", "description": "Your silver is fully insured against theft or damage"},
        {"order": 3, "title": "Verified by MMTC-PAMP", "description": "All silver is certified by India'\''s leading silver refiner"}
      ]
    },
    "smartFeatureSip": {
      "enabled": true,
      "content": {
        "number": "01",
        "title": "Silver SIP",
        "featureChips": [
          {"order": 1, "text": "Start from ₹100/month"},
          {"order": 2, "text": "Flexible tenure"},
          {"order": 3, "text": "Rupee cost averaging"}
        ]
      }
    },
    "smartFeatureGifting": {
      "enabled": true,
      "content": {
        "number": "02",
        "title": "Gift Silver",
        "featureChips": [
          {"order": 1, "text": "Instant delivery"},
          {"order": 2, "text": "Customized messages"},
          {"order": 3, "text": "Gift tracking"}
        ]
      }
    },
    "smartFeatureCoins": {
      "enabled": false,
      "content": {}
    },
    "comparisonColumns": {
      "enabled": true,
      "content": [
        {"order": 1, "columnId": "digital-silver", "title": "Digital Silver", "isPopular": true},
        {"order": 2, "columnId": "physical-silver", "title": "Physical Silver", "isPopular": false}
      ]
    },
    "comparisonRows": {
      "enabled": true,
      "content": [
        {"order": 1, "rowId": "min-invest", "label": "Minimum Investment", "values": {"digital-silver": "₹50", "physical-silver": "₹1,000"}},
        {"order": 2, "rowId": "storage", "label": "Storage", "values": {"digital-silver": "Vault", "physical-silver": "You"}},
        {"order": 3, "rowId": "making-charges", "label": "Making Charges", "values": {"digital-silver": "None", "physical-silver": "5-10%"}}
      ]
    },
    "testimonial": {
      "enabled": true,
      "content": {
        "title": "What Our Investors Say",
        "text": "Digital Silver is a great way to diversify my portfolio. The low minimum investment and secure storage make it perfect for regular investors."
      }
    },
    "faqItems": {
      "enabled": true,
      "content": [
        {"order": 1, "question": "What is Digital Silver?", "answer": "Digital Silver is a form of investment where you can buy, sell, and hold silver in a demat form.", "isDefaultOpen": true},
        {"order": 2, "question": "How safe is Digital Silver?", "answer": "Digital Silver is 100% safe. Your silver is stored in insured vaults by MMTC-PAMP.", "isDefaultOpen": false},
        {"order": 3, "question": "What is the minimum investment?", "answer": "You can start investing in Digital Silver with as little as ₹50.", "isDefaultOpen": false}
      ]
    },
    "footerFeatures": {
      "enabled": true,
      "content": [
        {"order": 1, "text": "100% SAFE & SECURE"},
        {"order": 2, "text": "999 PURE SILVER"},
        {"order": 3, "text": "INSTANT LIQUIDITY"},
        {"order": 4, "text": "FREE INSURANCE"}
      ]
    },
    "videos": {
      "enabled": true,
      "content": [
        {"order": 1, "videoId": "silver-intro", "title": "Introduction to Digital Silver", "videoUrl": "https://www.youtube.com/watch?v=silver-intro"}
      ]
    },
    "newsItems": {
      "enabled": false,
      "content": []
    },
    "promoBanner": {
      "enabled": true,
      "content": {
        "order": 1,
        "backgroundColor": "#C0C0C0",
        "title": "Silver SIP Offer",
        "ctaText": "Start Now",
        "ctaUrl": "/offers/silver-sip"
      }
    },
    "sipCalculatorConfig": {
      "enabled": true,
      "content": {
        "title": "Silver SIP Calculator",
        "defaultMonthlyAmount": 1000,
        "defaultTenureYears": 5,
        "defaultGoldPricePerGram": 75
      }
    },
    "cagrConfig": {
      "enabled": true,
      "content": {
        "label": "Expected Returns",
        "defaultValue": 10,
        "minValue": 3,
        "maxValue": 20
      }
    },
    "productHighlighters": {
      "enabled": true,
      "content": [
        {"order": 1, "title": "999 Pure Silver", "description": "Certified pure silver"},
        {"order": 2, "title": "Secure Vault", "description": "Insured storage"},
        {"order": 3, "title": "Instant Buy/Sell", "description": "Real-time pricing"}
      ]
    },
    "educationCards": {
      "enabled": false,
      "content": []
    },
    "appStoreButtons": {
      "enabled": true,
      "content": {
        "appStoreUrl": "",
        "playStoreUrl": ""
      }
    }
  }'

echo "DigiMetal Landing Pages seeding completed"
