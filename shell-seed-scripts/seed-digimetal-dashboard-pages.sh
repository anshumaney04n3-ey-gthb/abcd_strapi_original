#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"

# Ensure BASE_URL is set (fallback to localhost)
BASE_URL="${BASE_URL:-http://localhost:1337}"

SEED_TYPE="digimetal-dashboard-pages"

echo "Seeding DigiMetal Dashboard Pages..."
echo "Using BASE_URL: $BASE_URL"

# Function to cleanup ALL entries of this type
cleanup_all() {
    echo "Cleaning up all existing entries for $SEED_TYPE..."
    
    response=$(curl -s "$BASE_URL/api/$SEED_TYPE")
    
    docIds=$(echo "$response" | grep -o '"documentId":"[^"]*"' | sed 's/"documentId":"//;s/"//')
    
    if [[ -n "$docIds" ]]; then
        count=0
        while IFS= read -r docId; do
            if [[ -n "$docId" && "$docId" != "null" ]]; then
                curl -s -X DELETE "$BASE_URL/api/$SEED_TYPE/$docId" > /dev/null
                echo "  Deleted: $docId"
                count=$((count + 1))
            fi
        done <<< "$docIds"
        echo "[CLEANUP] Deleted $count entries"
    else
        echo "[CLEANUP] No existing entries found"
    fi
}

# Function to seed a dashboard page
seed_dashboard_page() {
    local subProduct="$1"
    local json_payload="$2"
    
    echo ""
    echo "----------------------------------------"
    echo "Seeding: $SEED_TYPE (subProduct: $subProduct)"
    echo "----------------------------------------"
    
    echo "POSTing to $BASE_URL/api/$SEED_TYPE..."
    response=$(curl -s -w "\n%{http_code}" -X POST "$BASE_URL/api/$SEED_TYPE" \
        -H "Content-Type: application/json" \
        -d "{\"data\": $json_payload}")
    
    http_code=$(echo "$response" | tail -n1)
    body=$(echo "$response" | sed '$d')
    
    if [[ "$http_code" == "200" || "$http_code" == "201" ]]; then
        documentId=$(echo "$body" | grep -o '"documentId":"[^"]*"' | head -1 | sed 's/"documentId":"//;s/"//')
        entryId=$(echo "$body" | grep -o '"id":[0-9]*' | head -1 | sed 's/"id"://')
        echo "[SUCCESS] Created: $subProduct (ID: $entryId, DocID: $documentId)"
        return 0
    fi
    
    echo "[FAILED] HTTP $http_code for: $subProduct"
    echo "Response: $body"
    return 1
}

