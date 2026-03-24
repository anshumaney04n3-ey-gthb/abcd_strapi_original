# DigiMetal Journey Page API Documentation

---

## Table of Contents

1. [Overview](#overview)
2. [API Endpoint](#api-endpoint)
3. [Content Type Schema](#content-type-schema)
4. [Components](#components)
   - [Operation Config](#operation-config)
   - [Page - Collect Transaction](#page---collect-transaction)
   - [Page - PAN Verification](#page---pan-verification)
   - [Page - Name Confirmation](#page---name-confirmation)
   - [Page - Transaction Summary](#page---transaction-summary)
   - [Page - Thank You](#page---thank-you)
   - [Page - Payment Failure](#page---payment-failure)
   - [Section Amount Chips](#section-amount-chips)
   - [Amount Chip](#amount-chip)
   - [Journey Assets](#journey-assets)
5. [Sample Entry (Seed Data)](#sample-entry-seed-data)
6. [Sample API Response](#sample-api-response)
7. [Component Hierarchy](#component-hierarchy)

---

## Overview

The DigiMetal Journey Page is a **collection type** using a consolidated structure where one entry per subProduct contains all operation-specific page configurations. Currently only the **buy** operation is implemented.

**API Identifier:** `api::digimetal-journey-page.digimetal-journey-page`

**Location:** `/src/api/digimetal-journey-page/`

---

## API Endpoint

```
GET /api/digimetal-journey-pages?filters[subProduct][$eq]={gold|silver}&populate=*
```

### curl Example

```bash
curl -s \
  -H "Authorization: Bearer $STRAPI_API_TOKEN" \
  'http://localhost:1337/api/digimetal-journey-pages?filters[subProduct][$eq]=gold&populate=*'
```

---

## Content Type Schema

**Location:** `/src/api/digimetal-journey-page/content-types/digimetal-journey-page/schema.json`

```json
{
  "kind": "collectionType",
  "collectionName": "digimetal_journey_pages",
  "info": {
    "singularName": "digimetal-journey-page",
    "pluralName": "digimetal-journey-pages",
    "displayName": "DigiMetal - Journey Page",
    "description": "Journey flow pages for DigiMetal products"
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
    "buy": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.operation-config"
    },
    "sell": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.operation-config"
    },
    "sip": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.operation-config"
    },
    "gift": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.operation-config"
    },
    "assets": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.journey-assets"
    }
  }
}
```

### Main Attributes

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `subProduct` | enum | Yes | `gold` or `silver` |
| `buy` | component | No | Buy operation config |
| `sell` | component | No | Sell operation config (future) |
| `sip` | component | No | SIP operation config (future) |
| `gift` | component | No | Gift operation config (future) |
| `assets` | component | No | Shared media assets |

---

## Components

**Location:** `/src/components/digimetal-journey/`

### Operation Config

**File:** `operation-config.json`

Contains all page configurations for an operation.

| Attribute | Type | Description |
|-----------|------|-------------|
| `collectTransactionDetails` | component | Collect Transaction page |
| `panVerification` | component | PAN Verification page |
| `nameConfirmation` | component | Name Confirmation page |
| `transactionSummary` | component | Transaction Summary page |
| `thankYou` | component | Thank You (success) page |
| `paymentFailure` | component | Payment Failure page |

```json
{
  "collectionName": "components_digimetal_journey_operation_configs",
  "info": { "displayName": "Operation Config", "icon": "apps" },
  "attributes": {
    "collectTransactionDetails": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.page-collect-transaction"
    },
    "panVerification": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.page-pan-verification"
    },
    "nameConfirmation": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.page-name-confirmation"
    },
    "transactionSummary": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.page-transaction-summary"
    },
    "thankYou": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.page-thank-you"
    },
    "paymentFailure": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.page-payment-failure"
    }
  }
}
```

---

### Page - Collect Transaction

**File:** `page-collect-transaction.json`

| Attribute | Type | Required | Default |
|-----------|------|----------|---------|
| `title` | string | No | "Buy Gold" |
| `submitButtonText` | string | No | "Proceed to pay" |
| `secondaryLinkText` | string | No | - |
| `helpAriaLabel` | string | No | - |
| `inputSectionTitle` | string | No | "How much gold do you want to buy" |
| `infoBannerText` | string | No | "A 72 hour waiting period..." |
| `purityBadgeText` | string | No | "24K 999.9 Pure Gold" |
| `goldPurity` | string | No | "24K" |
| `refreshTimeSeconds` | integer | No | 290 |
| `minAmount` | integer | No | 10 |
| `maxAmount` | integer | No | 500000 |
| `minWeight` | decimal | No | 0.001 |
| `maxWeight` | decimal | No | 50 |
| `amountChips` | component | No | Amount chip options |
| `weightChips` | component | No | Weight chip options |

```json
{
  "collectionName": "components_digimetal_journey_page_collect_transactions",
  "info": { "displayName": "Page - Collect Transaction", "icon": "shoppingCart" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "inputSectionTitle": { "type": "string" },
    "infoBannerText": { "type": "string" },
    "purityBadgeText": { "type": "string" },
    "goldPurity": { "type": "string" },
    "refreshTimeSeconds": { "type": "integer", "default": 290 },
    "minAmount": { "type": "integer", "default": 10 },
    "maxAmount": { "type": "integer", "default": 500000 },
    "minWeight": { "type": "decimal", "default": 0.001 },
    "maxWeight": { "type": "decimal", "default": 50 },
    "amountChips": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.section-amount-chips"
    },
    "weightChips": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.section-weight-chips"
    }
  }
}
```

---

### Page - PAN Verification

**File:** `page-pan-verification.json`

| Attribute | Type | Required | Default |
|-----------|------|----------|---------|
| `title` | string | No | "PAN Verification" |
| `submitButtonText` | string | No | "Verify & Proceed" |
| `secondaryLinkText` | string | No | - |
| `helpAriaLabel` | string | No | - |
| `panFieldLabel` | string | No | "PAN Number" |
| `panFieldPlaceholder` | string | No | "e.g: ABCDE1234Z" |
| `nameFieldLabel` | string | No | "Name as per PAN" |
| `nameFieldPlaceholder` | string | No | "Enter name as per PAN" |
| `dobFieldLabel` | string | No | "Date of Birth" |
| `dobFieldPlaceholder` | string | No | "DD/MM/YYYY" |
| `noteText` | string | No | - |
| `termsPreText` | string | No | "By proceeding, you agree to our" |
| `termsLinkText` | string | No | "Terms & Conditions" |
| `termsLinkHref` | string | No | URL |

```json
{
  "collectionName": "components_digimetal_journey_page_pan_verifications",
  "info": { "displayName": "Page - PAN Verification", "icon": "user" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "panFieldLabel": { "type": "string" },
    "panFieldPlaceholder": { "type": "string" },
    "nameFieldLabel": { "type": "string" },
    "nameFieldPlaceholder": { "type": "string" },
    "dobFieldLabel": { "type": "string" },
    "dobFieldPlaceholder": { "type": "string" },
    "noteText": { "type": "string" },
    "termsPreText": { "type": "string" },
    "termsLinkText": { "type": "string" },
    "termsLinkHref": { "type": "string" }
  }
}
```

---

### Page - Name Confirmation

**File:** `page-name-confirmation.json`

| Attribute | Type | Required | Default |
|-----------|------|----------|---------|
| `title` | string | No | "Name Confirmation" |
| `submitButtonText` | string | No | "Confirm & Proceed" |
| `secondaryLinkText` | string | No | - |
| `helpAriaLabel` | string | No | - |
| `nameFieldLabel` | string | No | "Name as per PAN" |
| `instructionText` | string | No | - |

```json
{
  "collectionName": "components_digimetal_journey_page_name_confirmations",
  "info": { "displayName": "Page - Name Confirmation", "icon": "check" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "nameFieldLabel": { "type": "string" },
    "instructionText": { "type": "string" }
  }
}
```

---

### Page - Transaction Summary

**File:** `page-transaction-summary.json`

| Attribute | Type | Required | Default |
|-----------|------|----------|---------|
| `title` | string | No | "Order Summary" |
| `submitButtonText` | string | No | "Proceed to Pay" |
| `secondaryLinkText` | string | No | - |
| `helpAriaLabel` | string | No | - |
| `summaryTitle` | string | No | "Summary of your one-time investment" |
| `totalLabel` | string | No | "Total payable amount" |
| `gstLabel` | string | No | "GST (3%)" |
| `goldAmountLabel` | string | No | "Gold Amount" |
| `termsPreText` | string | No | - |
| `termsLinkText` | string | No | "Terms & Conditions" |
| `termsLinkHref` | string | No | URL |

```json
{
  "collectionName": "components_digimetal_journey_page_transaction_summaries",
  "info": { "displayName": "Page - Transaction Summary", "icon": "file" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "summaryTitle": { "type": "string" },
    "totalLabel": { "type": "string" },
    "gstLabel": { "type": "string" },
    "goldAmountLabel": { "type": "string" },
    "termsPreText": { "type": "string" },
    "termsLinkText": { "type": "string" },
    "termsLinkHref": { "type": "string" }
  }
}
```

---

### Page - Thank You

**File:** `page-thank-you.json`

| Attribute | Type | Required | Default |
|-----------|------|----------|---------|
| `title` | string | No | "Transaction Success" |
| `submitButtonText` | string | No | "Send Invoice" |
| `secondaryLinkText` | string | No | - |
| `helpAriaLabel` | string | No | - |
| `heading` | string | No | "Congratulations!" |
| `messagePrefix` | string | No | "You just bought" |
| `messageSuffix` | string | No | "of 24K Gold" |

```json
{
  "collectionName": "components_digimetal_journey_page_thank_yous",
  "info": { "displayName": "Page - Thank You", "icon": "check" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "heading": { "type": "string" },
    "messagePrefix": { "type": "string" },
    "messageSuffix": { "type": "string" }
  }
}
```

---

### Page - Payment Failure

**File:** `page-payment-failure.json`

| Attribute | Type | Required | Default |
|-----------|------|----------|---------|
| `title` | string | No | "Payment Failed" |
| `submitButtonText` | string | No | "Retry Payment" |
| `secondaryLinkText` | string | No | - |
| `helpAriaLabel` | string | No | - |
| `heading` | string | No | "Payment Failed" |
| `description` | string | No | "We couldn't process your payment..." |

```json
{
  "collectionName": "components_digimetal_journey_page_payment_failures",
  "info": { "displayName": "Page - Payment Failure", "icon": "cross" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "heading": { "type": "string" },
    "description": { "type": "string" }
  }
}
```

---

### Section Amount Chips

**File:** `section-amount-chips.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `enabled` | boolean | No | Enable/disable section |
| `content` | component[] | No | Array of amount chips |

```json
{
  "collectionName": "components_digimetal_journey_section_amount_chips",
  "info": { "displayName": "Section - Amount Chips", "icon": "grid" },
  "attributes": {
    "enabled": { "type": "boolean", "default": true },
    "content": {
      "type": "component",
      "repeatable": true,
      "component": "digimetal-journey.amount-chip"
    }
  }
}
```

---

### Amount Chip

**File:** `amount-chip.json`

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `order` | integer | Yes | Sort order |
| `value` | string | Yes | Chip value (e.g., "2000", "0.5") |
| `isPopular` | boolean | No | Mark as popular |

```json
{
  "collectionName": "components_digimetal_journey_amount_chips",
  "info": { "displayName": "Amount Chip", "icon": "priceTag" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "value": { "type": "string", "required": true },
    "isPopular": { "type": "boolean", "default": false }
  }
}
```

---

### Journey Assets

**File:** `journey-assets.json`

Shared media assets across all operations.

| Attribute | Type | Description |
|-----------|------|-------------|
| `successIllustration` | media | Success page illustration |
| `failureIllustration` | media | Failure page illustration |
| `promoBannerLogo` | media | Promo banner logo |
| `promoBannerQrCode` | media | Promo banner QR code |

```json
{
  "collectionName": "components_digimetal_journey_journey_assets",
  "info": { "displayName": "Journey Assets", "icon": "picture" },
  "attributes": {
    "successIllustration": { "type": "media", "multiple": false, "allowedTypes": ["images"] },
    "failureIllustration": { "type": "media", "multiple": false, "allowedTypes": ["images"] },
    "promoBannerLogo": { "type": "media", "multiple": false, "allowedTypes": ["images"] },
    "promoBannerQrCode": { "type": "media", "multiple": false, "allowedTypes": ["images"] }
  }
}
```

---

## Sample Entry (Seed Data)

**Location:** `seed/digimetal/journey-page/gold.json`

```json
{
  "subProduct": "gold",
  "buy": {
    "collectTransactionDetails": {
      "title": "Buy Gold",
      "submitButtonText": "Proceed to pay",
      "secondaryLinkText": "How did you learn about us?",
      "helpAriaLabel": "Get help with buying gold",
      "inputSectionTitle": "How much gold do you want to buy",
      "infoBannerText": "A 72 hour waiting period applies before newly purchased Gold can be sold",
      "purityBadgeText": "24K 999.9 Pure Gold",
      "goldPurity": "24K",
      "refreshTimeSeconds": 290,
      "minAmount": 10,
      "maxAmount": 500000,
      "minWeight": 0,
      "maxWeight": 50,
      "amountChips": {
        "enabled": true,
        "content": [
          { "order": 1, "value": "2000" },
          { "order": 2, "value": "5000", "isPopular": true },
          { "order": 3, "value": "10000" },
          { "order": 4, "value": "15000" },
          { "order": 5, "value": "50000" }
        ]
      },
      "weightChips": {
        "enabled": true,
        "content": [
          { "order": 1, "value": "0.5" },
          { "order": 2, "value": "1", "isPopular": true },
          { "order": 3, "value": "2" },
          { "order": 4, "value": "5" },
          { "order": 5, "value": "10" }
        ]
      }
    },
    "panVerification": {
      "title": "PAN Verification",
      "submitButtonText": "Verify & Proceed",
      "secondaryLinkText": "Go back",
      "helpAriaLabel": "Get help with PAN verification",
      "panFieldLabel": "PAN Number",
      "panFieldPlaceholder": "e.g: ABCDE1234Z",
      "nameFieldLabel": "Name as per PAN",
      "nameFieldPlaceholder": "Enter name as per PAN",
      "dobFieldLabel": "Date of Birth",
      "dobFieldPlaceholder": "DD/MM/YYYY",
      "noteText": "Your PAN details are required for tax compliance",
      "termsPreText": "By proceeding, you agree to our",
      "termsLinkText": "Terms & Conditions",
      "termsLinkHref": "https://www.adityabirlacapital.com/abc-digital/terms-conditions"
    },
    "nameConfirmation": {
      "title": "Name Confirmation",
      "submitButtonText": "Confirm & Proceed",
      "secondaryLinkText": "Go back",
      "helpAriaLabel": "Get help with name confirmation",
      "nameFieldLabel": "Name as per PAN",
      "instructionText": "Please confirm your name matches the PAN records"
    },
    "transactionSummary": {
      "title": "Order Summary",
      "submitButtonText": "Proceed to Pay",
      "secondaryLinkText": "Modify details",
      "helpAriaLabel": "Get help with order summary",
      "summaryTitle": "Summary of your one-time investment",
      "totalLabel": "Total payable amount",
      "gstLabel": "GST (3%)",
      "goldAmountLabel": "Gold Amount",
      "termsPreText": "By proceeding, you agree to our",
      "termsLinkText": "Terms & Conditions",
      "termsLinkHref": "https://www.adityabirlacapital.com/abc-digital/terms-conditions"
    },
    "thankYou": {
      "title": "Transaction Success",
      "submitButtonText": "Send Invoice",
      "secondaryLinkText": "View Transaction Details",
      "helpAriaLabel": "Get help",
      "heading": "Congratulations!",
      "messagePrefix": "You just bought",
      "messageSuffix": "of 24K Gold"
    },
    "paymentFailure": {
      "title": "Payment Failed",
      "submitButtonText": "Retry Payment",
      "secondaryLinkText": "Try different payment method",
      "helpAriaLabel": "Get help with payment",
      "heading": "Payment Failed",
      "description": "We couldn't process your payment. Please try again."
    }
  },
  "assets": {}
}
```

---

## Sample API Response

```json
{
  "data": [
    {
      "id": 6,
      "documentId": "vkgdjjn74iaib9rerhy9qcp5",
      "subProduct": "gold",
      "createdAt": "2026-02-15T05:40:35.571Z",
      "updatedAt": "2026-02-15T05:40:35.571Z",
      "publishedAt": "2026-02-15T05:40:35.579Z",
      "buy": {
        "id": 6,
        "collectTransactionDetails": {
          "id": 6,
          "title": "Buy Gold",
          "submitButtonText": "Proceed to pay",
          "secondaryLinkText": "How did you learn about us?",
          "helpAriaLabel": "Get help with buying gold",
          "inputSectionTitle": "How much gold do you want to buy",
          "infoBannerText": "A 72 hour waiting period applies before newly purchased Gold can be sold",
          "purityBadgeText": "24K 999.9 Pure Gold",
          "goldPurity": "24K",
          "refreshTimeSeconds": 290,
          "minAmount": 10,
          "maxAmount": 500000,
          "minWeight": 0,
          "maxWeight": 50,
          "amountChips": {
            "id": 6,
            "enabled": true,
            "content": [
              { "order": 1, "id": 26, "value": "2000", "isPopular": false },
              { "order": 2, "id": 27, "value": "5000", "isPopular": true },
              { "order": 3, "id": 28, "value": "10000", "isPopular": false },
              { "order": 4, "id": 29, "value": "15000", "isPopular": false },
              { "order": 5, "id": 30, "value": "50000", "isPopular": false }
            ]
          },
          "weightChips": {
            "id": 6,
            "enabled": true,
            "content": [
              { "order": 1, "id": 26, "value": "0.5", "isPopular": false },
              { "order": 2, "id": 27, "value": "1", "isPopular": true },
              { "order": 3, "id": 28, "value": "2", "isPopular": false }
            ]
          }
        },
        "panVerification": {
          "id": 6,
          "title": "PAN Verification",
          "submitButtonText": "Verify & Proceed",
          "panFieldLabel": "PAN Number",
          "panFieldPlaceholder": "e.g: ABCDE1234Z",
          "nameFieldLabel": "Name as per PAN",
          "nameFieldPlaceholder": "Enter name as per PAN",
          "dobFieldLabel": "Date of Birth",
          "dobFieldPlaceholder": "DD/MM/YYYY",
          "noteText": "Your PAN details are required for tax compliance",
          "termsPreText": "By proceeding, you agree to our",
          "termsLinkText": "Terms & Conditions",
          "termsLinkHref": "https://www.adityabirlacapital.com/abc-digital/terms-conditions"
        },
        "nameConfirmation": {
          "id": 6,
          "title": "Name Confirmation",
          "submitButtonText": "Confirm & Proceed",
          "nameFieldLabel": "Name as per PAN",
          "instructionText": "Please confirm your name matches the PAN records"
        },
        "transactionSummary": {
          "id": 6,
          "title": "Order Summary",
          "submitButtonText": "Proceed to Pay",
          "summaryTitle": "Summary of your one-time investment",
          "totalLabel": "Total payable amount",
          "gstLabel": "GST (3%)",
          "goldAmountLabel": "Gold Amount",
          "termsPreText": "By proceeding, you agree to our",
          "termsLinkText": "Terms & Conditions",
          "termsLinkHref": "https://www.adityabirlacapital.com/abc-digital/terms-conditions"
        },
        "thankYou": {
          "id": 6,
          "title": "Transaction Success",
          "submitButtonText": "Send Invoice",
          "heading": "Congratulations!",
          "messagePrefix": "You just bought",
          "messageSuffix": "of 24K Gold"
        },
        "paymentFailure": {
          "id": 6,
          "title": "Payment Failed",
          "submitButtonText": "Retry Payment",
          "heading": "Payment Failed",
          "description": "We couldn't process your payment. Please try again."
        }
      },
      "assets": {
        "id": 6,
        "successIllustration": null,
        "failureIllustration": null,
        "promoBannerLogo": null,
        "promoBannerQrCode": null
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
digimetal-journey-page (Collection)
├── subProduct: enum (gold, silver)
├── buy: operation-config
│   ├── collectTransactionDetails: page-collect-transaction
│   │   ├── title, submitButtonText, secondaryLinkText, helpAriaLabel
│   │   ├── inputSectionTitle, infoBannerText, purityBadgeText, goldPurity
│   │   ├── refreshTimeSeconds, minAmount, maxAmount, minWeight, maxWeight
│   │   ├── amountChips: section-amount-chips
│   │   │   ├── enabled: boolean
│   │   │   └── content[]: amount-chip
│   │   │       └── order, value, isPopular
│   │   └── weightChips: section-weight-chips
│   │       ├── enabled: boolean
│   │       └── content[]: weight-chip
│   │           └── order, value, isPopular
│   ├── panVerification: page-pan-verification
│   │   └── title, submitButtonText, panFieldLabel, panFieldPlaceholder, nameFieldLabel, dobFieldLabel, noteText, termsPreText, termsLinkText, termsLinkHref
│   ├── nameConfirmation: page-name-confirmation
│   │   └── title, submitButtonText, nameFieldLabel, instructionText
│   ├── transactionSummary: page-transaction-summary
│   │   └── title, submitButtonText, summaryTitle, totalLabel, gstLabel, goldAmountLabel, termsPreText, termsLinkText, termsLinkHref
│   ├── thankYou: page-thank-you
│   │   └── title, submitButtonText, heading, messagePrefix, messageSuffix
│   └── paymentFailure: page-payment-failure
│       └── title, submitButtonText, heading, description
├── sell: operation-config (future)
├── sip: operation-config (future)
├── gift: operation-config (future)
└── assets: journey-assets
    └── successIllustration, failureIllustration, promoBannerLogo, promoBannerQrCode
```
