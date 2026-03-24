# DigiMetal Dashboard Page - CMS API Documentation

---

## Table of Contents

1. [Overview](#overview)
2. [API Endpoint](#api-endpoint)
3. [Content Type Schema](#content-type-schema)
4. [Components](#components)
   - [Section Wrapper Pattern](#section-wrapper-pattern)
   - [Action Card](#action-card)
   - [Comparison Column](#comparison-column)
   - [Comparison Row](#comparison-row)
   - [Footer Feature](#footer-feature)
   - [Sidebar FAQ](#sidebar-faq)
   - [Video Item](#video-item)
   - [Promo Banner](#promo-banner)
   - [Key Highlights Config](#key-highlights-config)
   - [Key Highlight](#key-highlight)
   - [Transactions Empty Config](#transactions-empty-config)
   - [Referral Banner Assets](#referral-banner-assets)
   - [User Sidebar Assets](#user-sidebar-assets)
5. [Sample Entry (Seed Data)](#sample-entry-seed-data)
6. [Sample API Response](#sample-api-response)
7. [Component Hierarchy](#component-hierarchy)

---

## Overview

The DigiMetal Dashboard Page is a **collection type** for managing dashboard content including user holdings, action cards, comparison tables, videos, FAQs, and promotional banners.

**API Identifier:** `api::digimetal-dashboard-page.digimetal-dashboard-page`

**Location:** `/src/api/digimetal-dashboard-page/`

---

## API Endpoint

```
GET /api/digimetal-dashboard-pages?filters[subProduct][$eq]={gold|silver}&populate=*
```

### curl Example

```bash
curl -s \
  -H "Authorization: Bearer $STRAPI_API_TOKEN" \
  'http://localhost:1337/api/digimetal-dashboard-pages?filters[subProduct][$eq]=gold&populate=*'
```

---

## Content Type Schema

**Location:** `/src/api/digimetal-dashboard-page/content-types/digimetal-dashboard-page/schema.json`

```json
{
  "kind": "collectionType",
  "collectionName": "digimetal_dashboard_pages",
  "info": {
    "singularName": "digimetal-dashboard-page",
    "pluralName": "digimetal-dashboard-pages",
    "displayName": "DigiMetal - Dashboard Page",
    "description": "Dashboard page content for DigiMetal products"
  },
  "options": {
    "draftAndPublish": true
  },
  "attributes": {
    "subProduct": {
      "type": "enumeration",
      "enum": ["gold", "silver"],
      "required": true
    },
    "sectionTitleComparison": { "type": "string" },
    "sectionSubtitleVideos": { "type": "string" },
    "sectionTitleReferral": { "type": "string" },
    "livePriceDisclaimer": { "type": "string" },
    "footerReferenceHeading": { "type": "string" },
    "footerReferenceName": { "type": "string" },
    "footerReferenceCertification": { "type": "text" },
    "heroImagePath": { "type": "string" },
    "patternImagePath": { "type": "string" },
    "maskImagePath": { "type": "string" },
    "transactionsEmptyImagePath": { "type": "string" },
    "mmtcLogoPath": { "type": "string" },
    "footerBarsImagePath": { "type": "string" },
    "actionCards": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.section-action-cards"
    },
    "comparisonColumns": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.section-comparison-columns"
    },
    "comparisonRows": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.section-comparison-rows"
    },
    "footerFeatures": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.section-footer-features"
    },
    "sidebarFAQs": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.section-sidebar-faqs"
    },
    "videos": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.section-videos"
    },
    "promoBanners": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.section-promo-banners"
    },
    "keyHighlightsConfig": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.key-highlights-config"
    },
    "transactionsEmptyStateConfig": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.transactions-empty-config"
    },
    "referralBannerAssets": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.referral-banner-assets"
    },
    "userSidebarAssets": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-dashboard.user-sidebar-assets"
    }
  }
}
```

### Main Attributes

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `subProduct` | enum | Yes | `gold` or `silver` |
| `sectionTitleComparison` | string | No | Comparison section title |
| `sectionSubtitleVideos` | string | No | Videos section subtitle |
| `sectionTitleReferral` | string | No | Referral section title |
| `livePriceDisclaimer` | string | No | Live price disclaimer |
| `footerReferenceHeading` | string | No | Footer heading |
| `footerReferenceName` | string | No | Footer name |
| `footerReferenceCertification` | text | No | Footer certification (multiline) |
| `heroImagePath` | string | No | Hero background image path |
| `patternImagePath` | string | No | Pattern tile image path |
| `maskImagePath` | string | No | Hero mask SVG path |
| `transactionsEmptyImagePath` | string | No | Empty state illustration path |
| `mmtcLogoPath` | string | No | MMTC-PAMP logo path |
| `footerBarsImagePath` | string | No | Footer bars image path |

---

## Components

**Location:** `/src/components/digimetal-dashboard/`

### Section Wrapper Pattern

All repeatable sections use a common wrapper with `enabled` flag and `content` array:

```json
{
  "collectionName": "components_digimetal_dashboard_section_*",
  "attributes": {
    "enabled": { "type": "boolean", "default": true },
    "content": {
      "type": "component",
      "repeatable": true,
      "component": "digimetal-dashboard.{item-type}"
    }
  }
}
```

---

### Action Card

**File:** `action-card.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `cardId` | string | Yes | Identifier: `buy`, `sip`, `gift`, `sell` |
| `title` | string | Yes | Card title |
| `subtitle` | string | No | Card subtitle |
| `image` | media | No | Card image |

```json
{
  "collectionName": "components_digimetal_dashboard_action_cards",
  "info": { "displayName": "Action Card", "icon": "grid" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "cardId": { "type": "string", "required": true },
    "title": { "type": "string", "required": true },
    "subtitle": { "type": "string" },
    "image": { "type": "media", "multiple": false, "allowedTypes": ["images"] }
  }
}
```

---

### Comparison Column

**File:** `comparison-column.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `columnId` | string | Yes | Column identifier |
| `title` | string | Yes | Column title |
| `isHighlighted` | boolean | No | Highlight this column |

```json
{
  "collectionName": "components_digimetal_dashboard_comparison_columns",
  "info": { "displayName": "Comparison Column", "icon": "layout" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "columnId": { "type": "string", "required": true },
    "title": { "type": "string", "required": true },
    "isHighlighted": { "type": "boolean", "default": false }
  }
}
```

---

### Comparison Row

**File:** `comparison-row.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `rowId` | string | Yes | Row identifier |
| `label` | string | Yes | Row label |
| `values` | json | Yes | Array of values (boolean or string) |

```json
{
  "collectionName": "components_digimetal_dashboard_comparison_rows",
  "info": { "displayName": "Comparison Row", "icon": "bulletList" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "rowId": { "type": "string", "required": true },
    "label": { "type": "string", "required": true },
    "values": { "type": "json", "required": true }
  }
}
```

---

### Footer Feature

**File:** `footer-feature.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `text` | string | Yes | Feature text |

```json
{
  "collectionName": "components_digimetal_dashboard_footer_features",
  "info": { "displayName": "Footer Feature", "icon": "check" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "text": { "type": "string", "required": true }
  }
}
```

---

### Sidebar FAQ

**File:** `sidebar-faq.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `faqId` | string | Yes | FAQ identifier |
| `title` | string | Yes | FAQ title |
| `icon` | media | No | FAQ icon |
| `content` | text | No | FAQ content (null if external) |
| `isExternal` | boolean | No | External link flag |
| `externalUrl` | string | No | External URL |

```json
{
  "collectionName": "components_digimetal_dashboard_sidebar_faqs",
  "info": { "displayName": "Sidebar FAQ", "icon": "question" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "faqId": { "type": "string", "required": true },
    "title": { "type": "string", "required": true },
    "icon": { "type": "media", "multiple": false, "allowedTypes": ["images"] },
    "content": { "type": "text" },
    "isExternal": { "type": "boolean", "default": false },
    "externalUrl": { "type": "string" }
  }
}
```

---

### Video Item

**File:** `video-item.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `videoId` | string | Yes | Video identifier |
| `title` | string | Yes | Video title |
| `thumbnail` | media | No | Video thumbnail |
| `videoUrl` | string | Yes | Video URL |

```json
{
  "collectionName": "components_digimetal_dashboard_video_items",
  "info": { "displayName": "Video Item", "icon": "play" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "videoId": { "type": "string", "required": true },
    "title": { "type": "string", "required": true },
    "thumbnail": { "type": "media", "multiple": false, "allowedTypes": ["images"] },
    "videoUrl": { "type": "string", "required": true }
  }
}
```

---

### Promo Banner

**File:** `promo-banner.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `backgroundColor` | string | Yes | CSS gradient/color |
| `title` | string | Yes | Banner title |
| `highlightedText` | string | No | Highlighted text |
| `subtitle` | string | No | Banner subtitle |
| `ctaText` | string | No | CTA button text |
| `leftImage` | media | No | Left decorative image |
| `rightImage` | media | No | Right decorative image |

```json
{
  "collectionName": "components_digimetal_dashboard_promo_banners",
  "info": { "displayName": "Promo Banner", "icon": "picture" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "backgroundColor": { "type": "string", "required": true },
    "title": { "type": "string", "required": true },
    "highlightedText": { "type": "string" },
    "subtitle": { "type": "string" },
    "ctaText": { "type": "string" },
    "leftImage": { "type": "media", "multiple": false, "allowedTypes": ["images"] },
    "rightImage": { "type": "media", "multiple": false, "allowedTypes": ["images"] }
  }
}
```

---

### Key Highlights Config

**File:** `key-highlights-config.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `holdingsLabel` | string | No | Holdings section label |
| `badgeText` | string | No | Badge text |
| `title` | string | No | Section title |
| `ctaText` | string | No | CTA button text |
| `highlights` | component[] | No | Key highlight items |

```json
{
  "collectionName": "components_digimetal_dashboard_key_highlights_configs",
  "info": { "displayName": "Key Highlights Config", "icon": "star" },
  "attributes": {
    "holdingsLabel": { "type": "string" },
    "badgeText": { "type": "string" },
    "title": { "type": "string" },
    "ctaText": { "type": "string" },
    "highlights": {
      "type": "component",
      "repeatable": true,
      "component": "digimetal-dashboard.key-highlight"
    }
  }
}
```

---

### Key Highlight

**File:** `key-highlight.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `text` | string | Yes | Highlight text |

```json
{
  "collectionName": "components_digimetal_dashboard_key_highlights",
  "info": { "displayName": "Key Highlight", "icon": "check" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "text": { "type": "string", "required": true }
  }
}
```

---

### Transactions Empty Config

**File:** `transactions-empty-config.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `ctaText` | string | No | CTA button text |
| `bannerHighlight` | string | No | Banner highlight text |
| `bannerDescription` | string | No | Banner description |

```json
{
  "collectionName": "components_digimetal_dashboard_transactions_empty_configs",
  "info": { "displayName": "Transactions Empty Config", "icon": "file" },
  "attributes": {
    "ctaText": { "type": "string" },
    "bannerHighlight": { "type": "string" },
    "bannerDescription": { "type": "string" }
  }
}
```

---

### Referral Banner Assets

**File:** `referral-banner-assets.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `treasureChestPath` | string | No | Treasure chest image path |
| `goldCoinPath` | string | No | Gold/silver coin image path |
| `chevronPath` | string | No | Double chevron icon path |

```json
{
  "collectionName": "components_digimetal_dashboard_referral_banner_assets",
  "info": { "displayName": "Referral Banner Assets", "icon": "picture" },
  "attributes": {
    "treasureChestPath": { "type": "string" },
    "goldCoinPath": { "type": "string" },
    "chevronPath": { "type": "string" }
  }
}
```

---

### User Sidebar Assets

**File:** `user-sidebar-assets.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `iconProfilePath` | string | No | Profile icon path |
| `iconInfoPath` | string | No | Info icon path |
| `iconLogoutPath` | string | No | Logout icon path |
| `logoFooterPath` | string | No | Footer logo path |
| `logoutIllustrationPath` | string | No | Logout illustration path |
| `otpIllustrationPath` | string | No | OTP illustration path |

```json
{
  "collectionName": "components_digimetal_dashboard_user_sidebar_assets",
  "info": { "displayName": "User Sidebar Assets", "icon": "user" },
  "attributes": {
    "iconProfilePath": { "type": "string" },
    "iconInfoPath": { "type": "string" },
    "iconLogoutPath": { "type": "string" },
    "logoFooterPath": { "type": "string" },
    "logoutIllustrationPath": { "type": "string" },
    "otpIllustrationPath": { "type": "string" }
  }
}
```

---

## Sample Entry (Seed Data)

**Location:** `seed/digimetal/dashboard-page/gold.json`

```json
{
  "subProduct": "gold",
  "sectionTitleComparison": "Why Choose Digital Gold",
  "sectionSubtitleVideos": "Investing in gold has never been simpler",
  "sectionTitleReferral": "Help friends start their gold journey",
  "livePriceDisclaimer": "Live gold prices",
  "footerReferenceHeading": "Powered by",
  "footerReferenceName": "ABCD",
  "footerReferenceCertification": "Aditya Birla\nCapital Digital Ltd.",
  "heroImagePath": "/assets/dashboard/hero-gold-bars-new.png",
  "patternImagePath": "/assets/dashboard/floral-pattern-tile.png",
  "maskImagePath": "/assets/dashboard/hero-cloud-mask.svg",
  "transactionsEmptyImagePath": "/assets/transactions/no-transactions-illustration.png",
  "mmtcLogoPath": "/assets/landing/mmtc-pamp-logo-figma.png",
  "footerBarsImagePath": "/assets/landing/footer-gold-bars.png",
  "actionCards": {
    "enabled": true,
    "content": [
      { "order": 1, "cardId": "buy", "title": "Buy Gold", "subtitle": "Starting from Rs.10" },
      { "order": 2, "cardId": "sip", "title": "SIP in Gold", "subtitle": "Starting from Rs. 50/week" },
      { "order": 3, "cardId": "gift", "title": "Gift Gold", "subtitle": "Instant & Personal" },
      { "order": 4, "cardId": "sell", "title": "Sell Gold", "subtitle": "Instant & Personal" }
    ]
  },
  "comparisonColumns": {
    "enabled": true,
    "content": [
      { "order": 1, "columnId": "digital", "title": "Digital Gold", "isHighlighted": true },
      { "order": 2, "columnId": "physical", "title": "Physical Gold", "isHighlighted": false },
      { "order": 3, "columnId": "etf", "title": "ETFs", "isHighlighted": false }
    ]
  },
  "comparisonRows": {
    "enabled": true,
    "content": [
      { "order": 1, "rowId": "ownership", "label": "Direct Ownership", "values": [true, true, true] },
      { "order": 2, "rowId": "trading", "label": "24/7 Trading", "values": [true, false, false] },
      { "order": 3, "rowId": "redemption", "label": "Physical Redemption", "values": [true, "Account Min ($800k)", false] },
      { "order": 4, "rowId": "ease", "label": "Ease of Use", "values": ["Immediate Funding", "Immediate Funding", "Pre-Fund & Wait"] },
      { "order": 5, "rowId": "liquidity", "label": "Instant Liquidity", "values": [true, false, false] },
      { "order": 6, "rowId": "charges", "label": "Making Charges", "values": ["No Making Charges", "8%-16%", "No Making Charges"] },
      { "order": 7, "rowId": "regulated", "label": "Regulated", "values": [false, false, true] }
    ]
  },
  "footerFeatures": {
    "enabled": true,
    "content": [
      { "order": 1, "text": "999.9+ Purest Gold(24K)" },
      { "order": 2, "text": "Finest Swiss Craftmanship" },
      { "order": 3, "text": "Positive Weight & Purity Tolerance" },
      { "order": 4, "text": "LBMA Good Delivery Refiner" }
    ]
  },
  "sidebarFAQs": {
    "enabled": true,
    "content": [
      { "order": 1, "faqId": "why-digital-gold", "title": "Why Digital Gold?", "content": "Digital Gold offers several advantages...", "isExternal": false },
      { "order": 2, "faqId": "calculate-sip", "title": "Calculate SIP", "content": "Gold SIP Calculator...", "isExternal": false },
      { "order": 3, "faqId": "how-it-works", "title": "How Digital gold works?", "content": "Simple 4-step process...", "isExternal": false },
      { "order": 4, "faqId": "other-questions", "title": "Other questions?", "content": null, "isExternal": true, "externalUrl": "https://help.abcd.com/digital-gold" }
    ]
  },
  "videos": {
    "enabled": true,
    "content": [
      { "order": 1, "videoId": "how-to-buy", "title": "How to Buy Gold?", "videoUrl": "https://youtube.com/watch?v=example1" },
      { "order": 2, "videoId": "investment", "title": "Gold Investment Guide", "videoUrl": "https://youtube.com/watch?v=example2" },
      { "order": 3, "videoId": "benefits", "title": "Why Digital Gold?", "videoUrl": "https://youtube.com/watch?v=example3" }
    ]
  },
  "promoBanners": {
    "enabled": true,
    "content": [
      { "order": 1, "backgroundColor": "linear-gradient(180deg, #fff4ce 32%, #f7a500 215%)", "title": "Unlock potential growth with", "highlightedText": "Gold SIP", "subtitle": "Starting from Rs.100", "ctaText": "Start SIP" },
      { "order": 2, "backgroundColor": "linear-gradient(180deg, #e8f5e9 32%, #81c784 215%)", "title": "Save smartly with", "highlightedText": "Daily Gold", "subtitle": "Starting from Rs.10/day", "ctaText": "Start Saving" }
    ]
  },
  "keyHighlightsConfig": {
    "holdingsLabel": "Gold Holdings",
    "badgeText": "Join 1L+ investors trusting ABCD for DigiGold.",
    "title": "Your Digital Gold",
    "ctaText": "Buy More Gold",
    "highlights": [
      { "order": 1, "text": "999.9 purity guaranteed" },
      { "order": 2, "text": "Stored in secure vaults" },
      { "order": 3, "text": "Instant liquidity" }
    ]
  },
  "transactionsEmptyStateConfig": {
    "ctaText": "Buy your first grams of gold",
    "bannerHighlight": "Gold",
    "bannerDescription": "Start your gold investment journey today"
  },
  "referralBannerAssets": {
    "treasureChestPath": "/assets/referral-banner/treasure-chest.png",
    "goldCoinPath": "/assets/referral-banner/gold-coin.png",
    "chevronPath": "/assets/referral-banner/double-chevron.png"
  },
  "userSidebarAssets": {
    "iconProfilePath": "/assets/sidebar/icon-profile.svg",
    "iconInfoPath": "/assets/sidebar/icon-info.svg",
    "iconLogoutPath": "/assets/sidebar/icon-logout.svg",
    "logoFooterPath": "/assets/sidebar/logo-abcd-footer.png",
    "logoutIllustrationPath": "/assets/sidebar/logout-illustration.png",
    "otpIllustrationPath": "/assets/profile/otp-illustration.png"
  }
}
```

---

## Sample API Response

```json
{
  "data": [
    {
      "id": 10,
      "documentId": "fpa37us0evyuq7a7blqf9zxv",
      "subProduct": "gold",
      "sectionTitleComparison": "Why Choose Digital Gold",
      "sectionSubtitleVideos": "Investing in gold has never been simpler",
      "sectionTitleReferral": "Help friends start their gold journey",
      "livePriceDisclaimer": "Live gold prices",
      "footerReferenceHeading": "Powered by",
      "footerReferenceName": "ABCD",
      "footerReferenceCertification": "Aditya Birla\nCapital Digital Ltd.",
      "heroImagePath": "/assets/dashboard/hero-gold-bars-new.png",
      "patternImagePath": "/assets/dashboard/floral-pattern-tile.png",
      "maskImagePath": "/assets/dashboard/hero-cloud-mask.svg",
      "transactionsEmptyImagePath": "/assets/transactions/no-transactions-illustration.png",
      "mmtcLogoPath": "/assets/landing/mmtc-pamp-logo-figma.png",
      "footerBarsImagePath": "/assets/landing/footer-gold-bars.png",
      "createdAt": "2026-02-15T10:26:08.195Z",
      "updatedAt": "2026-02-15T10:26:08.195Z",
      "publishedAt": "2026-02-15T10:26:08.212Z",
      "actionCards": {
        "id": 10,
        "enabled": true,
        "content": [
          { "order": 1, "id": 37, "cardId": "buy", "title": "Buy Gold", "subtitle": "Starting from Rs.10", "image": null },
          { "order": 2, "id": 38, "cardId": "sip", "title": "SIP in Gold", "subtitle": "Starting from Rs. 50/week", "image": null },
          { "order": 3, "id": 39, "cardId": "gift", "title": "Gift Gold", "subtitle": "Instant & Personal", "image": null },
          { "order": 4, "id": 40, "cardId": "sell", "title": "Sell Gold", "subtitle": "Instant & Personal", "image": null }
        ]
      },
      "comparisonColumns": {
        "id": 10,
        "enabled": true,
        "content": [
          { "order": 1, "id": 28, "columnId": "digital", "title": "Digital Gold", "isHighlighted": true },
          { "order": 2, "id": 29, "columnId": "physical", "title": "Physical Gold", "isHighlighted": false },
          { "order": 3, "id": 30, "columnId": "etf", "title": "ETFs", "isHighlighted": false }
        ]
      },
      "comparisonRows": {
        "id": 10,
        "enabled": true,
        "content": [
          { "order": 1, "id": 64, "rowId": "ownership", "label": "Direct Ownership", "values": [true, true, true] },
          { "order": 2, "id": 65, "rowId": "trading", "label": "24/7 Trading", "values": [true, false, false] },
          { "order": 3, "id": 66, "rowId": "redemption", "label": "Physical Redemption", "values": [true, "Account Min ($800k)", false] },
          { "order": 4, "id": 67, "rowId": "ease", "label": "Ease of Use", "values": ["Immediate Funding", "Immediate Funding", "Pre-Fund & Wait"] },
          { "order": 5, "id": 68, "rowId": "liquidity", "label": "Instant Liquidity", "values": [true, false, false] },
          { "order": 6, "id": 69, "rowId": "charges", "label": "Making Charges", "values": ["No Making Charges", "8%-16%", "No Making Charges"] },
          { "order": 7, "id": 70, "rowId": "regulated", "label": "Regulated", "values": [false, false, true] }
        ]
      },
      "keyHighlightsConfig": {
        "id": 10,
        "holdingsLabel": "Gold Holdings",
        "badgeText": "Join 1L+ investors trusting ABCD for DigiGold.",
        "title": "Your Digital Gold",
        "ctaText": "Buy More Gold",
        "highlights": [
          { "order": 1, "id": 28, "text": "999.9 purity guaranteed" },
          { "order": 2, "id": 29, "text": "Stored in secure vaults" },
          { "order": 3, "id": 30, "text": "Instant liquidity" }
        ]
      },
      "transactionsEmptyStateConfig": {
        "id": 10,
        "ctaText": "Buy your first grams of gold",
        "bannerHighlight": "Gold",
        "bannerDescription": "Start your gold investment journey today"
      },
      "referralBannerAssets": {
        "id": 10,
        "treasureChestPath": "/assets/referral-banner/treasure-chest.png",
        "goldCoinPath": "/assets/referral-banner/gold-coin.png",
        "chevronPath": "/assets/referral-banner/double-chevron.png"
      },
      "userSidebarAssets": {
        "id": 10,
        "iconProfilePath": "/assets/sidebar/icon-profile.svg",
        "iconInfoPath": "/assets/sidebar/icon-info.svg",
        "iconLogoutPath": "/assets/sidebar/icon-logout.svg",
        "logoFooterPath": "/assets/sidebar/logo-abcd-footer.png",
        "logoutIllustrationPath": "/assets/sidebar/logout-illustration.png",
        "otpIllustrationPath": "/assets/profile/otp-illustration.png"
      }
    }
  ],
  "meta": {
    "pagination": { "page": 1, "pageSize": 25, "pageCount": 1, "total": 1 }
  }
}
```

---

## Component Hierarchy

```
digimetal-dashboard-page (Collection)
├── subProduct: enum (gold, silver)
├── sectionTitleComparison: string
├── sectionSubtitleVideos: string
├── sectionTitleReferral: string
├── livePriceDisclaimer: string
├── footerReferenceHeading: string
├── footerReferenceName: string
├── footerReferenceCertification: text
├── heroImagePath: string
├── patternImagePath: string
├── maskImagePath: string
├── transactionsEmptyImagePath: string
├── mmtcLogoPath: string
├── footerBarsImagePath: string
├── actionCards: section-action-cards
│   ├── enabled: boolean
│   └── content[]: action-card
│       ├── order, cardId, title, subtitle, image
├── comparisonColumns: section-comparison-columns
│   ├── enabled: boolean
│   └── content[]: comparison-column
│       ├── order, columnId, title, isHighlighted
├── comparisonRows: section-comparison-rows
│   ├── enabled: boolean
│   └── content[]: comparison-row
│       ├── order, rowId, label, values
├── footerFeatures: section-footer-features
│   ├── enabled: boolean
│   └── content[]: footer-feature
│       ├── order, text
├── sidebarFAQs: section-sidebar-faqs
│   ├── enabled: boolean
│   └── content[]: sidebar-faq
│       ├── order, faqId, title, icon, content, isExternal, externalUrl
├── videos: section-videos
│   ├── enabled: boolean
│   └── content[]: video-item
│       ├── order, videoId, title, thumbnail, videoUrl
├── promoBanners: section-promo-banners
│   ├── enabled: boolean
│   └── content[]: promo-banner
│       ├── order, backgroundColor, title, highlightedText, subtitle, ctaText, leftImage, rightImage
├── keyHighlightsConfig: key-highlights-config
│   ├── holdingsLabel, badgeText, title, ctaText
│   └── highlights[]: key-highlight
│       ├── order, text
├── transactionsEmptyStateConfig: transactions-empty-config
│   ├── ctaText, bannerHighlight, bannerDescription
├── referralBannerAssets: referral-banner-assets
│   ├── treasureChestPath, goldCoinPath, chevronPath
└── userSidebarAssets: user-sidebar-assets
    ├── iconProfilePath, iconInfoPath, iconLogoutPath
    ├── logoFooterPath, logoutIllustrationPath, otpIllustrationPath
```
