# CMS Sell Journey - Implementation Issues

**Date:** 2026-03-18  
**Environment:** UAT  
**Query:** `GET /api/digimetal-journey-pages?filters[subProduct][$eq]=silver&filters[partner][$eq]=default&populate=*`

---

## Comparison Table

| Field | Code Expects | API Returns | Status |
|-------|--------------|-------------|--------|
| `selectRedeemType` | ✅ | ❌ | ⚠️ MISSING (uses fallback) |
| `collectTransactionDetails` | ✅ | ✅ | ✅ FIXED (transformed) |
| `panVerification` | ✅ | ✅ | ✅ OK |
| `nameConfirmation` | ✅ | ✅ | ✅ OK |
| `paymentDetails` | ✅ | ❌ | ⚠️ MISSING (uses fallback) |
| `otpVerification` | ✅ | ❌ | ⚠️ MISSING (uses fallback) |
| `reviewTransaction` | ✅ | `transactionSummary` | ⚠️ MISMATCHED FIELDS (uses fallback for key fields) |
| `thankYou` | ✅ | ✅ | ✅ OK |
| `transactionSummary` | - | ✅ | Different schema than `reviewTransaction` |
| `paymentFailure` | - | ✅ | Not consumed |

**Frontend Fix Applied:** `fallback.ts` now transforms CMS response to match code expectations.

---

## Expected JSON (what code expects under `data[0].sell`)

```json
{
  "sell": {
    "selectRedeemType": {
      "title": "Sell Silver",
      "sectionTitle": "How do you want to sell your silver?",
      "submitButtonText": "Continue",
      "secondaryLinkText": "Go back",
      "helpAriaLabel": "Get help with redemption options",
      "paymentMethods": [
        {
          "id": "cash-instantly",
          "iconSrc": "/assets/sell-flow/cashInHand.svg",
          "iconAlt": "Cash in hand",
          "title": "Cash Instantly",
          "description": ["Get your money instantly deposited to your bank account.", "A 72-hour cooling period applies before newly purchased silver can be sold"],
          "options": [
            { "iconSrc": "/assets/sell-flow/bank-outline.svg", "iconAlt": "Bank account", "label": "" },
            { "iconSrc": "/assets/sell-flow/upi.png", "iconAlt": "UPI", "label": "", "size": 32 }
          ],
          "methodType": "cash"
        },
        {
          "id": "silver-in-hand",
          "iconSrc": "/assets/sell-flow/GoldInHand.png",
          "iconAlt": "Silver in hand",
          "title": "Silver in-hand",
          "description": ["Pure silver coin", "Get silver delivered in 7-8 days", "Silver fractions you bought before 72hrs would be locked for redemption due to security reason"],
          "methodType": "gold-in-hand"
        }
      ]
    },
    "collectTransactionDetails": {
      "title": "Sell Digital Silver",
      "submitButtonText": "Continue",
      "secondaryLinkText": "Go back",
      "helpAriaLabel": "Get help with selling silver",
      "inputSectionTitle": "How much silver do you want to sell?",
      "infoBannerMessage": "A 72 hour waiting period applies before newly purchased Silver can be sold",
      "purityBadgeMessage": "999.9 purity digital silver | 100% safe & secure",
      "disclaimerText": "Live buy/sell prices for Digital Silver are set by MMTC-PAMP, ABCD has no role or control over price determination",
      "retentionBannerHeading": "Embrace Long-Term Prosperity",
      "retentionBannerSubtext": "Keep Your Silver for Tomorrow!",
      "refreshTimeSeconds": 290,
      "amountChips": [
        { "id": "amt-1000", "value": 1000 },
        { "id": "amt-2000", "value": 2000, "isPopular": true },
        { "id": "amt-5000", "value": 5000 },
        { "id": "amt-10000", "value": 10000 },
        { "id": "amt-25000", "value": 25000 }
      ],
      "weightChips": [
        { "id": "wt-10", "value": 10 },
        { "id": "wt-50", "value": 50, "isPopular": true },
        { "id": "wt-100", "value": 100 },
        { "id": "wt-250", "value": 250 },
        { "id": "wt-500", "value": 500 }
      ],
      "validationConfig": {
        "minAmount": 10,
        "maxAmount": 100000,
        "minWeight": 0.1,
        "maxWeight": 1000
      }
    },
    "panVerification": {
      "title": "PAN Verification",
      "submitButtonText": "Verify PAN",
      "termsPreText": "By proceeding, you agree to our",
      "termsLinkText": "Terms & Conditions",
      "termsLinkHref": "https://www.adityabirlacapital.com/abc-digital/terms-conditions",
      "secondaryLinkText": "Go back",
      "helpAriaLabel": "Get help with PAN verification",
      "panFieldLabel": "PAN Number",
      "panFieldPlaceholder": "Enter your PAN",
      "nameFieldLabel": "Name as per PAN",
      "nameFieldPlaceholder": "Enter name as per PAN",
      "dobFieldLabel": "Date of Birth",
      "dobFieldPlaceholder": "DD/MM/YYYY",
      "noteText": "Your PAN details are required for tax compliance"
    },
    "nameConfirmation": {
      "title": "Name Confirmation",
      "submitButtonText": "Confirm & Continue",
      "secondaryLinkText": "Go back",
      "helpAriaLabel": "Get help with name confirmation",
      "nameFieldLabel": "Name as per PAN",
      "instructionText": "Please confirm your name matches the PAN records"
    },
    "paymentDetails": {
      "title": "Payment Details",
      "submitButtonText": "Continue",
      "secondaryLinkText": "Go back",
      "helpAriaLabel": "Get help with payment details",
      "upiSectionTitle": "Select UPI",
      "bankSectionTitle": "Select Bank Account",
      "addNewUpiText": "Add new UPI ID",
      "addNewBankText": "Add new bank account",
      "assets": {
        "defaultBankLogo": "/assets/sell/default-bank.png",
        "upiLogo": "/assets/sell/upi-logo.png"
      }
    },
    "otpVerification": {
      "title": "OTP Verification",
      "submitButtonText": "Verify",
      "secondaryLinkText": "Resend OTP",
      "helpAriaLabel": "Get help with OTP verification",
      "instructionText": "Enter OTP sent to your mobile number to\nconfirm the transaction",
      "otpLength": 6
    },
    "reviewTransaction": {
      "title": "Review Transaction",
      "submitButtonText": "Proceed",
      "secondaryLinkText": "Modify details",
      "helpAriaLabel": "Get help with transaction review",
      "reviewTitle": "REVIEW TRANSACTION",
      "descriptionPrefix": "Will be credited to your UPI ID ",
      "logoUrl": "/assets/sell/upi-logo.png"
    },
    "thankYou": {
      "title": "Transaction Success",
      "heading": "Congratulations!",
      "messagePrefix": "You just sold",
      "messageSuffix": "of Pure Silver",
      "submitButtonText": "View Transaction Details",
      "secondaryLinkText": "Go to Dashboard",
      "helpAriaLabel": "Get help",
      "assets": {
        "successIllustration": null
      }
    }
  }
}
```

