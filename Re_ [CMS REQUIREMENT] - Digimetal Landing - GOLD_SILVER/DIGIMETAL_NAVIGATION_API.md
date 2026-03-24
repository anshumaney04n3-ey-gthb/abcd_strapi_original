# DigiMetal Navigation API Documentation

---

## Table of Contents

1. [Overview](#overview)
2. [API Endpoint](#api-endpoint)
3. [Content Type Schema](#content-type-schema)
4. [Components](#components)
   - [Nav Tab](#nav-tab)
   - [Nav Menu Item](#nav-menu-item)
   - [Nav Promo Banner](#nav-promo-banner)
   - [Nav Footer Banner](#nav-footer-banner)
   - [Mobile Footer Banner](#mobile-footer-banner)
5. [Sample Entry (Seed Data)](#sample-entry-seed-data)
6. [Sample API Response](#sample-api-response)
7. [Component Hierarchy](#component-hierarchy)
8. [Navigation Tabs Configuration](#navigation-tabs-configuration)

---

## Overview

The DigiMetal Navigation is a **collection type** for managing shared navigation configuration across desktop and mobile headers. It uses a unified `navTabs` array for both platforms.

**API Identifier:** `api::digimetal-navigation.digimetal-navigation`

**Location:** `/src/api/digimetal-navigation/`

---

## API Endpoint

```
GET /api/digimetal-navigations?filters[name][$eq]=default&populate[navTabs][populate]=*&populate[mobileFooterBanner][populate]=*
```

**Note:** Deep populate is required for nested components.

### curl Example

```bash
curl -s \
  -H "Authorization: Bearer $STRAPI_API_TOKEN" \
  'http://localhost:1337/api/digimetal-navigations?filters[name][$eq]=default&populate[navTabs][populate]=*&populate[mobileFooterBanner][populate]=*'
```

---

## Content Type Schema

**Location:** `/src/api/digimetal-navigation/content-types/digimetal-navigation/schema.json`

```json
{
  "kind": "collectionType",
  "collectionName": "digimetal_navigations",
  "info": {
    "singularName": "digimetal-navigation",
    "pluralName": "digimetal-navigations",
    "displayName": "DigiMetal - Navigation",
    "description": "Shared navigation configuration for desktop and mobile headers"
  },
  "options": {
    "draftAndPublish": true
  },
  "attributes": {
    "name": {
      "type": "string",
      "required": true,
      "unique": true
    },
    "headerLogoPath": {
      "type": "string",
      "required": false
    },
    "mobileHeaderLogoPath": {
      "type": "string",
      "required": false
    },
    "navTabs": {
      "type": "component",
      "repeatable": true,
      "component": "digimetal-navigation.nav-tab"
    },
    "mobileFooterBanner": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-navigation.mobile-footer-banner"
    }
  }
}
```

### Main Attributes

| Attribute | Type | Required | Unique | Description |
|-----------|------|----------|--------|-------------|
| `name` | string | Yes | Yes | Unique identifier (e.g., "default") |
| `headerLogoPath` | string | No | - | Path to desktop header logo |
| `mobileHeaderLogoPath` | string | No | - | Path to mobile header logo |
| `navTabs` | component[] | No | - | Navigation tabs array |
| `mobileFooterBanner` | component | No | - | Mobile footer banner config |

---

## Components

**Location:** `/src/components/digimetal-navigation/`

### Nav Tab

**File:** `nav-tab.json`

Navigation tab containing menu items, promo banners, and footer banner.

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `tabId` | string | Yes | Tab identifier (invest, insure, loans, my-track) |
| `label` | string | Yes | Display label |
| `menuItems` | component[] | No | Array of nav menu items |
| `promoBanners` | component[] | No | Array of promotional banners |
| `footerBanner` | component | No | Footer banner with QR code |

```json
{
  "collectionName": "components_digimetal_navigation_tabs",
  "info": {
    "displayName": "Nav Tab",
    "icon": "layer",
    "description": "Navigation tab with menu items and promo banners"
  },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "tabId": { "type": "string", "required": true },
    "label": { "type": "string", "required": true },
    "menuItems": {
      "type": "component",
      "repeatable": true,
      "component": "digimetal-navigation.nav-menu-item"
    },
    "promoBanners": {
      "type": "component",
      "repeatable": true,
      "component": "digimetal-navigation.nav-promo-banner"
    },
    "footerBanner": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-navigation.nav-footer-banner"
    }
  }
}
```

---

### Nav Menu Item

**File:** `nav-menu-item.json`

Individual navigation menu item with optional detail content panel.

| Attribute | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `order` | integer | Yes | - | Sort order |
| `itemId` | string | Yes | - | Item identifier |
| `title` | string | Yes | - | Display title |
| `description` | string | No | - | Short description |
| `icon` | media | No | - | Icon image (media upload) |
| `iconPath` | string | No | - | Icon path (static asset) |
| `navigateToUrl` | string | No | - | Navigation URL (external link) |
| `hasDetailContent` | boolean | No | false | Show detail panel instead of navigating |
| `detailTitle` | string | No | - | Detail panel title |
| `detailDescription` | string | No | - | Detail panel description |
| `detailBulletPoints` | json | No | - | Array of bullet point strings |
| `detailQrCodePath` | string | No | - | QR code image path |
| `detailQrCodeLabel` | string | No | - | QR code label text |
| `detailPromoImagePath` | string | No | - | Promotional image path |
| `detailBackgroundColor` | string | No | - | Background color (CSS) |

```json
{
  "collectionName": "components_digimetal_navigation_menu_items",
  "info": {
    "displayName": "Nav Menu Item",
    "icon": "link",
    "description": "Individual navigation menu item"
  },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "itemId": { "type": "string", "required": true },
    "title": { "type": "string", "required": true },
    "description": { "type": "string" },
    "icon": { "type": "media", "multiple": false, "allowedTypes": ["images"] },
    "iconPath": { "type": "string" },
    "navigateToUrl": { "type": "string" },
    "hasDetailContent": { "type": "boolean", "default": false },
    "detailTitle": { "type": "string" },
    "detailDescription": { "type": "string" },
    "detailBulletPoints": { "type": "json" },
    "detailQrCodePath": { "type": "string" },
    "detailQrCodeLabel": { "type": "string" },
    "detailPromoImagePath": { "type": "string" },
    "detailBackgroundColor": { "type": "string" }
  }
}
```

---

### Nav Promo Banner

**File:** `nav-promo-banner.json`

Promotional banner displayed in navigation dropdown.

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `backgroundColor` | string | Yes | Background color (CSS) |
| `preTitle` | string | No | Pre-title text (small caps) |
| `preTitleColor` | string | No | Pre-title color |
| `title` | string | Yes | Main title |
| `ctaText` | string | No | Call-to-action button text |
| `ctaUrl` | string | No | Call-to-action URL |
| `imagePath` | string | No | Banner image path |
| `imageAlt` | string | No | Image alt text |

```json
{
  "collectionName": "components_digimetal_navigation_promo_banners",
  "info": {
    "displayName": "Nav Promo Banner",
    "icon": "picture",
    "description": "Promotional banner in navigation"
  },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "backgroundColor": { "type": "string", "required": true },
    "preTitle": { "type": "string" },
    "preTitleColor": { "type": "string" },
    "title": { "type": "string", "required": true },
    "ctaText": { "type": "string" },
    "ctaUrl": { "type": "string" },
    "imagePath": { "type": "string" },
    "imageAlt": { "type": "string" }
  }
}
```

---

### Nav Footer Banner

**File:** `nav-footer-banner.json`

Footer banner with QR code displayed at bottom of navigation dropdown.

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `qrCodePath` | string | No | QR code image path |
| `text` | string | Yes | Banner text |
| `appStoreButtonsPath` | string | No | App store buttons image path |
| `appStoreButtonsAlt` | string | No | App store buttons alt text |

```json
{
  "collectionName": "components_digimetal_navigation_footer_banners",
  "info": {
    "displayName": "Nav Footer Banner",
    "icon": "apps",
    "description": "Footer banner with app store links"
  },
  "attributes": {
    "qrCodePath": { "type": "string" },
    "text": { "type": "string", "required": true },
    "appStoreButtonsPath": { "type": "string" },
    "appStoreButtonsAlt": { "type": "string" }
  }
}
```

---

### Mobile Footer Banner

**File:** `mobile-footer-banner.json`

Mobile-specific footer banner with separate app store buttons.

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `text` | string | Yes | Banner text |
| `appStoreIconPath` | string | No | App Store icon path |
| `appStoreLabel` | string | No | App Store button label |
| `appStoreUrl` | string | No | App Store URL |
| `playStoreIconPath` | string | No | Play Store icon path |
| `playStoreLabel` | string | No | Play Store button label |
| `playStoreUrl` | string | No | Play Store URL |

```json
{
  "collectionName": "components_digimetal_navigation_mobile_footer_banners",
  "info": {
    "displayName": "Mobile Footer Banner",
    "icon": "phone",
    "description": "Mobile navigation footer banner with app store buttons"
  },
  "attributes": {
    "text": { "type": "string", "required": true },
    "appStoreIconPath": { "type": "string" },
    "appStoreLabel": { "type": "string" },
    "appStoreUrl": { "type": "string" },
    "playStoreIconPath": { "type": "string" },
    "playStoreLabel": { "type": "string" },
    "playStoreUrl": { "type": "string" }
  }
}
```

---

## Sample Entry (Seed Data)

**Location:** `seed/digimetal/navigation/default.json`

```json
{
  "name": "default",
  "headerLogoPath": "/logos/lob/abcd.svg",
  "mobileHeaderLogoPath": "/logos/lob/abcd.svg",
  "navTabs": [
    {
      "order": 1,
      "tabId": "invest",
      "label": "Invest",
      "menuItems": [
        {
          "order": 1,
          "itemId": "mutual-funds",
          "title": "Mutual Funds",
          "description": "For long term wealth",
          "iconPath": "/assets/mobile-nav/icon-mutual-funds.png",
          "navigateToUrl": "https://www.adityabirlacapital.com/abcd/mutual-funds",
          "hasDetailContent": false
        },
        {
          "order": 2,
          "itemId": "digital-gold",
          "title": "Digital Gold",
          "description": "Buy 24K pure digital gold",
          "iconPath": "/assets/mobile-nav/icon-gold.png",
          "navigateToUrl": "https://www.adityabirlacapital.com/abcd/digital-gold",
          "hasDetailContent": false
        },
        {
          "order": 7,
          "itemId": "forex",
          "title": "Forex",
          "description": "Smart Forex solutions",
          "iconPath": "/assets/mobile-nav/icon-forex.png",
          "navigateToUrl": null,
          "hasDetailContent": true,
          "detailTitle": "Your Forex Journey Starts Here",
          "detailDescription": "Download the ABCD App for live rates & seamless trading.",
          "detailBulletPoints": [
            "Explore live rates and seamless currency exchange",
            "Track global trends and market movements",
            "Trade smarter with app-exclusive insights"
          ],
          "detailQrCodePath": "/assets/transaction-promo-banner/qrcode-abcd-app.webp",
          "detailQrCodeLabel": "Scan to get the ABCD app",
          "detailPromoImagePath": "/assets/nav-header/forex-phone-mockup.png",
          "detailBackgroundColor": "#fff4d9"
        }
      ],
      "promoBanners": [
        {
          "order": 1,
          "backgroundColor": "#fff4ce",
          "preTitle": "THE PROMISE THAT LASTS",
          "preTitleColor": "#845800",
          "title": "Secure your future with life insurance that protects what matters most",
          "ctaText": "Get Covered",
          "ctaUrl": "https://www.adityabirlacapital.com/insurance/life-insurance",
          "imagePath": "/assets/mobile-nav/promo-gold.png",
          "imageAlt": "Gold bars"
        },
        {
          "order": 2,
          "backgroundColor": "#e8f4fd",
          "preTitle": "DIGITAL GOLD",
          "preTitleColor": "#0056b3",
          "title": "Start your gold investment journey with as little as Rs.10",
          "ctaText": "Start Now",
          "ctaUrl": "https://www.adityabirlacapital.com/abcd/digital-gold",
          "imagePath": "/assets/mobile-nav/promo-gold.png",
          "imageAlt": "Gold coins"
        }
      ],
      "footerBanner": {
        "qrCodePath": "/assets/transaction-promo-banner/qrcode-abcd-app.webp",
        "text": "Scan here to start investing on the ABCD app",
        "appStoreButtonsPath": "/assets/nav-header/app-store-buttons.svg",
        "appStoreButtonsAlt": "App Store buttons"
      }
    },
    {
      "order": 2,
      "tabId": "insure",
      "label": "Insure",
      "menuItems": [],
      "promoBanners": [],
      "footerBanner": {}
    },
    {
      "order": 3,
      "tabId": "loans",
      "label": "Loans",
      "menuItems": [],
      "promoBanners": [],
      "footerBanner": {}
    },
    {
      "order": 4,
      "tabId": "my-track",
      "label": "My Track",
      "menuItems": [],
      "promoBanners": [],
      "footerBanner": {}
    }
  ],
  "mobileFooterBanner": {
    "text": "Manage your investments on the ABCD app",
    "appStoreIconPath": "/assets/mobile-nav/apple-store-icon.svg",
    "appStoreLabel": "App Store",
    "appStoreUrl": "https://apps.apple.com/in/app/abcd-one-app-for-all-needs/id1520780055",
    "playStoreIconPath": "/assets/mobile-nav/play-store-icon.svg",
    "playStoreLabel": "Play Store",
    "playStoreUrl": "https://play.google.com/store/apps/details?id=com.abcd.singleapp"
  }
}
```

---

## Sample API Response

```json
{
  "data": [
    {
      "id": 68,
      "documentId": "ag8759rpyijy2gqvak2e4gx5",
      "name": "default",
      "headerLogoPath": "/logos/lob/abcd.svg",
      "mobileHeaderLogoPath": "/logos/lob/abcd.svg",
      "createdAt": "2026-02-15T15:03:19.869Z",
      "updatedAt": "2026-02-15T15:03:19.869Z",
      "publishedAt": "2026-02-15T15:03:19.875Z",
      "navTabs": [
        {
          "order": 1,
          "id": 397,
          "tabId": "invest",
          "label": "Invest",
          "menuItems": [
            {
              "order": 1,
              "id": 2006,
              "itemId": "mutual-funds",
              "title": "Mutual Funds",
              "description": "For long term wealth",
              "iconPath": "/assets/mobile-nav/icon-mutual-funds.png",
              "navigateToUrl": "https://www.adityabirlacapital.com/abcd/mutual-funds",
              "hasDetailContent": false,
              "detailTitle": null,
              "detailDescription": null,
              "detailBulletPoints": null,
              "detailQrCodePath": null,
              "detailQrCodeLabel": null,
              "detailPromoImagePath": null,
              "detailBackgroundColor": null
            },
            {
              "order": 7,
              "id": 2012,
              "itemId": "forex",
              "title": "Forex",
              "description": "Smart Forex solutions",
              "iconPath": "/assets/mobile-nav/icon-forex.png",
              "navigateToUrl": null,
              "hasDetailContent": true,
              "detailTitle": "Your Forex Journey Starts Here",
              "detailDescription": "Download the ABCD App for live rates & seamless trading.",
              "detailBulletPoints": [
                "Explore live rates and seamless currency exchange",
                "Track global trends and market movements",
                "Trade smarter with app-exclusive insights"
              ],
              "detailQrCodePath": "/assets/transaction-promo-banner/qrcode-abcd-app.webp",
              "detailQrCodeLabel": "Scan to get the ABCD app",
              "detailPromoImagePath": "/assets/nav-header/forex-phone-mockup.png",
              "detailBackgroundColor": "#fff4d9"
            }
          ],
          "promoBanners": [
            {
              "order": 1,
              "id": 1013,
              "backgroundColor": "#fff4ce",
              "preTitle": "THE PROMISE THAT LASTS",
              "preTitleColor": "#845800",
              "title": "Secure your future with life insurance that protects what matters most",
              "ctaText": "Get Covered",
              "ctaUrl": "https://www.adityabirlacapital.com/insurance/life-insurance",
              "imagePath": "/assets/mobile-nav/promo-gold.png",
              "imageAlt": "Gold bars"
            }
          ],
          "footerBanner": {
            "id": 253,
            "qrCodePath": "/assets/transaction-promo-banner/qrcode-abcd-app.webp",
            "text": "Scan here to start investing on the ABCD app",
            "appStoreButtonsPath": "/assets/nav-header/app-store-buttons.svg",
            "appStoreButtonsAlt": "App Store buttons"
          }
        },
        {
          "order": 2,
          "tabId": "insure",
          "label": "Insure",
          "menuItems": ["..."],
          "promoBanners": ["..."],
          "footerBanner": {}
        },
        {
          "order": 3,
          "tabId": "loans",
          "label": "Loans",
          "menuItems": ["..."],
          "promoBanners": ["..."],
          "footerBanner": {}
        },
        {
          "order": 4,
          "tabId": "my-track",
          "label": "My Track",
          "menuItems": ["..."],
          "promoBanners": ["..."],
          "footerBanner": {}
        }
      ],
      "mobileFooterBanner": {
        "id": 68,
        "text": "Manage your investments on the ABCD app",
        "appStoreIconPath": "/assets/mobile-nav/apple-store-icon.svg",
        "appStoreLabel": "App Store",
        "appStoreUrl": "https://apps.apple.com/in/app/abcd-one-app-for-all-needs/id1520780055",
        "playStoreIconPath": "/assets/mobile-nav/play-store-icon.svg",
        "playStoreLabel": "Play Store",
        "playStoreUrl": "https://play.google.com/store/apps/details?id=com.abcd.singleapp"
      }
    }
  ],
  "meta": {
    "pagination": {
      "page": 1,
      "pageSize": 25,
      "pageCount": 1,
      "total": 1
    }
  }
}
```

---

## Component Hierarchy

```
digimetal-navigation (Collection)
├── name: string (unique, e.g., "default")
├── headerLogoPath: string
├── mobileHeaderLogoPath: string
├── navTabs[]: nav-tab
│   ├── order: integer
│   ├── tabId: string
│   ├── label: string
│   ├── menuItems[]: nav-menu-item
│   │   ├── order, itemId, title, description
│   │   ├── iconPath, navigateToUrl
│   │   └── hasDetailContent, detailTitle, detailDescription, detailBulletPoints, detailQrCodePath, detailQrCodeLabel, detailPromoImagePath, detailBackgroundColor
│   ├── promoBanners[]: nav-promo-banner
│   │   ├── order, backgroundColor, preTitle, preTitleColor
│   │   ├── title, ctaText, ctaUrl
│   │   └── imagePath, imageAlt
│   └── footerBanner: nav-footer-banner
│       └── qrCodePath, text, appStoreButtonsPath, appStoreButtonsAlt
└── mobileFooterBanner: mobile-footer-banner
    └── text, appStoreIconPath, appStoreLabel, appStoreUrl, playStoreIconPath, playStoreLabel, playStoreUrl
```

---

## Navigation Tabs Configuration

| Tab ID | Label | Menu Items | Description |
|--------|-------|------------|-------------|
| `invest` | Invest | 8 | Mutual Funds, Digital Gold, Digital Silver, Stocks, Tax, NPS, Forex, Fixed Deposits |
| `insure` | Insure | 5 | Motor, Health, Travel, Pocket, Life Insurance |
| `loans` | Loans | 5 | Home Loan, Personal Loan, Credit Cards, Business Loan, Gold Loan |
| `my-track` | My Track | 5 | Credit Track, Portfolio Track, Health Track, Spend Track, Vehicle Track |
