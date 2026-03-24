# DigiMetal CMS v5 - Sell Journey (Strapi Implementation Guide)

**Date:** 2026-03-17  
**Status:** PARKED  
**Full Spec:** See `CMS_REQUIREMENTS_v5_SELL_JOURNEY.md`

---

## Table of Contents

- [1. New Components to Create](#1-new-components-to-create)
  - [1.1 page-select-redeem-type.json](#11-page-select-redeem-typejson)
  - [1.2 payment-method.json](#12-payment-methodjson)
  - [1.3 payment-option.json](#13-payment-optionjson)
  - [1.4 page-collect-transaction-sell.json](#14-page-collect-transaction-selljson)
  - [1.5 section-validation-config.json](#15-section-validation-configjson)
  - [1.6 page-payment-details.json](#16-page-payment-detailsjson)
  - [1.7 page-otp-verification.json](#17-page-otp-verificationjson)
  - [1.8 page-review-transaction.json](#18-page-review-transactionjson)
  - [1.9 page-thank-you-sell.json](#19-page-thank-you-selljson)
- [2. Schema Changes](#2-schema-changes)
- [3. Sample Seed Data](#3-sample-seed-data)
- [4. Expected API Response](#4-expected-api-response)
- [5. Implementation Checklist](#5-implementation-checklist)
- [6. Component Summary](#6-component-summary)

---

## 1. New Components to Create

### Location: `src/components/digimetal-journey/`

---

### 1.1 page-select-redeem-type.json

```json
{
  "collectionName": "components_digimetal_journey_page_select_redeem_types",
  "info": { "displayName": "Page - Select Redeem Type", "icon": "wallet" },
  "attributes": {
    "title": { "type": "string" },
    "sectionTitle": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "paymentMethods": {
      "type": "component",
      "repeatable": true,
      "component": "digimetal-journey.payment-method"
    }
  }
}
```

---

### 1.2 payment-method.json

```json
{
  "collectionName": "components_digimetal_journey_payment_methods",
  "info": { "displayName": "Payment Method", "icon": "wallet" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "methodId": { "type": "string", "required": true },
    "methodType": { 
      "type": "enumeration", 
      "enum": ["cash", "gold-in-hand"],
      "required": true 
    },
    "iconSrc": { "type": "string" },
    "iconAlt": { "type": "string" },
    "title": { "type": "string", "required": true },
    "description": { "type": "json" },
    "options": {
      "type": "component",
      "repeatable": true,
      "component": "digimetal-journey.payment-option"
    }
  }
}
```

---

### 1.3 payment-option.json

```json
{
  "collectionName": "components_digimetal_journey_payment_options",
  "info": { "displayName": "Payment Option", "icon": "check" },
  "attributes": {
    "order": { "type": "integer", "required": true },
    "iconSrc": { "type": "string" },
    "iconAlt": { "type": "string" },
    "label": { "type": "string" },
    "iconSize": { "type": "integer", "default": 24 }
  }
}
```

---

### 1.4 page-collect-transaction-sell.json

```json
{
  "collectionName": "components_digimetal_journey_page_collect_transaction_sells",
  "info": { "displayName": "Page - Collect Transaction (Sell)", "icon": "chartBubble" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "inputSectionTitle": { "type": "string" },
    "infoBannerMessage": { "type": "string" },
    "purityBadgeMessage": { "type": "string" },
    "disclaimerText": { "type": "text" },
    "retentionBannerHeading": { "type": "string" },
    "retentionBannerSubtext": { "type": "string" },
    "refreshTimeSeconds": { "type": "integer", "default": 290 },
    "amountChips": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.section-amount-chips"
    },
    "weightChips": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.section-weight-chips"
    },
    "validationConfig": {
      "type": "component",
      "repeatable": false,
      "component": "digimetal-journey.section-validation-config"
    }
  }
}
```

---

### 1.5 section-validation-config.json

```json
{
  "collectionName": "components_digimetal_journey_section_validation_configs",
  "info": { "displayName": "Section - Validation Config", "icon": "check" },
  "attributes": {
    "minAmount": { "type": "integer", "default": 50 },
    "maxAmount": { "type": "integer", "default": 100000 },
    "minWeight": { "type": "decimal", "default": 0.001 },
    "maxWeight": { "type": "decimal", "default": 50 }
  }
}
```

---

### 1.6 page-payment-details.json

```json
{
  "collectionName": "components_digimetal_journey_page_payment_details",
  "info": { "displayName": "Page - Payment Details", "icon": "creditCard" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "upiSectionTitle": { "type": "string" },
    "bankSectionTitle": { "type": "string" },
    "addNewUpiText": { "type": "string" },
    "addNewBankText": { "type": "string" },
    "defaultBankLogoPath": { "type": "string" },
    "upiLogoPath": { "type": "string" }
  }
}
```

---

### 1.7 page-otp-verification.json

```json
{
  "collectionName": "components_digimetal_journey_page_otp_verifications",
  "info": { "displayName": "Page - OTP Verification", "icon": "key" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "instructionText": { "type": "string" },
    "otpLength": { "type": "integer", "default": 6 }
  }
}
```

---

### 1.8 page-review-transaction.json

```json
{
  "collectionName": "components_digimetal_journey_page_review_transactions",
  "info": { "displayName": "Page - Review Transaction", "icon": "eye" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "reviewTitle": { "type": "string" },
    "descriptionPrefix": { "type": "string" }
  }
}
```

---

### 1.9 page-thank-you-sell.json

```json
{
  "collectionName": "components_digimetal_journey_page_thank_you_sells",
  "info": { "displayName": "Page - Thank You (Sell)", "icon": "check" },
  "attributes": {
    "title": { "type": "string" },
    "heading": { "type": "string" },
    "messagePrefix": { "type": "string" },
    "messageSuffix": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "secondaryLinkText": { "type": "string" },
    "helpAriaLabel": { "type": "string" }
  }
}
```

---

## 2. Schema Changes

### Update: `operation-config.json`

Add these new attributes to the existing `operation-config` component:

```json
{
  "selectRedeemType": {
    "type": "component",
    "repeatable": false,
    "component": "digimetal-journey.page-select-redeem-type"
  },
  "collectTransactionDetailsSell": {
    "type": "component",
    "repeatable": false,
    "component": "digimetal-journey.page-collect-transaction-sell"
  },
  "paymentDetails": {
    "type": "component",
    "repeatable": false,
    "component": "digimetal-journey.page-payment-details"
  },
  "otpVerification": {
    "type": "component",
    "repeatable": false,
    "component": "digimetal-journey.page-otp-verification"
  },
  "reviewTransaction": {
    "type": "component",
    "repeatable": false,
    "component": "digimetal-journey.page-review-transaction"
  },
  "thankYouSell": {
    "type": "component",
    "repeatable": false,
    "component": "digimetal-journey.page-thank-you-sell"
  }
}
```

---

## 3. Sample Seed Data

### Gold Entry (`seed/digimetal/journey-page/gold.json`)

Add `sell` object to existing entry:

```json
{
  "subProduct": "gold",
  "buy": { "...existing..." },
  
  "sell": {
    "selectRedeemType": {
      "title": "Sell Gold",
      "sectionTitle": "How do you want to sell your gold?",
      "submitButtonText": "Continue",
      "secondaryLinkText": "Go back",
      "paymentMethods": [
        {
          "order": 1,
          "methodId": "cash-instantly",
          "methodType": "cash",
          "iconSrc": "/assets/sell-flow/cashInHand.svg",
          "iconAlt": "Cash in hand",
          "title": "Cash Instantly",
          "description": [
            "Get your money instantly deposited to your bank account.",
            "A 72-hour cooling period applies before newly purchased gold can be sold"
          ],
          "options": [
            { "order": 1, "iconSrc": "/assets/sell-flow/bank-outline.svg", "iconAlt": "Bank account" },
            { "order": 2, "iconSrc": "/assets/sell-flow/upi.png", "iconAlt": "UPI", "iconSize": 32 }
          ]
        },
        {
          "order": 2,
          "methodId": "gold-in-hand",
          "methodType": "gold-in-hand",
          "iconSrc": "/assets/sell-flow/GoldInHand.png",
          "iconAlt": "Gold in hand",
          "title": "Gold in-hand",
          "description": [
            "24K secured gold coin",
            "Get gold delivered in 7-8 days"
          ]
        }
      ]
    },
    
    "collectTransactionDetailsSell": {
      "title": "Sell Digital Gold",
      "submitButtonText": "Continue",
      "secondaryLinkText": "Go back",
      "inputSectionTitle": "How much gold do you want to sell?",
      "infoBannerMessage": "A 72 hour waiting period applies before newly purchased Gold can be sold",
      "purityBadgeMessage": "999.9 purity digital gold | 100% safe & secure",
      "disclaimerText": "Live buy/sell prices for Digital Gold are set by MMTC-PAMP, ABCD has no role or control over price determination",
      "retentionBannerHeading": "Embrace Long-Term Prosperity",
      "retentionBannerSubtext": "Keep Your Gold for Tomorrow!",
      "refreshTimeSeconds": 290,
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
      },
      "validationConfig": {
        "minAmount": 50,
        "maxAmount": 100000,
        "minWeight": 0.001,
        "maxWeight": 50
      }
    },
    
    "panVerification": {
      "title": "PAN Verification",
      "submitButtonText": "Verify PAN",
      "secondaryLinkText": "Go back",
      "panFieldLabel": "PAN Number",
      "panFieldPlaceholder": "Enter your PAN",
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
      "submitButtonText": "Confirm & Continue",
      "secondaryLinkText": "Go back",
      "nameFieldLabel": "Name as per PAN",
      "instructionText": "Please confirm your name matches the PAN records"
    },
    
    "paymentDetails": {
      "title": "Payment Details",
      "submitButtonText": "Continue",
      "secondaryLinkText": "Go back",
      "upiSectionTitle": "Select UPI",
      "bankSectionTitle": "Select Bank Account",
      "addNewUpiText": "Add new UPI ID",
      "addNewBankText": "Add new bank account"
    },
    
    "otpVerification": {
      "title": "OTP Verification",
      "submitButtonText": "Verify",
      "secondaryLinkText": "Resend OTP",
      "instructionText": "Enter the OTP sent to your registered mobile number",
      "otpLength": 6
    },
    
    "reviewTransaction": {
      "title": "Review Transaction",
      "submitButtonText": "Confirm Sell",
      "secondaryLinkText": "Modify details",
      "reviewTitle": "REVIEW TRANSACTION",
      "descriptionPrefix": "Will be credited to your UPI ID "
    },
    
    "thankYouSell": {
      "title": "Transaction Success",
      "heading": "Congratulations!",
      "messagePrefix": "You just sold",
      "messageSuffix": "of 24K Gold",
      "submitButtonText": "View Transaction Details",
      "secondaryLinkText": "Go to Dashboard"
    }
  }
}
```

---

## 4. Expected API Response

**Endpoint:** `GET /api/digimetal-journey-pages?filters[subProduct][$eq]=gold&populate=deep`

```json
{
  "data": [{
    "id": 1,
    "subProduct": "gold",
    "buy": { "...existing..." },
    "sell": {
      "id": 1,
      "selectRedeemType": {
        "id": 1,
        "title": "Sell Gold",
        "sectionTitle": "How do you want to sell your gold?",
        "submitButtonText": "Continue",
        "paymentMethods": [
          {
            "id": 1,
            "order": 1,
            "methodId": "cash-instantly",
            "methodType": "cash",
            "title": "Cash Instantly",
            "description": ["Get your money instantly...", "A 72-hour cooling period..."],
            "options": [
              { "id": 1, "order": 1, "iconSrc": "/assets/sell-flow/bank-outline.svg" },
              { "id": 2, "order": 2, "iconSrc": "/assets/sell-flow/upi.png", "iconSize": 32 }
            ]
          },
          {
            "id": 2,
            "order": 2,
            "methodId": "gold-in-hand",
            "methodType": "gold-in-hand",
            "title": "Gold in-hand"
          }
        ]
      },
      "collectTransactionDetailsSell": {
        "id": 1,
        "title": "Sell Digital Gold",
        "inputSectionTitle": "How much gold do you want to sell?",
        "infoBannerMessage": "A 72 hour waiting period...",
        "validationConfig": { "minAmount": 50, "maxAmount": 100000 }
      },
      "panVerification": { "...reuses buy structure..." },
      "nameConfirmation": { "...reuses buy structure..." },
      "paymentDetails": { "id": 1, "title": "Payment Details" },
      "otpVerification": { "id": 1, "title": "OTP Verification", "otpLength": 6 },
      "reviewTransaction": { "id": 1, "reviewTitle": "REVIEW TRANSACTION" },
      "thankYouSell": { "id": 1, "heading": "Congratulations!" }
    },
    "assets": { "...existing..." }
  }]
}
```

---

## 5. Implementation Checklist

- [ ] Create 9 component files in `src/components/digimetal-journey/`
- [ ] Update `operation-config.json` with 6 new attributes
- [ ] Restart Strapi
- [ ] Add seed data for **gold** entry
- [ ] Add seed data for **silver** entry (change titles/messages)
- [ ] Test API response with `populate=deep`

---

## 6. Component Summary

| # | Component File | Purpose |
|---|----------------|---------|
| 1 | `page-select-redeem-type.json` | Redeem type selection |
| 2 | `payment-method.json` | Payment method item |
| 3 | `payment-option.json` | Payment sub-option |
| 4 | `page-collect-transaction-sell.json` | Sell amount input |
| 5 | `section-validation-config.json` | Min/max validation |
| 6 | `page-payment-details.json` | UPI/Bank selection |
| 7 | `page-otp-verification.json` | OTP input |
| 8 | `page-review-transaction.json` | Transaction review |
| 9 | `page-thank-you-sell.json` | Success page |

**Reuse existing:** `section-amount-chips`, `section-weight-chips`, `amount-chip`, `page-pan-verification`, `page-name-confirmation`
