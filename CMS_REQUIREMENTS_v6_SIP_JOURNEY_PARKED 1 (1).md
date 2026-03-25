# DigiMetal CMS Requirements v6 - SIP Journey

**Date:** 2026-03-24  
**Status:** PARKED  
**Scope:** SIP Journey CMS contract  
**Validated Against:** `abcd-digimetal-web/src/app/[subProduct]/customer/@orchestratorContent/sip/content/fallback.ts`

---

## Index

1. [Components](#1-components)
   - [1.1 SIP Operation Pages](#11-sip-operation-pages)
   - [1.2 Reusable Components](#12-reusable-components)
2. [Schema](#2-schema)
   - [2.1 SIP Operation Contract](#21-sip-operation-contract)
   - [2.2 page-collect-sip-details (SipCollectDetailsContent)](#22-page-collect-sip-details-sipcollectdetailscontent)
   - [2.3 page-pan-verification (SipPanVerificationContent)](#23-page-pan-verification-sippanverificationcontent)
   - [2.4 page-name-confirmation (SipNameConfirmationContent)](#24-page-name-confirmation-sipnameconfirmationcontent)
   - [2.5 page-transaction-summary (SipTransactionSummaryContent)](#25-page-transaction-summary-siptransactionsummarycontent)
   - [2.6 page-thank-you (SipThankYouContent)](#26-page-thank-you-sipthankyoucontent)
   - [2.7 page-payment-failure (SipPaymentFailureContent)](#27-page-payment-failure-sippaymentfailurecontent)
   - [2.8 sip-validation-config (SIPValidationConfig)](#28-sip-validation-config-sipvalidationconfig)
   - [2.9 sip-purpose (SIPPurpose)](#29-sip-purpose-sippurpose)
   - [2.10 sip-amount-chip (AmountChip)](#210-sip-amount-chip-amountchip)
   - [2.11 sip-assets (collectSipDetails.assets)](#211-sip-assets-collectsipdetailsassets)
3. [Expected API Response](#3-expected-api-response)
4. [Field Mapping Reference](#4-field-mapping-reference)
   - [4.1 collectSipDetails](#41-collectsipdetails--collectsipdetailsclienttsx)
   - [4.2 panVerification](#42-panverification--panverificationclienttsx)
   - [4.3 nameConfirmation](#43-nameconfirmation--nameconfirmationclienttsx)
   - [4.4 transactionSummary](#44-transactionsummary--transactionsummaryclienttsx)
   - [4.5 thankYou](#45-thankyou--thankyouclienttsx)
   - [4.6 paymentFailure](#46-paymentfailure--paymentfailureclienttsx)

---

## 1. Components

### 1.1 SIP Operation Pages

| Key | Component | TypeScript Interface | Purpose |
|---|---|---|---|
| `collectSipDetails` | `page-collect-sip-details` | `SipCollectDetailsContent` | Setup SIP amount/frequency/purpose |
| `panVerification` | `page-pan-verification` | `SipPanVerificationContent` | PAN + KYC verification |
| `nameConfirmation` | `page-name-confirmation` | `SipNameConfirmationContent` | Confirm PAN name |
| `transactionSummary` | `page-transaction-summary` | `SipTransactionSummaryContent` | Show SIP + mandate summary |
| `thankYou` | `page-thank-you` | `SipThankYouContent` | Success outcome |
| `paymentFailure` | `page-payment-failure` | `SipPaymentFailureContent` | Failure outcome |

### 1.2 Reusable Components

| Component | TypeScript Interface | Used In | Notes |
|---|---|---|---|
| `sip-purpose` | `SIPPurpose` | `collectSipDetails.purposes[]` | Purpose options (`wealth`, `wedding`, etc.) |
| `sip-amount-chip` | `AmountChip` | `collectSipDetails.amountChips[]` | Preset SIP amount chips |
| `sip-validation-config` | `SIPValidationConfig` | `collectSipDetails.validationConfig` | weekly/monthly min/max + error messages |
| `sip-assets` | inline object | `collectSipDetails.assets` | graph and projection images |

---

## 2. Schema

### 2.1 SIP Operation Contract

```json
{
  "sip": {
    "collectSipDetails": { "type": "component", "component": "digimetal-journey.page-collect-sip-details" },
    "panVerification": { "type": "component", "component": "digimetal-journey.page-pan-verification" },
    "nameConfirmation": { "type": "component", "component": "digimetal-journey.page-name-confirmation" },
    "transactionSummary": { "type": "component", "component": "digimetal-journey.page-transaction-summary" },
    "thankYou": { "type": "component", "component": "digimetal-journey.page-thank-you" },
    "paymentFailure": { "type": "component", "component": "digimetal-journey.page-payment-failure" }
  }
}
```

### 2.2 `page-collect-sip-details` (SipCollectDetailsContent)

| Field | Type | Required | Default | Used In Code |
|-------|------|:--------:|---------|:------------:|
| `title` | string | Yes | "SIP" | `cms.title` |
| `submitButtonText` | string | Yes | "Proceed to pay" | `cms.submitButtonText` |
| `secondaryLinkText` | string | Yes | "How did you learn about us?" | `cms.secondaryLinkText` |
| `helpAriaLabel` | string | Yes | "Help with Gold SIP setup" | reserved (not yet wired) |
| `frequencySectionTitle` | string | No | "Select SIP Frequency" | reserved (not yet wired) |
| `dateSectionTitle` | string | No | "Select SIP Date" | reserved (not yet wired) |
| `amountSectionTitle` | string | No | "Enter SIP Amount" | reserved (not yet wired) |
| `purposeSectionTitle` | string | No | "Purpose of Investment" | reserved (not yet wired) |
| `emailSectionTitle` | string | No | "Email for Updates" | reserved (not yet wired) |
| `infoBannerMessage` | string | No | "Start your gold savings..." | reserved (not yet wired) |
| `disclaimerText` | string | No | "SIP amount will be auto-debited..." | reserved (not yet wired) |
| `expectedReturnLabel` | string | No | "Expected Annual Returns" | reserved (not yet wired) |
| `expectedReturnPercentage` | number | No | 12 | `cms.expectedReturnPercentage` |
| `refreshTimeSeconds` | integer | No | 290 | `cms.refreshTimeSeconds` |
| `defaultFrequency` | enum | No | "monthly" | `cms.defaultFrequency` |
| `defaultDate` | integer | No | 1 | `cms.defaultDate` |
| `purposes` | SIPPurpose[] | No | [...] | `cms.purposes` |
| `amountChips` | AmountChip[] | No | [...] | `cms.amountChips` |
| `validationConfig` | SIPValidationConfig | No | {...} | `cms.validationConfig` |
| `assets` | object | No | {...} | `cms.assets` |

> **Note:** Fields marked "reserved (not yet wired)" are defined in TypeScript interface but not currently passed to design system component. They exist for future extensibility.

**assets object:**
```json
{
  "graphLineImage": "string",
  "graphOverlayImage": "string",
  "emptyAmountProjectionImage": "string"
}
```

### 2.3 `page-pan-verification` (SipPanVerificationContent)

| Field | Type | Required | Default | Used In Code |
|-------|------|:--------:|---------|:------------:|
| `title` | string | Yes | "PAN Verification" | `cms.title` |
| `submitButtonText` | string | Yes | "Confirm" | `cms.submitButtonText` |
| `secondaryLinkText` | string | Yes | "" | `cms.secondaryLinkText` |
| `helpAriaLabel` | string | Yes | "Get help with PAN verification" | reserved (not yet wired) |
| `panFieldLabel` | string | No | "PAN Number" | reserved (not yet wired) |
| `panFieldPlaceholder` | string | No | "Enter your PAN" | reserved (not yet wired) |
| `nameFieldLabel` | string | No | "Name as per PAN" | reserved (not yet wired) |
| `nameFieldPlaceholder` | string | No | "Enter name as per PAN" | reserved (not yet wired) |
| `dobFieldLabel` | string | No | "Date of Birth" | reserved (not yet wired) |
| `dobFieldPlaceholder` | string | No | "DD/MM/YYYY" | reserved (not yet wired) |
| `noteText` | string | No | "Your PAN details are required..." | reserved (not yet wired) |
| `termsPreText` | string | No | "By proceeding, you agree to our" | reserved (not yet wired) |
| `termsLinkText` | string | No | "Terms & Conditions" | reserved (not yet wired) |
| `termsLinkHref` | string | No | "https://..." | reserved (not yet wired) |

### 2.4 `page-name-confirmation` (SipNameConfirmationContent)

| Field | Type | Required | Default | Used In Code |
|-------|------|:--------:|---------|:------------:|
| `title` | string | Yes | "Name Confirmation" | `cms.title` |
| `submitButtonText` | string | Yes | "Confirm & Continue" | `cms.submitButtonText` |
| `secondaryLinkText` | string | Yes | "Go back" | `cms.secondaryLinkText` |
| `helpAriaLabel` | string | Yes | "Get help with name confirmation" | reserved (not yet wired) |
| `nameFieldLabel` | string | No | "Name as per PAN" | reserved (not yet wired) |
| `instructionText` | string | No | "Please confirm your name..." | reserved (not yet wired) |

### 2.5 `page-transaction-summary` (SipTransactionSummaryContent)

| Field | Type | Required | Default | Used In Code |
|-------|------|:--------:|---------|:------------:|
| `title` | string | Yes | "SIP" | `cms.title` |
| `submitButtonText` | string | Yes | "Start SIP" | `cms.submitButtonText` |
| `helpAriaLabel` | string | Yes | "Get help with SIP summary" | reserved (not yet wired) |
| `summaryTitle` | string | No | "Summary of your one-time investment" | reserved (not yet wired) |
| `infoBannerMessage` | string | No | "The mandate amount is the maximum limit..." | reserved (not yet wired) |
| `termsPreText` | string | No | "By clicking on Proceed you are agreeing to" | `cms.termsPreText` |
| `termsLinkText` | string | No | "Aditya Birla Capital Digital's Terms & Conditions" | `cms.termsLinkText` |
| `termsLinkHref` | string | No | "https://..." | `cms.termsLinkHref` |

### 2.6 `page-thank-you` (SipThankYouContent)

| Field | Type | Required | Default | Used In Code |
|-------|------|:--------:|---------|:------------:|
| `title` | string | Yes | "SIP Created Successfully!" | `cms.title` |
| `submitButtonText` | string | Yes | "View SIP" | `cms.submitButtonText` |
| `secondaryLinkText` | string | No | "Create Another SIP" | `cms.secondaryLinkText` |
| `helpAriaLabel` | string | Yes | "Help with SIP confirmation" | reserved (not yet wired) |
| `successMessage` | string | No | "Your SIP has been set up successfully..." | reserved (not yet wired) |
| `sipSummaryTitle` | string | No | "SIP Summary" | reserved (not yet wired) |
| `downloadAppPromo` | object | No | {...} | hardcoded in component |

**downloadAppPromo object (page-specific assets):**

| Field | Type | Required | Default | Used In Code |
|-------|------|:--------:|---------|:------------:|
| `playStoreUrl` | string | No | "https://play.google.com/store/apps/details?id=com.abcd.digimetal" | hardcoded in `ThankYouClient.tsx` |
| `appStoreUrl` | string | No | "https://apps.apple.com/app/abcd-digimetal/id123456789" | hardcoded in `ThankYouClient.tsx` |

> **Note:** `downloadAppPromo` URLs are currently hardcoded. Should be moved to CMS for configurability.

### 2.7 `page-payment-failure` (SipPaymentFailureContent)

| Field | Type | Required | Default | Used In Code |
|-------|------|:--------:|---------|:------------:|
| `title` | string | Yes | "SIP Payment Failed" | `cms.title` |
| `heading` | string | Yes | "Uh-Oh!" | `cms.heading` |
| `description` | string | No | "Your SIP mandate registration could not be completed..." | `cms.description` |
| `submitButtonText` | string | Yes | "Go to Dashboard" | `cms.submitButtonText` |
| `helpAriaLabel` | string | Yes | "Get help with failed SIP payment" | reserved (not yet wired) |

### 2.8 `sip-validation-config` (SIPValidationConfig)

| Field | Type | Required | Default |
|-------|------|:--------:|---------|
| `monthlyAmount` | object | No | `{ min: 100, max: 100000 }` |
| `monthlyAmount.min` | integer | No | 100 |
| `monthlyAmount.max` | integer | No | 100000 |
| `weeklyAmount` | object | No | `{ min: 50, max: 100000 }` |
| `weeklyAmount.min` | integer | No | 50 |
| `weeklyAmount.max` | integer | No | 100000 |
| `email` | object | No | `{ required: true }` |
| `email.required` | boolean | No | true |
| `email.pattern` | string (regex) | No | - |
| `existingSIPNames` | string[] | No | [] |
| `errorMessages` | object | No | {...} |

**errorMessages object:**
```json
{
  "amountMinMonthly": "string",
  "amountMaxMonthly": "string",
  "amountMinWeekly": "string",
  "amountMaxWeekly": "string",
  "emailRequired": "string",
  "emailInvalid": "string",
  "purposeDuplicate": "string"
}
```

### 2.9 `sip-purpose` (SIPPurpose)

| Field | Type | Required | Example |
|-------|------|:--------:|---------|
| `id` | string | Yes | "wealth" |
| `label` | string | Yes | "Wealth Creation" |
| `value` | string | Yes | "wealth" |

### 2.10 `sip-amount-chip` (AmountChip)

| Field | Type | Required | Example |
|-------|------|:--------:|---------|
| `id` | string | Yes | "1000" |
| `value` | number | Yes | 1000 |
| `label` | string | Yes | "₹ 1000" |
| `isPopular` | boolean | Yes | false |
| `order` | number | Yes | 1 |

### 2.11 `sip-assets` (collectSipDetails.assets)

> Page-specific assets for `collectSipDetails` only. Used in `CollectSipDetailsClient.tsx`.

| Field | Type | Required | Default | Used In Code |
|-------|------|:--------:|---------|:------------:|
| `graphLineImage` | string | No | "/assets/sip-flow/graphLine.svg" | `cms.assets?.graphLineImage` |
| `graphOverlayImage` | string | No | "/assets/sip-flow/graph.svg" | `cms.assets?.graphOverlayImage` |
| `emptyAmountProjectionImage` | string | No | "/assets/sip-flow/emptyProjection.png" | `cms.assets?.emptyAmountProjectionImage` |

> **Note:** SIP journey does NOT use shared `journey-assets` at root level. Assets are page-specific inside `collectSipDetails.assets`.

---

## 3. Expected API Response

**Endpoint:** `GET /api/sip-journey-contents?filters[subProduct][$eq]=gold&populate=deep`

> Code fetches via `fetchCmsWithPartnerFallback("sip-journey-contents", subProduct.toUpperCase(), partner, { populate: "*" })`

```json
{
  "data": [
    {
      "id": 1,
      "subProduct": "GOLD",
      "sip": {
        "collectSipDetails": {
          "title": "SIP",
          "submitButtonText": "Proceed to pay",
          "secondaryLinkText": "How did you learn about us?",
          "helpAriaLabel": "Help with Gold SIP setup",
          "frequencySectionTitle": "Select SIP Frequency",
          "dateSectionTitle": "Select SIP Date",
          "amountSectionTitle": "Enter SIP Amount",
          "purposeSectionTitle": "Purpose of Investment",
          "emailSectionTitle": "Email for Updates",
          "infoBannerMessage": "Start your gold savings journey with systematic investments",
          "disclaimerText": "SIP amount will be auto-debited on the selected date. You can pause or cancel anytime.",
          "expectedReturnLabel": "Expected Annual Returns",
          "expectedReturnPercentage": 12,
          "refreshTimeSeconds": 290,
          "defaultFrequency": "monthly",
          "defaultDate": 1,
          "purposes": [
            { "id": "wealth", "label": "Wealth Creation", "value": "wealth" },
            { "id": "wedding", "label": "Wedding", "value": "wedding" },
            { "id": "retirement", "label": "Retirement", "value": "retirement" },
            { "id": "child_education", "label": "Child's Education", "value": "child_education" },
            { "id": "emergency", "label": "Emergency Fund", "value": "emergency" },
            { "id": "other", "label": "Other", "value": "other" }
          ],
          "amountChips": [
            { "id": "1000", "value": 1000, "label": "₹ 1000", "isPopular": false, "order": 1 },
            { "id": "2000", "value": 2000, "label": "₹ 2000", "isPopular": false, "order": 2 },
            { "id": "5000", "value": 5000, "label": "₹ 5000", "isPopular": true, "order": 3 }
          ],
          "validationConfig": {
            "monthlyAmount": { "min": 100, "max": 100000 },
            "weeklyAmount": { "min": 50, "max": 100000 },
            "email": { "required": true },
            "errorMessages": {
              "amountMinMonthly": "Minimum monthly SIP amount is ₹100",
              "amountMaxMonthly": "Maximum monthly SIP amount is ₹1,00,000",
              "amountMinWeekly": "Minimum weekly SIP amount is ₹50",
              "amountMaxWeekly": "Maximum weekly SIP amount is ₹10,00,000",
              "emailRequired": "Email is required for SIP updates",
              "emailInvalid": "Please enter a valid email address"
            }
          },
          "assets": {
            "graphLineImage": "/assets/sip-flow/graphLine.svg",
            "graphOverlayImage": "/assets/sip-flow/graph.svg",
            "emptyAmountProjectionImage": "/assets/sip-flow/emptyProjection.png"
          }
        },
        "panVerification": {
          "title": "PAN Verification",
          "submitButtonText": "Confirm",
          "secondaryLinkText": "",
          "helpAriaLabel": "Get help with PAN verification",
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
          "helpAriaLabel": "Get help with name confirmation",
          "nameFieldLabel": "Name as per PAN",
          "instructionText": "Please confirm your name matches the PAN records"
        },
        "transactionSummary": {
          "title": "SIP",
          "submitButtonText": "Start SIP",
          "helpAriaLabel": "Get help with SIP summary",
          "summaryTitle": "Summary of your one-time investment",
          "infoBannerMessage": "The mandate amount is the maximum limit that ABCD can debit from your bank account, for seamless future SIP payments.",
          "termsPreText": "By clicking on Proceed you are agreeing to",
          "termsLinkText": "Aditya Birla Capital Digital's Terms & Conditions",
          "termsLinkHref": "https://www.adityabirlacapital.com/abc-digital/terms-conditions"
        },
        "thankYou": {
          "title": "SIP Created Successfully!",
          "submitButtonText": "View SIP",
          "secondaryLinkText": "Create Another SIP",
          "helpAriaLabel": "Help with SIP confirmation",
          "successMessage": "Your Gold SIP has been set up successfully. The first installment will be debited on the selected date.",
          "sipSummaryTitle": "SIP Summary",
          "downloadAppPromo": {
            "playStoreUrl": "https://play.google.com/store/apps/details?id=com.abcd.digimetal",
            "appStoreUrl": "https://apps.apple.com/app/abcd-digimetal/id123456789"
          }
        },
        "paymentFailure": {
          "title": "SIP Payment Failed",
          "heading": "Uh-Oh!",
          "description": "Your SIP mandate registration could not be completed. Please try again.",
          "submitButtonText": "Go to Dashboard",
          "helpAriaLabel": "Get help with failed SIP payment"
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

## 4. Field Mapping Reference

> **Legend:**
> - `cms.fieldName` = actively used in code
> - `hardcoded` = value exists in code, not yet CMS-driven
> - `reserved` = defined in interface but not yet wired to component

### 4.1 collectSipDetails → CollectSipDetailsClient.tsx

| CMS Field | Code Usage | Component Prop |
|-----------|------------|----------------|
| `title` | `cms.title` | `OrchestratorPage.title` |
| `submitButtonText` | `cms.submitButtonText` | `getActionConfig.text` |
| `secondaryLinkText` | `cms.secondaryLinkText` | `getActionConfig.secondaryText` |
| `helpAriaLabel` | reserved | - |
| `frequencySectionTitle` | reserved | - |
| `dateSectionTitle` | reserved | - |
| `amountSectionTitle` | reserved | - |
| `purposeSectionTitle` | reserved | - |
| `emailSectionTitle` | reserved | - |
| `infoBannerMessage` | reserved | - |
| `disclaimerText` | reserved | - |
| `expectedReturnLabel` | reserved | - |
| `expectedReturnPercentage` | `cms.expectedReturnPercentage` | `CollectSIPDetails.expectedReturnPercentage` |
| `refreshTimeSeconds` | `cms.refreshTimeSeconds` | `refreshIntervalSeconds` |
| `defaultFrequency` | `cms.defaultFrequency` | `useState(frequency)` |
| `defaultDate` | `cms.defaultDate` | `useState(sipDate)` |
| `purposes` | `cms.purposes` | `CollectSIPDetails.purposes` |
| `amountChips` | `cms.amountChips` | `CollectSIPDetails.amountChips` |
| `validationConfig` | `cms.validationConfig` | `CollectSIPDetails.validationConfig` |
| `assets.graphLineImage` | `cms.assets?.graphLineImage` | `CollectSIPDetails.graphLineImage` |
| `assets.graphOverlayImage` | `cms.assets?.graphOverlayImage` | `CollectSIPDetails.graphOverlayImage` |
| `assets.emptyAmountProjectionImage` | `cms.assets?.emptyAmountProjectionImage` | `CollectSIPDetails.emptyAmountProjectionImage` |

### 4.2 panVerification → PanVerificationClient.tsx

| CMS Field | Code Usage | Component Prop |
|-----------|------------|----------------|
| `title` | `cms.title` | `OrchestratorPage.title` |
| `submitButtonText` | `cms.submitButtonText` | `getActionConfig.text` |
| `secondaryLinkText` | `cms.secondaryLinkText` | `getActionConfig.secondaryText` |
| `helpAriaLabel` | reserved | - |
| `panFieldLabel` | reserved | - |
| `panFieldPlaceholder` | reserved | - |
| `nameFieldLabel` | reserved | - |
| `nameFieldPlaceholder` | reserved | - |
| `dobFieldLabel` | reserved | - |
| `dobFieldPlaceholder` | reserved | - |
| `noteText` | reserved | - |
| `termsPreText` | reserved | - |
| `termsLinkText` | reserved | - |
| `termsLinkHref` | reserved | - |

### 4.3 nameConfirmation → NameConfirmationClient.tsx

| CMS Field | Code Usage | Component Prop |
|-----------|------------|----------------|
| `title` | `cms.title` | `OrchestratorPage.title` |
| `submitButtonText` | `cms.submitButtonText` | `getActionConfig.text` |
| `secondaryLinkText` | `cms.secondaryLinkText` | `getActionConfig.secondaryText` |
| `helpAriaLabel` | reserved | - |
| `nameFieldLabel` | reserved | - |
| `instructionText` | reserved | - |

### 4.4 transactionSummary → TransactionSummaryClient.tsx

| CMS Field | Code Usage | Component Prop |
|-----------|------------|----------------|
| `title` | `cms.title` | `OrchestratorPage.title` |
| `submitButtonText` | `cms.submitButtonText` | `getActionConfig.text` |
| `helpAriaLabel` | reserved | - |
| `summaryTitle` | reserved | - |
| `infoBannerMessage` | reserved | - |
| `termsPreText` | `cms.termsPreText` | `getActionConfig.termsPreText` |
| `termsLinkText` | `cms.termsLinkText` | `getActionConfig.termsLinkText` |
| `termsLinkHref` | `cms.termsLinkHref` | `getActionConfig.termsLinkHref` |

### 4.5 thankYou → ThankYouClient.tsx

| CMS Field | Code Usage | Component Prop |
|-----------|------------|----------------|
| `title` | `cms.title` | `OrchestratorPage.title`, `SIPOutcomes.title` |
| `submitButtonText` | `cms.submitButtonText` | `getActionConfig.text` |
| `secondaryLinkText` | `cms.secondaryLinkText` | `getActionConfig.secondaryText` |
| `helpAriaLabel` | reserved | - |
| `successMessage` | reserved | - |
| `sipSummaryTitle` | reserved | - |
| `downloadAppPromo.playStoreUrl` | hardcoded | `SIPOutcomes.downloadAppPromo.playStoreUrl` |
| `downloadAppPromo.appStoreUrl` | hardcoded | `SIPOutcomes.downloadAppPromo.appStoreUrl` |

### 4.6 paymentFailure → PaymentFailureClient.tsx

| CMS Field | Code Usage | Component Prop |
|-----------|------------|----------------|
| `title` | `cms.title` | `OrchestratorPage.title` |
| `heading` | `cms.heading` | `SIPOutcomes.title` |
| `description` | `cms.description` | `SIPOutcomes.description` |
| `submitButtonText` | `cms.submitButtonText` | `getActionConfig.secondaryText` |
| `helpAriaLabel` | reserved | - |

---

**Status:** PARKED  
**Validated:** 2026-03-24 against `fallback.ts` TypeScript interfaces