---

## Current JSON (actual API response under `data[0].sell`)

```json
{
  "sell": {
    "id": 51,
    "thankYou": {
      "id": 46,
      "title": "some data",
      "submitButtonText": "some data",
      "secondaryLinkText": "some data",
      "helpAriaLabel": "some data",
      "heading": "some data",
      "messagePrefix": "some data",
      "messageSuffix": "some data"
    },
    "paymentFailure": {
      "id": 46,
      "title": "some data",
      "submitButtonText": "some data",
      "secondaryLinkText": "some data",
      "helpAriaLabel": "some data",
      "heading": "some data",
      "description": "some data"
    },
    "panVerification": {
      "id": 46,
      "title": "some data",
      "submitButtonText": "some data",
      "secondaryLinkText": "some data",
      "helpAriaLabel": "some data",
      "panFieldLabel": "some data",
      "panFieldPlaceholder": "some data",
      "nameFieldLabel": "some data",
      "nameFieldPlaceholder": "some data",
      "dobFieldLabel": "some data",
      "dobFieldPlaceholder": "some data",
      "noteText": "some noteText",
      "termsPreText": "some data",
      "termsLinkText": "some data",
      "termsLinkHref": "some data"
    },
    "nameConfirmation": {
      "id": 46,
      "title": "some data",
      "submitButtonText": "some data",
      "secondaryLinkText": "some data",
      "helpAriaLabel": "some data",
      "nameFieldLabel": "some data",
      "instructionText": "some data"
    },
    "transactionSummary": {
      "id": 46,
      "title": "some data",
      "submitButtonText": "some data",
      "secondaryLinkText": "some data",
      "helpAriaLabel": "some data",
      "summaryTitle": "some data",
      "totalLabel": "some data",
      "gstLabel": "some data 2",
      "goldAmountLabel": "some data",
      "termsPreText": "some data",
      "termsLinkText": "some data",
      "termsLinkHref": "some data"
    },
    "collectTransactionDetails": {
      "id": 46,
      "title": "some data",
      "submitButtonText": "some data",
      "secondaryLinkText": "some data",
      "helpAriaLabel": "some data",
      "inputSectionTitle": "some data",
      "infoBannerText": "some data",
      "purityBadgeText": "some data",
      "goldPurity": "some data",
      "refreshTimeSeconds": 300,
      "minAmount": 111,
      "maxAmount": 200000,
      "minWeight": 0,
      "maxWeight": 50,
      "amountChips": {
        "id": 46,
        "enabled": true,
        "content": [
          { "order": 1, "id": 172, "value": "250", "isPopular": true }
        ]
      },
      "weightChips": {
        "id": 46,
        "enabled": true,
        "content": [
          { "order": 1, "id": 162, "value": "100", "isPopular": false }
        ]
      }
    }
  }
}
```
