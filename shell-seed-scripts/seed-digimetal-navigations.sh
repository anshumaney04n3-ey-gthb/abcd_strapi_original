#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"

echo "Seeding DigiMetal Navigations..."

# Create Vodafone Gold Navigation
echo "Creating Vodafone Gold Navigation..."
curl -X POST "$BASE_URL/api/digimetal-navigations" \
  -H "Content-Type: application/json" \
  -d '{
    "data": {
      "name": "Vodafone Gold Navigation",
      "partner": "Vodafone",
      "headerLogoPath": "/assets/logos/vodafone-logo.png",
      "mobileHeaderLogoPath": "/assets/logos/vodafone-mobile-logo.png",
      "navTabs": [
        {
          "order": 1,
          "tabId": "home",
          "label": "Home",
          "menuItems": [
            {
              "order": 1,
              "itemId": "buy-gold",
              "title": "Buy Gold",
              "description": "Invest in digital gold starting from ₹50",
              "iconPath": "/assets/icons/buy-gold.svg",
              "navigateToUrl": "/buy-gold",
              "hasDetailContent": false
            },
            {
              "order": 2,
              "itemId": "sell-gold",
              "title": "Sell Gold",
              "description": "Sell your digital gold instantly",
              "iconPath": "/assets/icons/sell-gold.svg",
              "navigateToUrl": "/sell-gold",
              "hasDetailContent": false
            },
            {
              "order": 3,
              "itemId": "gold-sip",
              "title": "Gold SIP",
              "description": "Start systematic investment plan",
              "iconPath": "/assets/icons/sip.svg",
              "navigateToUrl": "/gold-sip",
              "hasDetailContent": true,
              "detailTitle": "Gold SIP",
              "detailDescription": "Invest regularly in gold with systematic investment plans",
              "detailBulletPoints": ["Start with ₹100/month", "Flexible tenure options", "Earn gold rewards"],
              "detailQrCodePath": "/assets/qr/sip-qr.png",
              "detailQrCodeLabel": "Scan to start SIP",
              "detailPromoImagePath": "/assets/promo/sip-promo.png",
              "detailBackgroundColor": "#FFD700"
            },
            {
              "order": 4,
              "itemId": "gift-gold",
              "title": "Gift Gold",
              "description": "Gift digital gold to your loved ones",
              "iconPath": "/assets/icons/gift.svg",
              "navigateToUrl": "/gift-gold",
              "hasDetailContent": false
            }
          ],
          "promoBanners": [
            {
              "order": 1,
              "backgroundColor": "#1A237E",
              "preTitle": "Limited Time Offer",
              "preTitleColor": "#FFD700",
              "title": "Get 50% off on first purchase",
              "ctaText": "Learn More",
              "ctaUrl": "/offers/first-purchase",
              "imagePath": "/assets/banners/offer-banner.png",
              "imageAlt": "Special Offer"
            }
          ],
          "footerBanner": {
            "qrCodePath": "/assets/qr/app-download.png",
            "text": "Download our app for seamless experience",
            "appStoreButtonsPath": "/assets/buttons/app-store.png",
            "appStoreButtonsAlt": "Download on App Store"
          }
        },
        {
          "order": 2,
          "tabId": "products",
          "label": "Products",
          "menuItems": [
            {
              "order": 1,
              "itemId": "digital-gold",
              "title": "Digital Gold",
              "description": "Buy & sell digital gold online",
              "iconPath": "/assets/icons/digital-gold.svg",
              "navigateToUrl": "/digital-gold",
              "hasDetailContent": false
            },
            {
              "order": 2,
              "itemId": "digital-silver",
              "title": "Digital Silver",
              "description": "Invest in digital silver",
              "iconPath": "/assets/icons/digital-silver.svg",
              "navigateToUrl": "/digital-silver",
              "hasDetailContent": false
            },
            {
              "order": 3,
              "itemId": "gold-coin",
              "title": "Gold Coins",
              "description": "Get physical gold delivered",
              "iconPath": "/assets/icons/gold-coin.svg",
              "navigateToUrl": "/gold-coins",
              "hasDetailContent": false
            }
          ],
          "promoBanners": [],
          "footerBanner": null
        },
        {
          "order": 3,
          "tabId": "learn",
          "label": "Learn",
          "menuItems": [
            {
              "order": 1,
              "itemId": "how-it-works",
              "title": "How It Works",
              "description": "Understand digital gold investment",
              "iconPath": "/assets/icons/how-it-works.svg",
              "navigateToUrl": "/how-it-works",
              "hasDetailContent": false
            },
            {
              "order": 2,
              "itemId": "price-info",
              "title": "Price Information",
              "description": "Live gold & silver prices",
              "iconPath": "/assets/icons/price.svg",
              "navigateToUrl": "/prices",
              "hasDetailContent": false
            },
            {
              "order": 3,
              "itemId": "security",
              "title": "Security",
              "description": "How your investment is protected",
              "iconPath": "/assets/icons/security.svg",
              "navigateToUrl": "/security",
              "hasDetailContent": false
            }
          ],
          "promoBanners": [],
          "footerBanner": null
        },
        {
          "order": 4,
          "tabId": "support",
          "label": "Support",
          "menuItems": [
            {
              "order": 1,
              "itemId": "faqs",
              "title": "FAQs",
              "description": "Frequently asked questions",
              "iconPath": "/assets/icons/faq.svg",
              "navigateToUrl": "/faqs",
              "hasDetailContent": false
            },
            {
              "order": 2,
              "itemId": "contact",
              "title": "Contact Us",
              "description": "Get in touch with us",
              "iconPath": "/assets/icons/contact.svg",
              "navigateToUrl": "/contact",
              "hasDetailContent": false
            }
          ],
          "promoBanners": [],
          "footerBanner": null
        }
      ],
      "mobileFooterBanner": {
        "text": "Download the Vodafone Gold App",
        "appStoreIconPath": "/assets/buttons/app-store.png",
        "appStoreLabel": "Download on App Store",
        "appStoreUrl": "https://apps.apple.com/app/vodafone-gold",
        "playStoreIconPath": "/assets/buttons/play-store.png",
        "playStoreLabel": "Get it on Google Play",
        "playStoreUrl": "https://play.google.com/store/apps/vodafone-gold"
      }
    }
  }'