# Default Dashboard Page JSON
DEFAULT_JSON='{
    "subProduct": "gold",
    "partner": "default",
    "sectionTitleComparison": "Compare Gold Investment Options",
    "sectionSubtitleVideos": "Learn more about digital gold",
    "sectionTitleReferral": "Refer a Friend & Earn Gold",
    "livePriceDisclaimer": "Live gold prices updated every 5 minutes",
    "footerReferenceHeading": "Powered by",
    "footerReferenceName": "MMTC-PAMP",
    "footerReferenceCertification": "ISO 27001:2013 certified. 100% safe & secure. Your gold is fully insured.",
    "heroImagePath": "/assets/dashboard/gold-hero.png",
    "patternImagePath": "/assets/dashboard/pattern.png",
    "maskImagePath": "/assets/dashboard/mask.png",
    "transactionsEmptyImagePath": "/assets/dashboard/empty-transactions.png",
    "mmtcLogoPath": "/assets/logos/mmtc-pamp.png",
    "footerBarsImagePath": "/assets/dashboard/footer-bars.png",
    "headerLogoAlt": "ABCD Logo",
    "footerLogoAlt": "ABCD Logo",
    "actionCards": {
        "enabled": true,
        "content": [
            {"order": 1, "cardId": "buy-gold", "title": "Buy Gold", "subtitle": "Start investing from ₹50"},
            {"order": 2, "cardId": "sell-gold", "title": "Sell Gold", "subtitle": "Get instant money"},
            {"order": 3, "cardId": "gold-sip", "title": "Gold SIP", "subtitle": "Invest regularly"},
            {"order": 4, "cardId": "gift-gold", "title": "Gift Gold", "subtitle": "Gift to loved ones"}
        ]
    },
    "comparisonColumns": {
        "enabled": true,
        "content": [
            {"order": 1, "columnId": "digital-gold", "title": "Digital Gold", "isHighlighted": true},
            {"order": 2, "columnId": "physical-gold", "title": "Physical Gold", "isHighlighted": false},
            {"order": 3, "columnId": "gold-etf", "title": "Gold ETF", "isHighlighted": false}
        ]
    },
    "comparisonRows": {
        "enabled": true,
        "content": [
            {"order": 1, "rowId": "min-investment", "label": "Minimum Investment", "values": {"digital-gold": "₹50", "physical-gold": "₹5,000", "gold-etf": "₹500"}},
            {"order": 2, "rowId": "storage", "label": "Storage", "values": {"digital-gold": "Secure vault", "physical-gold": "You manage", "gold-etf": "Demat account"}},
            {"order": 3, "rowId": "liquidity", "label": "Liquidity", "values": {"digital-gold": "Instant", "physical-gold": "Moderate", "gold-etf": "T+2 days"}},
            {"order": 4, "rowId": "safety", "label": "Safety", "values": {"digital-gold": "100% insured", "physical-gold": "Self-insured", "gold-etf": "SEBI regulated"}},
            {"order": 5, "rowId": "making-charges", "label": "Making Charges", "values": {"digital-gold": "None", "physical-gold": "8-15%", "gold-etf": "0.5-1%"}}
        ]
    },
    "footerFeatures": {
        "enabled": true,
        "content": [
            {"order": 1, "text": "100% SAFE & SECURE"},
            {"order": 2, "text": "24K PURE GOLD"},
            {"order": 3, "text": "INSTANT LIQUIDITY"},
            {"order": 4, "text": "FREE INSURANCE"},
            {"order": 5, "text": "VERIFIED BY MMTC-PAMP"}
        ]
    },
    "sidebarFAQs": {
        "enabled": true,
        "content": [
            {"order": 1, "faqId": "what-is-digital-gold", "title": "What is Digital Gold?", "content": "Digital Gold allows you to buy, sell, and store gold in a demat form without physically holding it.", "isExternal": false},
            {"order": 2, "faqId": "how-to-buy", "title": "How to buy Digital Gold?", "content": "Simply choose the amount or weight of gold you wish to purchase, complete the payment.", "isExternal": false},
            {"order": 3, "faqId": "is-it-safe", "title": "Is my investment safe?", "content": "Yes, your digital gold is 100% insured and stored in secure vaults.", "isExternal": false},
            {"order": 4, "faqId": "sell-instantly", "title": "Can I sell instantly?", "content": "Yes, you can sell your digital gold instantly.", "isExternal": false},
            {"order": 5, "faqId": "delivery-option", "title": "Can I get physical gold delivered?", "content": "Yes, you can convert your digital gold to physical gold coins.", "isExternal": false}
        ]
    },
    "videos": {
        "enabled": true,
        "content": [
            {"order": 1, "videoId": "how-digital-gold-works", "title": "How Digital Gold Works", "videoUrl": "https://www.youtube.com/watch?v=example1"},
            {"order": 2, "videoId": "benefits-of-gold-investment", "title": "Benefits of Gold Investment", "videoUrl": "https://www.youtube.com/watch?v=example2"},
            {"order": 3, "videoId": "safe-secure", "title": "Safe & Secure Investment", "videoUrl": "https://www.youtube.com/watch?v=example3"}
        ]
    },
    "promoBanners": {
        "enabled": true,
        "content": [
            {"order": 1, "backgroundColor": "linear-gradient(135deg, #FFD700 0%, #FFA500 100%)", "title": "Festive Offer", "highlightedText": "Get 50% off", "subtitle": "on first purchase above ₹10,000", "ctaText": "Claim Now"},
            {"order": 2, "backgroundColor": "linear-gradient(135deg, #1A237E 0%, #0D47A1 100%)", "title": "Gold SIP", "highlightedText": "Start from ₹100/month", "subtitle": "Build your gold portfolio gradually", "ctaText": "Start SIP"}
        ]
    },
    "keyHighlightsConfig": {
        "holdingsLabel": "Your Holdings",
        "badgeText": "24K Gold",
        "title": "Why Invest in Digital Gold?",
        "ctaText": "Know More",
        "highlights": [
            {"order": 1, "text": "100% Pure 24K Gold"},
            {"order": 2, "text": "Secure Vault Storage"},
            {"order": 3, "text": "Free Insurance Coverage"},
            {"order": 4, "text": "Instant Buy & Sell"},
            {"order": 5, "text": "Delivery to Your Doorstep"}
        ]
    },
    "transactionsEmptyStateConfig": {
        "ctaText": "Start Investing",
        "bannerHighlight": "No transactions yet",
        "bannerDescription": "Start your digital gold investment journey today"
    },
    "referralBannerAssets": {
        "treasureChestPath": "/assets/dashboard/treasure-chest.png",
        "goldCoinPath": "/assets/dashboard/gold-coin.png",
        "chevronPath": "/assets/dashboard/chevron-right.png"
    },
    "userSidebarAssets": {
        "iconProfilePath": "/assets/dashboard/gold-icon.png",
        "iconInfoPath": "/assets/dashboard/silver-icon.png"
    },
    "globalDisclaimer": {
        "anchorText": "Disclaimer",
        "content": "Investment in gold is subject to market risks. Past performance is not indicative of future results. Please read all scheme related documents carefully before investing."
    }
}'

