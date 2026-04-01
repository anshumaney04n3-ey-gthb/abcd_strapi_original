# DigiMetal CMS Requirements v6 — Sell → Redeem Journey (Gold / Silver In-Hand)

**Date:** 2026-04-01  
**Status:** FINAL  
**Scope:** Sell → Redeem (Gold-in-Hand / Physical Delivery) Journey CMS contract

> **Note:** The **Cash Instantly** (digital sell) branch requirements are documented separately.

---

## Index

1. [Components](#1-components)
   - [1.1 Redeem Operation Pages](#11-redeem-operation-pages)
   - [1.2 Reusable Components](#12-reusable-components)
2. [Schema](#2-schema)
   - [2.1 Sell → Redeem Operation Contract](#21-sell--redeem-operation-contract)
   - [2.2 selectRedeemType (SelectRedeemTypeContent)](#22-selectredeemtype-selectredeemtypecontent)
   - [2.3 productListing (ProductListingContent)](#23-productlisting-productlistingcontent)
   - [2.4 productDetails (ProductDetailsContent)](#24-productdetails-productdetailscontent)
   - [2.5 redeemOrderSummary (RedeemOrderSummaryContent)](#25-redeemordersummary-redeemordersummarycontent)
   - [2.6 redeemSelectAddress (RedeemSelectAddressContent)](#26-redeemselectaddress-redeemselectaddresscontent)
   - [2.7 redeemThankYou (RedeemThankYouContent)](#27-redeemthankyou-redeemthankyoucontent)
   - [2.8 payment-method (PaymentMethod)](#28-payment-method-paymentmethod)
   - [2.9 trust-badge (TrustBadge)](#29-trust-badge-trustbadge)
3. [Expected API Response](#3-expected-api-response)
4. [CMS Integration Summary](#4-cms-integration-summary)

---

## 1. Components

### 1.1 Redeem Operation Pages

| Key | Component | File | Purpose |
|---|---|---|---|
| `selectRedeemType` | `page-select-redeem-type` | `SelectRedeemTypeClient.tsx` | Choose cash-in-hand or gold-in-hand |
| `productListing` | `page-product-listing` | `ProductListingClient.tsx` | Browse redemption catalog + pincode check |
| `productDetails` | `page-product-details` | `ProductListingClient.tsx` | View coin/bar details (sub-view) |
| `redeemOrderSummary` | `page-redeem-order-summary` | `RedeemOrderSummaryClient.tsx` | Review weight, making charges, total payable |
| `redeemSelectAddress` | `page-redeem-select-address` | `RedeemSelectAddressClient.tsx` | Choose / add / edit delivery address |
| `redeemThankYou` | `page-redeem-thank-you` | `ThankYouClient.tsx` | Order confirmed + delivery ETA + Track Order |

### 1.2 Reusable Components

| Component | TypeScript Interface | Used In | Notes |
|---|---|---|---|
| `payment-method` | `PaymentMethod` | `selectRedeemType.paymentMethods[]` | Method cards (`cash`, `gold-in-hand`) |
| `trust-badge` | `TrustBadge` | `productDetails.trustBadges[]` | Refinery / hallmark / insurance badges — **CMS-managed** |

---

## 2. Schema

### 2.1 Sell → Redeem Operation Contract

```json
{
  "sell": {
    "selectRedeemType": { "type": "component", "component": "digimetal-journey.page-select-redeem-type" },
    "productListing": { "type": "component", "component": "digimetal-journey.page-product-listing" },
    "productDetails": { "type": "component", "component": "digimetal-journey.page-product-details" },
    "redeemOrderSummary": { "type": "component", "component": "digimetal-journey.page-redeem-order-summary" },
    "redeemSelectAddress": { "type": "component", "component": "digimetal-journey.page-redeem-select-address" },
    "redeemThankYou": { "type": "component", "component": "digimetal-journey.page-redeem-thank-you" }
  }
}
```

### 2.2 `selectRedeemType` (SelectRedeemTypeContent)

| Field | Type | Required | Gold Default | Silver Default |
|---|---|:---:|---|---|
| `title` | string | Yes | `"Sell Gold"` | `"Sell Silver"` |
| `sectionTitle` | string | Yes | `"How do you want to sell your gold?"` | `"How do you want to sell your silver?"` |
| `submitButtonText` | string | No | `"Continue"` | `"Continue"` |
| `secondaryLinkText` | string | No | `"Go back"` | `"Go back"` |
| `helpAriaLabel` | string | No | `"Get help with redemption options"` | same |
| `paymentMethods` | PaymentMethod[] | Yes | See §2.8 | See §2.8 |

### 2.3 `productListing` (ProductListingContent)

| Field | Type | Required | Gold Default | Silver Default |
|---|---|:---:|---|---|
| `title` | string | Yes | `"Redeem Gold"` | `"Redeem Silver"` |
| `emptyStateMessage` | string | No | `"No products available for delivery at this time"` | same |
| `lockBanner.message` | string | No | `"A 72 hour waiting period applies before newly purchased Gold/Silver can be redeemed for physical delivery"` | same |
| `errors.pincodeRequired` | string | No | `"Please enter a pincode"` | same |
| `errors.pincodeInvalid` | string | No | `"Please enter a valid 6-digit pincode"` | same |
| `errors.pincodeNotServiceable` | string | No | `"Sorry, delivery is not available in this area"` | same |
| `errors.pincodeCheckFailed` | string | No | `"Failed to check pincode. Please try again."` | same |
| `assets.pgInfoIcon` | string | No | `"/assets/physical-gold/gold-coins.png"` | same |

### 2.4 `productDetails` (ProductDetailsContent)

| Field | Type | Required | Gold Default | Silver Default |
|---|---|:---:|---|---|
| `title` | string | Yes | `"Redeem Gold"` | `"Redeem Silver"` |
| `deliveryEstimate` | string | No | `"7-10 days"` | same |
| `outOfStockText` | string | No | `"Out of Stock"` | same |
| `buyNowText` | string | No | `"Buy Now"` | same |
| `enterPincodeText` | string | No | `"Enter Pincode"` | same |
| `safeSecureText` | string | No | `"100% safe and secure"` | same |
| `trustBadges` | TrustBadge[] | No | See §2.9 | same |
| `errors.pincodeRequired` | string | No | `"Please enter a pincode to proceed"` | same |
| `errors.pincodeInvalid` | string | No | `"Please enter a valid 6-digit pincode"` | same |
| `errors.pincodeNotServiceable` | string | No | `"Sorry, delivery is not available in this area"` | same |
| `errors.pincodeCheckFailed` | string | No | `"Failed to check pincode. Please try again."` | same |

### 2.5 `redeemOrderSummary` (RedeemOrderSummaryContent)

| Field | Type | Required | Gold Default | Silver Default |
|---|---|:---:|---|---|
| `title` | string | Yes | `"Redeem Gold"` | `"Redeem Silver"` |
| `submitButtonText` | string | Yes | `"Proceed"` | same |
| `secondaryLinkText` | string | No | `"Go back"` | same |
| `helpAriaLabel` | string | No | `"Get help with redeem order summary"` | same |
| `insufficientBalanceMessage` | string | No | `"You cannot redeem more than your gold savings"` | `"...silver savings"` |
| `safeAndSecureLabel` | string | No | `"100% safe and secure"` | same |

### 2.6 `redeemSelectAddress` (RedeemSelectAddressContent)

| Field | Type | Required | Default |
|---|---|:---:|---|
| `title` | string | Yes | `"Redeem Gold"` |
| `submitButtonText` | string | Yes | `"Proceed"` |
| `saveButtonText` | string | No | `"Save Address"` |
| `secondaryLinkText` | string | No | `"Go back"` |
| `helpAriaLabel` | string | No | `"Get help with address selection"` |
| `footerNote` | string | No | `"*Your order will be delivered to this address"` |
| `securityBadge` | string | No | `"100% safe and secure"` |

> **Note:** The `add-address` and `edit-address` form field labels (Full Name, Pincode, House No., Area, City, State) are provided by the `AddAddressForm` design-system component and are **not** configurable via CMS.

### 2.7 `redeemThankYou` (RedeemThankYouContent)

| Field | Type | Required | Gold Default | Silver Default |
|---|---|:---:|---|---|
| `title` | string | Yes | `"Redeem Gold"` | `"Redeem Silver"` |
| `heading` | string | No | `"Order Confirmed!"` | same |
| `submitButtonText` | string | Yes | `"Proceed"` | same |
| `proceedButtonText` | string | No | `"Proceed"` | same |
| `secondaryLinkText` | string | No | `"Go to Dashboard"` | same |
| `helpAriaLabel` | string | No | `"Get help"` | same |
| `orderInitiatedMessage` | string | No | `"Your order has been initiated and will be delivered soon."` | same |
| `orderBannerMessage` | string | No | `"Don't forget, you can always reinvest with us!"` | same |
| `orderConfirmationTitle` | string | No | `"Order Placed, thank You!"` | same |
| `orderConfirmationFooter` | string | No | `"Order placed, thank you!"` | same |
| `etaPrefix` | string | No | `"Arriving by"` | same |
| `deliveryAddressLabel` | string | No | `"Delivery Address"` | same |
| `assets.successIllustration` | string \| null | No | `null` | same |

### 2.8 `payment-method` (PaymentMethod)

> Used in `selectRedeemType.paymentMethods[]`. Only the **gold-in-hand** card is in scope here.

| Field | Type | Required | Gold Default | Silver Default |
|---|---|:---:|---|---|
| `id` | string | Yes | `"gold-in-hand"` | `"silver-in-hand"` |
| `iconSrc` | string | Yes | `"/assets/sell-flow/GoldInHand.png"` | same |
| `iconAlt` | string | Yes | `"Gold in hand"` | `"Silver in hand"` |
| `title` | string | Yes | `"Gold in-hand"` | `"Silver in-hand"` |
| `description` | string[] | Yes | See below | See below |
| `methodType` | enum | Yes | `"gold-in-hand"` | `"gold-in-hand"` |
| `options` | PaymentOption[] | No | *(not used for gold-in-hand)* | — |

**Gold description default:**
```json
["24K secured gold coin", "Get gold delivered in 7-8 days", "Gold fractions you bought before 72hrs would be locked for redemption due to security reason"]
```

**Silver description default:**
```json
["Pure silver coin", "Get silver delivered in 7-8 days", "Silver fractions you bought before 72hrs would be locked for redemption due to security reason"]
```

### 2.9 `trust-badge` (TrustBadge)

> Used in `productDetails.trustBadges[]`. **CMS-managed** — full array controlled via Strapi with local assets as fallback.

| Field | Type | Required | Example |
|---|---|:---:|---|
| `id` | string | Yes | `"refinery"` |
| `label` | string | Yes | `"Gold refinery"` |
| `logoSrc` | string | Yes | `"/assets/physical-gold/gold-refinery-logo.png"` |
| `logoAlt` | string | Yes | `"Gold Refinery Logo"` |
| `logoWidth` | string | No | `"73px"` |
| `logoHeight` | string | No | `"39px"` |

**Default badge set:**

| id | label | logoSrc | logoAlt | logoWidth | logoHeight |
|---|---|---|---|---|---|
| `refinery` | `"Gold refinery"` | `/assets/physical-gold/gold-refinery-logo.png` | `"Gold Refinery Logo"` | `"73px"` | `"39px"` |
| `hallmark` | `"24K Hallmark"` | `/assets/physical-gold/bis-hallmark-logo.png` | `"BIS Hallmark"` | `"14px"` | `"11px"` |
| `insurance` | `"Insured by"` | `/assets/physical-gold/insurance-logo.png` | `"Insurance Logo"` | `"25px"` | `"21px"` |

---

## 3. Expected API Response

**Endpoint:** `GET /api/digimetal-journey-pages?filters[subProduct][$eq]=gold&populate=deep`

> Code fetches via `fetchCmsWithPartnerFallback("digimetal-journey-pages", subProduct, partner, { populate: "*" })`

```json
{
  "data": [
    {
      "id": 1,
      "subProduct": "gold",
      "sell": {
        "selectRedeemType": {
          "title": "Sell Gold",
          "sectionTitle": "How do you want to sell your gold?",
          "submitButtonText": "Continue",
          "secondaryLinkText": "Go back",
          "helpAriaLabel": "Get help with redemption options",
          "paymentMethods": [
            {
              "id": "cash-instantly",
              "iconSrc": "/assets/sell-flow/cashInHand.svg",
              "iconAlt": "Cash in hand",
              "title": "Cash Instantly",
              "description": [
                "Get your money instantly deposited to your bank account.",
                "A 72-hour cooling period applies before newly purchased gold can be sold"
              ],
              "options": [
                { "iconSrc": "/assets/sell-flow/bank-outline.svg", "iconAlt": "Bank account", "label": "" },
                { "iconSrc": "/assets/sell-flow/upi.png", "iconAlt": "UPI", "label": "", "size": 32 }
              ],
              "methodType": "cash"
            },
            {
              "id": "gold-in-hand",
              "iconSrc": "/assets/sell-flow/GoldInHand.png",
              "iconAlt": "Gold in hand",
              "title": "Gold in-hand",
              "description": [
                "24K secured gold coin",
                "Get gold delivered in 7-8 days",
                "Gold fractions you bought before 72hrs would be locked for redemption due to security reason"
              ],
              "methodType": "gold-in-hand"
            }
          ]
        },
        "productListing": {
          "title": "Redeem Gold",
          "emptyStateMessage": "No products available for delivery at this time",
          "lockBanner": {
            "message": "A 72 hour waiting period applies before newly purchased Gold/Silver can be redeemed for physical delivery"
          },
          "errors": {
            "pincodeRequired": "Please enter a pincode",
            "pincodeInvalid": "Please enter a valid 6-digit pincode",
            "pincodeNotServiceable": "Sorry, delivery is not available in this area",
            "pincodeCheckFailed": "Failed to check pincode. Please try again."
          },
          "assets": {
            "pgInfoIcon": "/assets/physical-gold/gold-coins.png"
          }
        },
        "productDetails": {
          "title": "Redeem Gold",
          "deliveryEstimate": "7-10 days",
          "outOfStockText": "Out of Stock",
          "buyNowText": "Buy Now",
          "enterPincodeText": "Enter Pincode",
          "safeSecureText": "100% safe and secure",
          "trustBadges": [
            {
              "id": "refinery",
              "label": "Gold refinery",
              "logoSrc": "/assets/physical-gold/gold-refinery-logo.png",
              "logoAlt": "Gold Refinery Logo",
              "logoWidth": "73px",
              "logoHeight": "39px"
            },
            {
              "id": "hallmark",
              "label": "24K Hallmark",
              "logoSrc": "/assets/physical-gold/bis-hallmark-logo.png",
              "logoAlt": "BIS Hallmark",
              "logoWidth": "14px",
              "logoHeight": "11px"
            },
            {
              "id": "insurance",
              "label": "Insured by",
              "logoSrc": "/assets/physical-gold/insurance-logo.png",
              "logoAlt": "Insurance Logo",
              "logoWidth": "25px",
              "logoHeight": "21px"
            }
          ],
          "errors": {
            "pincodeRequired": "Please enter a pincode to proceed",
            "pincodeInvalid": "Please enter a valid 6-digit pincode",
            "pincodeNotServiceable": "Sorry, delivery is not available in this area",
            "pincodeCheckFailed": "Failed to check pincode. Please try again."
          }
        },
        "redeemOrderSummary": {
          "title": "Redeem Gold",
          "submitButtonText": "Proceed",
          "secondaryLinkText": "Go back",
          "helpAriaLabel": "Get help with redeem order summary",
          "insufficientBalanceMessage": "You cannot redeem more than your gold savings",
          "safeAndSecureLabel": "100% safe and secure"
        },
        "redeemSelectAddress": {
          "title": "Redeem Gold",
          "submitButtonText": "Proceed",
          "saveButtonText": "Save Address",
          "secondaryLinkText": "Go back",
          "helpAriaLabel": "Get help with address selection",
          "footerNote": "*Your order will be delivered to this address",
          "securityBadge": "100% safe and secure"
        },
        "redeemThankYou": {
          "title": "Redeem Gold",
          "heading": "Order Confirmed!",
          "submitButtonText": "Proceed",
          "proceedButtonText": "Proceed",
          "secondaryLinkText": "Go to Dashboard",
          "helpAriaLabel": "Get help",
          "orderInitiatedMessage": "Your order has been initiated and will be delivered soon.",
          "orderBannerMessage": "Don't forget, you can always reinvest with us!",
          "orderConfirmationTitle": "Order Placed, thank You!",
          "orderConfirmationFooter": "Order placed, thank you!",
          "etaPrefix": "Arriving by",
          "deliveryAddressLabel": "Delivery Address",
          "assets": {
            "successIllustration": null
          }
        }
      }
    }
  ],
  "meta": {
    "pagination": { "page": 1, "pageSize": 25, "pageCount": 1, "total": 1 }
  }
}
```



---

## 4. CMS Integration Summary

| Page | CMS Key(s) |
|---|---|
| select-redeem-type | `selectRedeemType` |
| product-listing | `productListing` + `productDetails` |
| redeem-order-summary | `redeemOrderSummary` |
| redeem-select-address | `redeemSelectAddress` |
| thank-you | `thankYou` + `redeemThankYou` |

---

**Status:** FINAL  
**Date:** 2026-04-01