echo ""

# Create Vodafone Silver Navigation
echo "Creating Vodafone Silver Navigation..."
curl -X POST "$BASE_URL/api/digimetal-navigations" \
  -H "Content-Type: application/json" \
  -d '{
    "data": {
      "name": "Vodafone Silver Navigation",
      "partner": "Vodafone",
      "headerLogoPath": "/assets/logos/vodafone-silver-logo.png",
      "mobileHeaderLogoPath": "/assets/logos/vodafone-silver-mobile.png",
      "navTabs": [
        {
          "order": 1,
          "tabId": "home",
          "label": "Home",
          "menuItems": [
            {
              "order": 1,
              "itemId": "buy-silver",
              "title": "Buy Silver",
              "description": "Invest in digital silver starting from ₹50",
              "iconPath": "/assets/icons/buy-silver.svg",
              "navigateToUrl": "/buy-silver",
              "hasDetailContent": false
            },
            {
              "order": 2,
              "itemId": "sell-silver",
              "title": "Sell Silver",
              "description": "Sell your digital silver instantly",
              "iconPath": "/assets/icons/sell-silver.svg",
              "navigateToUrl": "/sell-silver",
              "hasDetailContent": false
            },
            {
              "order": 3,
              "itemId": "silver-sip",
              "title": "Silver SIP",
              "description": "Start systematic investment plan",
              "iconPath": "/assets/icons/sip.svg",
              "navigateToUrl": "/silver-sip",
              "hasDetailContent": false
            }
          ],
          "promoBanners": [
            {
              "order": 1,
              "backgroundColor": "#C0C0C0",
              "preTitle": "New",
              "preTitleColor": "#FFFFFF",
              "title": "Silver SIP - Start from ₹100",
              "ctaText": "Invest Now",
              "ctaUrl": "/silver-sip",
              "imagePath": "/assets/banners/silver-sip-banner.png",
              "imageAlt": "Silver SIP Offer"
            }
          ],
          "footerBanner": null
        },
        {
          "order": 2,
          "tabId": "products",
          "label": "Products",
          "menuItems": [
            {
              "order": 1,
              "itemId": "digital-gold",
              "title": "Digital Gold",
              "description": "Buy & sell digital gold online",
              "iconPath": "/assets/icons/digital-gold.svg",
              "navigateToUrl": "/digital-gold",
              "hasDetailContent": false
            },
            {
              "order": 2,
              "itemId": "digital-silver",
              "title": "Digital Silver",
              "description": "Invest in digital silver",
              "iconPath": "/assets/icons/digital-silver.svg",
              "navigateToUrl": "/digital-silver",
              "hasDetailContent": false
            }
          ],
          "promoBanners": [],
          "footerBanner": null
        },
        {
          "order": 3,
          "tabId": "support",
          "label": "Support",
          "menuItems": [
            {
              "order": 1,
              "itemId": "faqs",
              "title": "FAQs",
              "description": "Frequently asked questions",
              "iconPath": "/assets/icons/faq.svg",
              "navigateToUrl": "/faqs",
              "hasDetailContent": false
            }
          ],
          "promoBanners": [],
          "footerBanner": null
        }
      ],
      "mobileFooterBanner": {
        "text": "Download the Vodafone Silver App",
        "appStoreIconPath": "/assets/buttons/app-store.png",
        "appStoreLabel": "Download on App Store",
        "appStoreUrl": "https://apps.apple.com/app/vodafone-silver",
        "playStoreIconPath": "/assets/buttons/play-store.png",
        "playStoreLabel": "Get it on Google Play",
        "playStoreUrl": "https://play.google.com/store/apps/vodafone-silver"
      }
    }
  }'