# Gold Dashboard Page JSON
GOLD_JSON='{
    "subProduct": "gold",
    "partner": "Vodafone",
    "sectionTitleComparison": "Compare Gold Investment Options",
    "sectionSubtitleVideos": "Learn more about digital gold",
    "sectionTitleReferral": "Refer a Friend & Earn Gold",
    "livePriceDisclaimer": "Live gold prices updated every 5 minutes",
    "footerReferenceHeading": "Powered by",
    "footerReferenceName": "MMTC-PAMP",
    "footerReferenceCertification": "ISO 27001:2013 certified. 100% safe & secure. Your gold is fully insured.",
    "heroImagePath": "/assets/dashboard/gold-hero.png",
    "patternImagePath": "/assets/dashboard/pattern.png",
    "maskImagePath": "/assets/dashboard/mask.png",
    "transactionsEmptyImagePath": "/assets/dashboard/empty-transactions.png",
    "mmtcLogoPath": "/assets/logos/mmtc-pamp.png",
    "footerBarsImagePath": "/assets/dashboard/footer-bars.png",
    "headerLogoAlt": "ABCD Logo",
    "footerLogoAlt": "ABCD Logo",
    "actionCards": {
        "enabled": true,
        "content": [
            {"order": 1, "cardId": "buy-gold", "title": "Buy Gold", "subtitle": "Start investing from ₹50"},
            {"order": 2, "cardId": "sell-gold", "title": "Sell Gold", "subtitle": "Get instant money"},
            {"order": 3, "cardId": "gold-sip", "title": "Gold SIP", "subtitle": "Invest regularly"},
            {"order": 4, "cardId": "gift-gold", "title": "Gift Gold", "subtitle": "Gift to loved ones"}
        ]
    },
    "comparisonColumns": {
        "enabled": true,
        "content": [
            {"order": 1, "columnId": "digital-gold", "title": "Digital Gold", "isHighlighted": true},
            {"order": 2, "columnId": "physical-gold", "title": "Physical Gold", "isHighlighted": false},
            {"order": 3, "columnId": "gold-etf", "title": "Gold ETF", "isHighlighted": false}
        ]
    },
    "comparisonRows": {
        "enabled": true,
        "content": [
            {"order": 1, "rowId": "min-investment", "label": "Minimum Investment", "values": {"digital-gold": "₹50", "physical-gold": "₹5,000", "gold-etf": "₹500"}},
            {"order": 2, "rowId": "storage", "label": "Storage", "values": {"digital-gold": "Secure vault", "physical-gold": "You manage", "gold-etf": "Demat account"}},
            {"order": 3, "rowId": "liquidity", "label": "Liquidity", "values": {"digital-gold": "Instant", "physical-gold": "Moderate", "gold-etf": "T+2 days"}},
            {"order": 4, "rowId": "safety", "label": "Safety", "values": {"digital-gold": "100% insured", "physical-gold": "Self-insured", "gold-etf": "SEBI regulated"}},
            {"order": 5, "rowId": "making-charges", "label": "Making Charges", "values": {"digital-gold": "None", "physical-gold": "8-15%", "gold-etf": "0.5-1%"}}
        ]
    },
    "footerFeatures": {
        "enabled": true,
        "content": [
            {"order": 1, "text": "100% SAFE & SECURE"},
            {"order": 2, "text": "24K PURE GOLD"},
            {"order": 3, "text": "INSTANT LIQUIDITY"},
            {"order": 4, "text": "FREE INSURANCE"},
            {"order": 5, "text": "VERIFIED BY MMTC-PAMP"}
        ]
    },
    "sidebarFAQs": {
        "enabled": true,
        "content": [
            {"order": 1, "faqId": "what-is-digital-gold", "title": "What is Digital Gold?", "content": "Digital Gold allows you to buy, sell, and store gold in a demat form without physically holding it.", "isExternal": false},
            {"order": 2, "faqId": "how-to-buy", "title": "How to buy Digital Gold?", "content": "Simply choose the amount or weight of gold you wish to purchase, complete the payment.", "isExternal": false},
            {"order": 3, "faqId": "is-it-safe", "title": "Is my investment safe?", "content": "Yes, your digital gold is 100% insured and stored in secure vaults.", "isExternal": false},
            {"order": 4, "faqId": "sell-instantly", "title": "Can I sell instantly?", "content": "Yes, you can sell your digital gold instantly.", "isExternal": false},
            {"order": 5, "faqId": "delivery-option", "title": "Can I get physical gold delivered?", "content": "Yes, you can convert your digital gold to physical gold coins.", "isExternal": false}
        ]
    },
    "videos": {
        "enabled": true,
        "content": [
            {"order": 1, "videoId": "how-digital-gold-works", "title": "How Digital Gold Works", "videoUrl": "https://www.youtube.com/watch?v=example1"},
            {"order": 2, "videoId": "benefits-of-gold-investment", "title": "Benefits of Gold Investment", "videoUrl": "https://www.youtube.com/watch?v=example2"},
            {"order": 3, "videoId": "safe-secure", "title": "Safe & Secure Investment", "videoUrl": "https://www.youtube.com/watch?v=example3"}
        ]
    },
    "promoBanners": {
        "enabled": true,
        "content": [
            {"order": 1, "backgroundColor": "linear-gradient(135deg, #FFD700 0%, #FFA500 100%)", "title": "Festive Offer", "highlightedText": "Get 50% off", "subtitle": "on first purchase above ₹10,000", "ctaText": "Claim Now"},
            {"order": 2, "backgroundColor": "linear-gradient(135deg, #1A237E 0%, #0D47A1 100%)", "title": "Gold SIP", "highlightedText": "Start from ₹100/month", "subtitle": "Build your gold portfolio gradually", "ctaText": "Start SIP"}
        ]
    },
    "keyHighlightsConfig": {
        "holdingsLabel": "Your Holdings",
        "badgeText": "24K Gold",
        "title": "Why Invest in Digital Gold?",
        "ctaText": "Know More",
        "highlights": [
            {"order": 1, "text": "100% Pure 24K Gold"},
            {"order": 2, "text": "Secure Vault Storage"},
            {"order": 3, "text": "Free Insurance Coverage"},
            {"order": 4, "text": "Instant Buy & Sell"},
            {"order": 5, "text": "Delivery to Your Doorstep"}
        ]
    },
    "transactionsEmptyStateConfig": {
        "ctaText": "Start Investing",
        "bannerHighlight": "No transactions yet",
        "bannerDescription": "Start your digital gold investment journey today"
    },
    "referralBannerAssets": {
        "treasureChestPath": "/assets/dashboard/treasure-chest.png",
        "goldCoinPath": "/assets/dashboard/gold-coin.png",
        "chevronPath": "/assets/dashboard/chevron-right.png"
    },
    "userSidebarAssets": {
        "iconProfilePath": "/assets/dashboard/gold-icon.png",
        "iconInfoPath": "/assets/dashboard/silver-icon.png"
    },
    "globalDisclaimer": {
        "anchorText": "Disclaimer",
        "content": "Investment in gold is subject to market risks. Past performance is not indicative of future results. Please read all scheme related documents carefully before investing."
    }
}'