echo ""

# Create Airtel Gold Navigation
echo "Creating Airtel Gold Navigation..."
curl -X POST "$BASE_URL/api/digimetal-navigations" \
  -H "Content-Type: application/json" \
  -d '{
    "data": {
      "name": "Airtel Gold Navigation",
      "partner": "Airtel",
      "headerLogoPath": "/assets/logos/airtel-logo.png",
      "mobileHeaderLogoPath": "/assets/logos/airtel-mobile-logo.png",
      "navTabs": [
        {
          "order": 1,
          "tabId": "home",
          "label": "Home",
          "menuItems": [
            {
              "order": 1,
              "itemId": "buy-gold",
              "title": "Buy Gold",
              "description": "Start investing in digital gold",
              "iconPath": "/assets/icons/buy-gold.svg",
              "navigateToUrl": "/buy-gold",
              "hasDetailContent": false
            },
            {
              "order": 2,
              "itemId": "sell-gold",
              "title": "Sell Gold",
              "description": "Sell gold instantly",
              "iconPath": "/assets/icons/sell-gold.svg",
              "navigateToUrl": "/sell-gold",
              "hasDetailContent": false
            },
            {
              "order": 3,
              "itemId": "gift-gold",
              "title": "Gift Gold",
              "description": "Gift gold to loved ones",
              "iconPath": "/assets/icons/gift.svg",
              "navigateToUrl": "/gift-gold",
              "hasDetailContent": false
            }
          ],
          "promoBanners": [
            {
              "order": 1,
              "backgroundColor": "#00A0E3",
              "preTitle": "Airtel Gold",
              "preTitleColor": "#FFFFFF",
              "title": "Buy Gold with Airtel Thanks",
              "ctaText": "Explore",
              "ctaUrl": "/airtel-thanks",
              "imagePath": "/assets/banners/airtel-thanks.png",
              "imageAlt": "Airtel Thanks"
            }
          ],
          "footerBanner": null
        }
      ],
      "mobileFooterBanner": {
        "text": "Get Airtel Gold on Thanks App",
        "playStoreIconPath": "/assets/buttons/play-store.png",
        "playStoreLabel": "Get it on Google Play",
        "playStoreUrl": "https://play.google.com/store/apps/thanks"
      }
    }
  }'

echo ""

# Create Jio Gold Navigation
echo "Creating Jio Gold Navigation..."
curl -X POST "$BASE_URL/api/digimetal-navigations" \
  -H "Content-Type: application/json" \
  -d '{
    "data": {
      "name": "Jio Gold Navigation",
      "partner": "Jio",
      "headerLogoPath": "/assets/logos/jio-logo.png",
      "mobileHeaderLogoPath": "/assets/logos/jio-mobile-logo.png",
      "navTabs": [
        {
          "order": 1,
          "tabId": "home",
          "label": "Home",
          "menuItems": [
            {
              "order": 1,
              "itemId": "buy-gold",
              "title": "Buy Gold",
              "description": "Digital gold investment",
              "iconPath": "/assets/icons/buy-gold.svg",
              "navigateToUrl": "/buy-gold",
              "hasDetailContent": false
            },
            {
              "order": 2,
              "itemId": "sell-gold",
              "title": "Sell Gold",
              "description": "Instant sell to bank",
              "iconPath": "/assets/icons/sell-gold.svg",
              "navigateToUrl": "/sell-gold",
              "hasDetailContent": false
            }
          ],
          "promoBanners": [
            {
              "order": 1,
              "backgroundColor": "#0C2547",
              "preTitle": "Jio Pay",
              "preTitleColor": "#D4AF37",
              "title": "Gold on JioPay",
              "ctaText": "Know More",
              "ctaUrl": "/jiopay-gold",
              "imagePath": "/assets/banners/jiopay-gold.png",
              "imageAlt": "JioPay Gold"
            }
          ],
          "footerBanner": null
        }
      ],
      "mobileFooterBanner": {
        "text": "Use JioPay for Gold",
        "playStoreIconPath": "/assets/buttons/play-store.png",
        "playStoreLabel": "Get it on Google Play",
        "playStoreUrl": "https://play.google.com/store/apps/jio-pay"
      }
    }
  }'

echo ""
echo "DigiMetal Navigations seeding completed"