# Silver Dashboard Page JSON
SILVER_JSON='{
    "subProduct": "silver",
    "partner": "Vodafone",
    "sectionTitleComparison": "Compare Silver Investment Options",
    "sectionSubtitleVideos": "Learn more about digital silver",
    "sectionTitleReferral": "Refer a Friend & Earn Silver",
    "livePriceDisclaimer": "Live silver prices updated every 5 minutes",
    "footerReferenceHeading": "Powered by",
    "footerReferenceName": "MMTC-PAMP",
    "footerReferenceCertification": "ISO 27001:2013 certified. 100% safe & secure. Your silver is fully insured.",
    "heroImagePath": "/assets/dashboard/silver-hero.png",
    "patternImagePath": "/assets/dashboard/silver-pattern.png",
    "maskImagePath": "/assets/dashboard/silver-mask.png",
    "transactionsEmptyImagePath": "/assets/dashboard/silver-empty-transactions.png",
    "mmtcLogoPath": "/assets/logos/mmtc-pamp-silver.png",
    "footerBarsImagePath": "/assets/dashboard/footer-bars-silver.png",
    "headerLogoAlt": "ABCD Logo",
    "footerLogoAlt": "ABCD Logo",
    "actionCards": {
        "enabled": true,
        "content": [
            {"order": 1, "cardId": "buy-silver", "title": "Buy Silver", "subtitle": "Start investing from ₹50"},
            {"order": 2, "cardId": "sell-silver", "title": "Sell Silver", "subtitle": "Get instant money"},
            {"order": 3, "cardId": "silver-sip", "title": "Silver SIP", "subtitle": "Invest regularly"}
        ]
    },
    "comparisonColumns": {
        "enabled": true,
        "content": [
            {"order": 1, "columnId": "digital-silver", "title": "Digital Silver", "isHighlighted": true},
            {"order": 2, "columnId": "physical-silver", "title": "Physical Silver", "isHighlighted": false},
            {"order": 3, "columnId": "silver-etf", "title": "Silver ETF", "isHighlighted": false}
        ]
    },
    "comparisonRows": {
        "enabled": true,
        "content": [
            {"order": 1, "rowId": "min-investment", "label": "Minimum Investment", "values": {"digital-silver": "₹50", "physical-silver": "₹1,000", "silver-etf": "₹500"}},
            {"order": 2, "rowId": "storage", "label": "Storage", "values": {"digital-silver": "Secure vault", "physical-silver": "You manage", "silver-etf": "Demat account"}},
            {"order": 3, "rowId": "liquidity", "label": "Liquidity", "values": {"digital-silver": "Instant", "physical-silver": "Moderate", "silver-etf": "T+2 days"}},
            {"order": 4, "rowId": "purity", "label": "Purity", "values": {"digital-silver": "999", "physical-silver": "Varies", "silver-etf": "999"}}
        ]
    },
    "footerFeatures": {
        "enabled": true,
        "content": [
            {"order": 1, "text": "100% SAFE & SECURE"},
            {"order": 2, "text": "999 PURE SILVER"},
            {"order": 3, "text": "INSTANT LIQUIDITY"},
            {"order": 4, "text": "FREE INSURANCE"},
            {"order": 5, "text": "VERIFIED BY MMTC-PAMP"}
        ]
    },
    "sidebarFAQs": {
        "enabled": true,
        "content": [
            {"order": 1, "faqId": "what-is-digital-silver", "title": "What is Digital Silver?", "content": "Digital Silver allows you to buy, sell, and store silver in a demat form.", "isExternal": false},
            {"order": 2, "faqId": "how-to-buy-silver", "title": "How to buy Digital Silver?", "content": "Simply choose the amount or weight of silver you wish to purchase.", "isExternal": false},
            {"order": 3, "faqId": "is-silver-safe", "title": "Is my investment safe?", "content": "Yes, your digital silver is 100% insured and stored in secure vaults.", "isExternal": false}
        ]
    },
    "videos": {
        "enabled": true,
        "content": [
            {"order": 1, "videoId": "how-digital-silver-works", "title": "How Digital Silver Works", "videoUrl": "https://www.youtube.com/watch?v=silver1"}
        ]
    },
    "promoBanners": {
        "enabled": true,
        "content": [
            {"order": 1, "backgroundColor": "linear-gradient(135deg, #C0C0C0 0%, #808080 100%)", "title": "Silver SIP", "highlightedText": "Start from ₹100/month", "subtitle": "Build your silver portfolio", "ctaText": "Start Now"}
        ]
    },
    "keyHighlightsConfig": {
        "holdingsLabel": "Your Holdings",
        "badgeText": "999 Silver",
        "title": "Why Invest in Digital Silver?",
        "ctaText": "Know More",
        "highlights": [
            {"order": 1, "text": "100% Pure 999 Silver"},
            {"order": 2, "text": "Secure Vault Storage"},
            {"order": 3, "text": "Free Insurance Coverage"},
            {"order": 4, "text": "Instant Buy & Sell"},
            {"order": 5, "text": "Affordable Investment"}
        ]
    },
    "transactionsEmptyStateConfig": {
        "ctaText": "Start Investing",
        "bannerHighlight": "No transactions yet",
        "bannerDescription": "Start your digital silver investment journey today"
    },
    "referralBannerAssets": {
        "treasureChestPath": "/assets/dashboard/silver-treasure-chest.png",
        "goldCoinPath": "/assets/dashboard/silver-bar.png",
        "chevronPath": "/assets/dashboard/chevron-right.png"
    },
    "userSidebarAssets": {
        "iconProfilePath": "/assets/dashboard/silver-icon-profile.png",
        "iconInfoPath": "/assets/dashboard/silver-icon-info.png"
    },
    "globalDisclaimer": {
        "anchorText": "Disclaimer",
        "content": "Investment in silver is subject to market risks. Past performance is not indicative of future results."
    }
}'

# Clean up all existing entries first
cleanup_all

# Seed entries
seed_dashboard_page "default" "$DEFAULT_JSON"
seed_dashboard_page "gold" "$GOLD_JSON"
seed_dashboard_page "silver" "$SILVER_JSON"

echo ""
echo "==========================================="
echo "Seeding completed!"
echo "==========================================="

# Verify entries
echo ""
echo "Verifying seeded entries..."
total=$(curl -s "$BASE_URL/api/$SEED_TYPE" | grep -o '"total":[0-9]*' | grep -o '[0-9]*')
echo "Total entries: $total"

# List entries by partner
default_count=$(curl -s "$BASE_URL/api/$SEED_TYPE" | grep -o '"partner":"default"' | wc -l)
vodafone_count=$(curl -s "$BASE_URL/api/$SEED_TYPE" | grep -o '"partner":"Vodafone"' | wc -l)
echo "Partner 'default' entries: $default_count"
echo "Partner 'Vodafone' entries: $vodafone_count"

gold_sub=$(curl -s "$BASE_URL/api/$SEED_TYPE" | grep -o '"subProduct":"gold"' | wc -l)
silver_sub=$(curl -s "$BASE_URL/api/$SEED_TYPE" | grep -o '"subProduct":"silver"' | wc -l)
echo "SubProduct 'gold': $gold_sub"
echo "SubProduct 'silver': $silver_sub"

echo ""
echo "Done!"
