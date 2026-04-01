# DigiMetal Gift Flow — CMS Integration Documentation

---

## Table of Contents

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [Current State](#current-state)
4. [Gift Operation Config — Strapi Schema](#gift-operation-config--strapi-schema)
5. [Gift-Specific Page Components](#gift-specific-page-components)
   - [Page — Collect Gift Details](#page--collect-gift-details)
   - [Page — Recipient Details](#page--recipient-details)
   - [Page — Gift Transaction Summary](#page--gift-transaction-summary)
   - [Page — Gift Success](#page--gift-success)
   - [Page — OTP Verification](#page--otp-verification)
   - [Page — Payment Failure](#page--payment-failure)
6. [Dashboard — Gift Receiver Journey](#dashboard--gift-receiver-journey)
7. [Fallback Defaults (content/index.ts)](#fallback-defaults)
8. [CMS Content Fetching Pattern](#cms-content-fetching-pattern)
9. [Gift Pages — Integration Steps](#gift-pages--integration-steps)
10. [Seed Data (Sample Entry)](#seed-data-sample-entry)
11. [Sample API Response](#sample-api-response)
12. [Component Hierarchy](#component-hierarchy)

---

## Overview

The Gift flow is part of the **DigiMetal Journey Page** collection type in Strapi CMS. It uses the same `operation-config` component pattern as Buy/Sell/SIP, extended with **gift-specific page components** for pages unique to the gift journey (collect gift details, recipient details, OTP verification).

Shared pages (PAN verification, name confirmation) already reuse the Buy CMS content via `getCMSContent(..., "gift")`.

**API Identifier:** `api::digimetal-journey-page.digimetal-journey-page`  
**Operation Key:** `gift`

---

## Architecture

```
Strapi CMS (digimetal-journey-pages)
  └── Entry: { subProduct: "gold" }
       ├── buy:  operation-config  (already integrated ✅)
       ├── sell: operation-config  (future)
       ├── sip:  operation-config  (future)
       ├── gift: operation-config  ← THIS DOCUMENT
       │    ├── collectGiftDetails:    page-gift-collect-details     (NEW)
       │    ├── recipientDetails:      page-gift-recipient-details   (NEW)
       │    ├── panVerification:       page-pan-verification         (reused ✅)
       │    ├── nameConfirmation:      page-name-confirmation        (reused ✅)
       │    ├── transactionSummary:    page-gift-transaction-summary (NEW)
       │    ├── otpVerification:       page-gift-otp-verification    (NEW)
       │    ├── thankYou:              page-gift-success             (NEW)
       │    └── paymentFailure:        page-payment-failure          (reused ✅)
       └── assets: journey-assets
```

### File Structure (Web App)

```
src/app/[subProduct]/customer/@orchestratorContent/gift/
├── content/
│   ├── index.ts          ← Fallback defaults + re-exports getCMSContent
│   └── fallback.ts       ← Re-exports from index.ts
├── collect-gift-details/
│   ├── page.tsx           ← Server component (CMS fetch here)
│   └── CollectGiftDetailsClient.tsx
├── recipient-details/
│   ├── page.tsx
│   └── RecipientDetailsClient.tsx
├── collect-pan-details/
│   ├── page.tsx           ← Already uses getCMSContent("panVerification", ..., "gift")
│   └── GiftPanVerificationClient.tsx
├── validate-name-match/
│   ├── page.tsx           ← Already uses getCMSContent("nameConfirmation", ..., "gift")
│   └── GiftNameConfirmationClient.tsx
├── transaction-summary/
│   ├── page.tsx
│   └── TransactionSummaryClient.tsx
├── otp-verification/
│   ├── page.tsx
│   └── OTPVerificationClient.tsx
├── transaction-payment/
│   └── page.tsx           ← No CMS (payment gateway redirect)
├── gift-success/
│   ├── page.tsx
│   └── GiftSuccessClient.tsx
├── payment-failure/
│   ├── page.tsx
│   └── PaymentFailureClient.tsx   ← Currently no CMS (hardcoded)
└── collect-email-details/
    ├── page.tsx           ← No CMS (simple email input)
    └── CollectEmailDetailsClient.tsx
```

---

## Current State

| Page | CMS Status | How Content is Loaded |
|------|-----------|----------------------|
| Collect Gift Details | ❌ Hardcoded fallback | `DEFAULT_COLLECT_GIFT_DETAILS_CONTENT` |
| Recipient Details | ❌ Hardcoded fallback | `DEFAULT_RECIPIENT_DETAILS_CONTENT` |
| PAN Verification | ✅ CMS integrated | `getCMSContent("panVerification", subProduct, "gift", partner)` |
| Name Confirmation | ✅ CMS integrated | `getCMSContent("nameConfirmation", subProduct, "gift", partner)` |
| Transaction Summary | ❌ Hardcoded fallback | `DEFAULT_GIFT_TRANSACTION_SUMMARY_CONTENT` |
| OTP Verification | ❌ Hardcoded fallback | `DEFAULT_GIFT_OTP_VERIFICATION_CONTENT` |
| Gift Success | ❌ Hardcoded fallback | `DEFAULT_GIFT_SUCCESS_CONTENT` |
| Payment Failure | ❌ Hardcoded only | No CMS prop at all |
| Transaction Payment | N/A | Payment gateway redirect, no CMS |
| Collect Email Details | N/A | Simple email input, no CMS |

---

## Gift Operation Config — Strapi Schema

The existing `operation-config` component currently only references buy-flow pages. For the gift flow, it needs to be extended with gift-specific page components, or a new `gift-operation-config` component should be created.

### Option A: Extend Existing `operation-config`

Add gift-specific page attributes to the existing `operation-config.json`:

```json
{
  "collectionName": "components_digimetal_journey_operation_configs",
  "info": { "displayName": "Operation Config", "icon": "apps" },
  "attributes": {
    "collectTransactionDetails": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-collect-transaction"
    },
    "collectGiftDetails": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-gift-collect-details"
    },
    "recipientDetails": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-gift-recipient-details"
    },
    "panVerification": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-pan-verification"
    },
    "nameConfirmation": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-name-confirmation"
    },
    "transactionSummary": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-transaction-summary"
    },
    "giftTransactionSummary": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-gift-transaction-summary"
    },
    "otpVerification": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-gift-otp-verification"
    },
    "thankYou": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-thank-you"
    },
    "giftSuccess": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-gift-success"
    },
    "paymentFailure": {
      "type": "component", "repeatable": false,
      "component": "digimetal-journey.page-payment-failure"
    }
  }
}
```

---

## Gift-Specific Page Components

### Page — Collect Gift Details

**Strapi Component:** `digimetal-journey.page-gift-collect-details`  
**Client Component:** `CollectGiftDetailsClient.tsx`  
**Fallback Constant:** `DEFAULT_COLLECT_GIFT_DETAILS_CONTENT`

| Attribute | Type | Default | Used In Client |
|-----------|------|---------|---------------|
| `title` | string | `"Gift Gold"` | ✅ Page title: `cms.title \|\| "Gift ${subProductName}"` |
| `submitButtonText` | string | `"Proceed"` | ✅ Action button text |
| `helpAriaLabel` | string | `"Get help with gifting gold"` | ❌ Defined but not consumed |
| `holdingsLabel` | string | `"Your Holdings"` | ✅ Holdings card label |
| `giftBannerText` | string | `"Gifting"` | ❌ Defined but not consumed |
| `inputSectionTitle` | string | `"How much gold do you want to gift"` | ❌ Defined but not consumed |
| `receiverNameLabel` | string | `"Receiver's Name"` | ❌ Not used on this page |
| `receiverMobileLabel` | string | `"Receiver's Mobile"` | ❌ Not used on this page |
| `noteLabel` | string | `"Note"` | ❌ Not used on this page |
| `notePlaceholder` | string | `"Sending you wishes to brighten up your day!"` | ❌ Not used on this page |
| `giftCardLabel` | string | `"Choose Gift card"` | ❌ Not used on this page |
| `scheduleLabel` | string | `"Schedule for later"` | ❌ Not used on this page |
| `savedReceiversTitle` | string | `"Recently gifted"` | ❌ Defined but not consumed |
| `newReceiverTitle` | string | `"New Receiver"` | ❌ Defined but not consumed |
| `amountChips` | component[] | 5 chips (1000–20000) | ✅ Passed to amount chip selector |
| `weightChips` | component[] | 5 chips (0.5–10) | ✅ Passed to weight chip selector |
| `validationConfig.minAmount` | integer | `10` | ✅ Input validation |
| `validationConfig.maxAmount` | integer | `100000` | ✅ Input validation |
| `validationConfig.minWeight` | decimal | `0.01` | ✅ Input validation |
| `validationConfig.maxWeight` | decimal | `100` | ✅ Input validation |

**Schema:**

```json
{
  "collectionName": "components_digimetal_journey_page_gift_collect_details",
  "info": { "displayName": "Page - Gift Collect Details", "icon": "gift" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "holdingsLabel": { "type": "string" },
    "inputSectionTitle": { "type": "string" },
    "minAmount": { "type": "integer", "default": 10 },
    "maxAmount": { "type": "integer", "default": 100000 },
    "minWeight": { "type": "decimal", "default": 0.01 },
    "maxWeight": { "type": "decimal", "default": 100 },
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

### Page — Recipient Details

**Strapi Component:** `digimetal-journey.page-gift-recipient-details`  
**Client Component:** `RecipientDetailsClient.tsx`  
**Fallback Constant:** `DEFAULT_RECIPIENT_DETAILS_CONTENT`

| Attribute | Type | Default | Used In Client |
|-----------|------|---------|---------------|
| `title` | string | `"Recipient Details"` | ✅ Page title |
| `submitButtonText` | string | `"Proceed to Order"` | ✅ Action button text |
| `helpAriaLabel` | string | `"Get help with recipient details"` | ❌ Defined but not consumed |
| `receiverNameLabel` | string | `"Receiver's Name"` | ✅ Form label + Edit modal |
| `receiverNamePlaceholder` | string | `"Enter receiver name"` | ✅ Form placeholder + Edit modal |
| `receiverMobileLabel` | string | `"Receiver's Mobile"` | ✅ Form label + Edit modal |
| `receiverMobilePlaceholder` | string | `"Enter receiver mobile number"` | ✅ Form placeholder + Edit modal |
| `noteLabel` | string | `"Note"` | ✅ Note textarea label |
| `notePlaceholder` | string | `"Sending you wishes to brighten up your day!"` | ✅ Note placeholder + initial value |
| `maxNoteLength` | integer | `200` | ✅ Note max char limit |
| `giftCardLabel` | string | `"Choose Gift card"` | ✅ Gift card section label |
| `scheduleLabel` | string | `"Schedule for later"` | ✅ Schedule toggle label |

**Schema:**

```json
{
  "collectionName": "components_digimetal_journey_page_gift_recipient_details",
  "info": { "displayName": "Page - Gift Recipient Details", "icon": "user" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "receiverNameLabel": { "type": "string" },
    "receiverNamePlaceholder": { "type": "string" },
    "receiverMobileLabel": { "type": "string" },
    "receiverMobilePlaceholder": { "type": "string" },
    "noteLabel": { "type": "string" },
    "notePlaceholder": { "type": "string" },
    "maxNoteLength": { "type": "integer", "default": 200 },
    "giftCardLabel": { "type": "string" },
    "scheduleLabel": { "type": "string" }
  }
}
```

---

### Page — Gift Transaction Summary

**Strapi Component:** `digimetal-journey.page-gift-transaction-summary`  
**Client Component:** `TransactionSummaryClient.tsx`  
**Fallback Constant:** `DEFAULT_GIFT_TRANSACTION_SUMMARY_CONTENT`

| Attribute | Type | Default | Used In Client |
|-----------|------|---------|---------------|
| `title` | string | `"Gift Summary"` | ✅ Page title |
| `submitButtonText` | string | `"Proceed"` | ✅ Action button text |
| `helpAriaLabel` | string | `"Get help with gift summary"` | ❌ Defined but not consumed |
| `showHelpIcon` | boolean | `true` | ✅ Toggles help icon visibility |
| `giftQuantityLabel` | string | `"Gift Quantity"` | ❌ Defined but not consumed |
| `purchaseAmountLabel` | string | `"Purchase Amount"` | ❌ Defined but not consumed |
| `gstLabel` | string | `"GST (3%)"` | ❌ Defined but not consumed |
| `toPayLabel` | string | `"To Pay"` | ❌ Defined but not consumed |
| `receiverDetailsTitle` | string | `"Receiver Details"` | ❌ Defined but not consumed |
| `paymentSummaryTitle` | string | `"Payment summary"` | ❌ Defined but not consumed |
| `infoBannerText` | string | `"Credit card payments are not allowed..."` | ✅ Info banner on page |
| `secondaryInfoText` | string | `""` | ✅ Secondary info text |
| `notePlaceholder` | string | `"Sending you wishes to brighten up your day!"` | ❌ Defined but not consumed |

**Schema:**

```json
{
  "collectionName": "components_digimetal_journey_page_gift_transaction_summaries",
  "info": { "displayName": "Page - Gift Transaction Summary", "icon": "file" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "showHelpIcon": { "type": "boolean", "default": true },
    "giftQuantityLabel": { "type": "string" },
    "purchaseAmountLabel": { "type": "string" },
    "gstLabel": { "type": "string" },
    "toPayLabel": { "type": "string" },
    "receiverDetailsTitle": { "type": "string" },
    "paymentSummaryTitle": { "type": "string" },
    "infoBannerText": { "type": "string" },
    "secondaryInfoText": { "type": "string" }
  }
}
```

---

### Page — Gift Success

**Strapi Component:** `digimetal-journey.page-gift-success`  
**Client Component:** `GiftSuccessClient.tsx`  
**Fallback Constant:** `DEFAULT_GIFT_SUCCESS_CONTENT`

| Attribute | Type | Default | Used In Client |
|-----------|------|---------|---------------|
| `title` | string | `"Gift Sent"` | ✅ Page title |
| `heading` | string | `"We've sent your lovely gift!"` | ❌ Defined but not consumed |
| `submitButtonText` | string | `"Go to Homepage"` | ❌ Defined but not consumed |
| `helpAriaLabel` | string | `"Get help"` | ❌ Defined but not consumed |
| `disclaimerText` | string | `"The end recipient must accept..."` | ✅ Disclaimer on success page |
| `instructionsLinkText` | string | `"how to receive it"` | ✅ Instructions link text |
| `copyLabel` | string | `"Copy"` | ❌ Defined but not consumed |
| `shareLabel` | string | `"Share"` | ❌ Defined but not consumed |
| `whatsappLabel` | string | `"WhatsApp"` | ❌ Defined but not consumed |
| `homepageLabel` | string | `"Homepage"` | ❌ Defined but not consumed |

**Schema:**

```json
{
  "collectionName": "components_digimetal_journey_page_gift_successes",
  "info": { "displayName": "Page - Gift Success", "icon": "check" },
  "attributes": {
    "title": { "type": "string" },
    "heading": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "disclaimerText": { "type": "string" },
    "instructionsLinkText": { "type": "string" },
    "copyLabel": { "type": "string" },
    "shareLabel": { "type": "string" },
    "whatsappLabel": { "type": "string" },
    "homepageLabel": { "type": "string" }
  }
}
```

---

### Page — OTP Verification

**Strapi Component:** `digimetal-journey.page-gift-otp-verification`  
**Client Component:** `OTPVerificationClient.tsx`  
**Fallback Constant:** `DEFAULT_GIFT_OTP_VERIFICATION_CONTENT`

| Attribute | Type | Default | Used In Client |
|-----------|------|---------|---------------|
| `title` | string | `"Verify OTP"` | ✅ Page title |
| `submitButtonText` | string | `"Verify"` | ✅ Action button text |
| `helpAriaLabel` | string | `"Get help with OTP verification"` | ❌ Defined but not consumed |
| `otpLabel` | string | `"Enter OTP"` | ❌ Defined but not consumed |
| `resendText` | string | `"Resend OTP"` | ❌ Defined but not consumed |
| `resendCountdown` | integer | `30` | ❌ Defined but not consumed |

**Schema:**

```json
{
  "collectionName": "components_digimetal_journey_page_gift_otp_verifications",
  "info": { "displayName": "Page - Gift OTP Verification", "icon": "lock" },
  "attributes": {
    "title": { "type": "string" },
    "submitButtonText": { "type": "string" },
    "helpAriaLabel": { "type": "string" },
    "otpLabel": { "type": "string" },
    "resendText": { "type": "string" },
    "resendCountdown": { "type": "integer", "default": 30 }
  }
}
```

---

### Page — Payment Failure

**Reuses existing** `digimetal-journey.page-payment-failure` from Buy flow.  
**Client Component:** `PaymentFailureClient.tsx`  
**CMS Status:** ❌ Currently has NO CMS prop — all strings hardcoded  

To integrate, the `page.tsx` should be updated to fetch CMS content, and the client should accept a `cmsContent` prop.

---

## Dashboard — Gift Receiver Journey

The dashboard handles **incoming gifts** (receiver side) separate from the sender flow. This is driven by the `giftCheck` API, **not CMS content**.

### Data Flow

```
DashboardClient.tsx
  │
  ├── loadGiftReceivers(mobileNumber)
  │     └── giftService.giftCheck({ mobileNumber, metalType })
  │           └── Returns GiftReceiverItem[]
  │                 ├── transferId
  │                 ├── giftFrom (sender name)
  │                 ├── giftNotes (hex-encoded)
  │                 ├── goldQuantity
  │                 ├── giftCardImage
  │                 ├── transferStatus ("Transfer Initiated")
  │                 ├── giftExpiryStatus ("valid")
  │                 ├── giftExpiryDate
  │                 └── srcMobileNum
  │
  ├── giftCarouselItems (mapped for DashboardPage)
  │     └── { id, senderName, message }
  │
  ├── onGiftCardClick → opens gift view sidebar
  │     └── selectedGiftReceiver: { id, name, mobile, message }
  │
  └── onGiftAccept → giftService.confirmTransfer(...)
        └── Refreshes holdings + gift receivers
```

### CMS Integration Points

| Item | CMS Needed? | Current State |
|------|-------------|---------------|
| Gift carousel cards | No | Data from API (`giftFrom`, `giftNotes`) |
| Gift view sidebar | No | Data from API (receiver details) |
| Gift action card (in action cards grid) | Yes (via dashboard CMS) | `actionCards` has `id: "gift"`, image from CMS/local fallback |
| Gift asset path | No | Local: `/assets/dashboard/gift-gold.png` |

The gift receiver journey on the dashboard is **entirely API-driven** and does not need gift-specific CMS content. The few labels/strings are handled by the design system components internally.

---

## Fallback Defaults

**File:** `src/app/[subProduct]/customer/@orchestratorContent/gift/content/index.ts`

```typescript
// Re-exports shared CMS utilities from buy content
export { getCMSContent, clearJourneyContentCache } from "../../buy/content/fallback";
export type { JourneyCMSContent, OperationType, PageType } from "../../buy/content/fallback";

// Gift-specific fallback defaults
export const DEFAULT_COLLECT_GIFT_DETAILS_CONTENT = { ... };
export const DEFAULT_RECIPIENT_DETAILS_CONTENT = { ... };
export const DEFAULT_GIFT_TRANSACTION_SUMMARY_CONTENT = { ... };
export const DEFAULT_GIFT_SUCCESS_CONTENT = { ... };
export const DEFAULT_GIFT_OTP_VERIFICATION_CONTENT = { ... };
```

---

## CMS Content Fetching Pattern

The existing `getCMSContent` function already supports `operation: "gift"`:

```typescript
// From buy/content/fallback.ts
export type OperationType = "buy" | "sell" | "sip" | "gift";

export async function getCMSContent<T>(
  pageType: PageType,
  subProduct = "gold",
  operation: OperationType = "buy",
  partner?: string
): Promise<T> {
  // 1. Check USE_FALLBACK_CONTENT env var → return default if true
  // 2. Fetch from Strapi: digimetal-journey-pages?filters[subProduct]=gold&populate=*
  // 3. Drill into: response.data[0].gift[pageType]
  // 4. Transform via transformCMSResponse()
  // 5. Fallback to defaults on any error
}
```

### What Needs to Change

1. **`PageType` must be extended** to include gift-specific page keys:

```typescript
// Current
export type PageType = "collectTransactionDetails" | "panVerification" | "nameConfirmation" 
  | "transactionSummary" | "thankYou" | "paymentFailure";

// Updated
export type PageType = "collectTransactionDetails" | "panVerification" | "nameConfirmation" 
  | "transactionSummary" | "thankYou" | "paymentFailure"
  | "collectGiftDetails" | "recipientDetails" | "giftTransactionSummary" 
  | "giftSuccess" | "otpVerification";
```

2. **`defaults` map in `getCMSContent`** must include gift defaults:

```typescript
const defaults: Record<PageType, unknown> = {
  // ... existing buy defaults
  collectGiftDetails: DEFAULT_COLLECT_GIFT_DETAILS_CONTENT,
  recipientDetails: DEFAULT_RECIPIENT_DETAILS_CONTENT,
  giftTransactionSummary: DEFAULT_GIFT_TRANSACTION_SUMMARY_CONTENT,
  giftSuccess: DEFAULT_GIFT_SUCCESS_CONTENT,
  otpVerification: DEFAULT_GIFT_OTP_VERIFICATION_CONTENT,
};
```

3. **`transformCMSResponse`** needs gift transform functions:

```typescript
// New transformers in transform.ts
export function transformCollectGiftDetails(strapiData) { ... }
export function transformRecipientDetails(strapiData) { ... }
export function transformGiftTransactionSummary(strapiData) { ... }
export function transformGiftSuccess(strapiData) { ... }
export function transformOtpVerification(strapiData) { ... }
```

---

## Gift Pages — Integration Steps

### For each gift page (`page.tsx`), replace hardcoded fallback with CMS fetch:

**Before (current):**

```typescript
// collect-gift-details/page.tsx
import { DEFAULT_COLLECT_GIFT_DETAILS_CONTENT } from "../content";

export default async function CollectGiftDetailsPage({ params }: PageProps) {
  const { subProduct } = await params;
  // TODO: Fetch CMS content when available
  const cmsContent = DEFAULT_COLLECT_GIFT_DETAILS_CONTENT;
  return <CollectGiftDetailsClient subProduct={subProduct} cmsContent={cmsContent} />;
}
```

**After (CMS integrated):**

```typescript
// collect-gift-details/page.tsx
import { getCMSContent, DEFAULT_COLLECT_GIFT_DETAILS_CONTENT } from "../content";
import { getPartnerConfig } from "@/config/sdk";

type CMSContent = typeof DEFAULT_COLLECT_GIFT_DETAILS_CONTENT;

export default async function CollectGiftDetailsPage({ params }: PageProps) {
  const { subProduct } = await params;
  const subProductKey = subProduct || "gold";
  
  const partnerConfig = await getPartnerConfig();
  const cmsContent = await getCMSContent<CMSContent>(
    "collectGiftDetails",
    subProductKey,
    "gift",
    partnerConfig?.partnerCode
  );
  
  return <CollectGiftDetailsClient subProduct={subProductKey} cmsContent={cmsContent} />;
}
```

### Pages requiring this change:

| Page File | `pageType` Key | Fallback Constant |
|-----------|----------------|-------------------|
| `collect-gift-details/page.tsx` | `"collectGiftDetails"` | `DEFAULT_COLLECT_GIFT_DETAILS_CONTENT` |
| `recipient-details/page.tsx` | `"recipientDetails"` | `DEFAULT_RECIPIENT_DETAILS_CONTENT` |
| `transaction-summary/page.tsx` | `"giftTransactionSummary"` | `DEFAULT_GIFT_TRANSACTION_SUMMARY_CONTENT` |
| `gift-success/page.tsx` | `"giftSuccess"` | `DEFAULT_GIFT_SUCCESS_CONTENT` |
| `otp-verification/page.tsx` | `"otpVerification"` | `DEFAULT_GIFT_OTP_VERIFICATION_CONTENT` |
| `payment-failure/page.tsx` | `"paymentFailure"` | `DEFAULT_PAYMENT_FAILURE_CONTENT` (from buy) |

### Pages already integrated (no change needed):

| Page File | Status |
|-----------|--------|
| `collect-pan-details/page.tsx` | ✅ Uses `getCMSContent("panVerification", ..., "gift")` |
| `validate-name-match/page.tsx` | ✅ Uses `getCMSContent("nameConfirmation", ..., "gift")` |

### Pages with no CMS needed:

| Page File | Reason |
|-----------|--------|
| `transaction-payment/page.tsx` | Payment gateway redirect, no UI labels |
| `collect-email-details/page.tsx` | Simple email input, no CMS prop |

---

## Seed Data (Sample Entry)

**Location:** `seed/digimetal/journey-page/gold.json`

Add `gift` key alongside existing `buy`:

```json
{
  "subProduct": "gold",
  "buy": { ... },
  "gift": {
    "collectGiftDetails": {
      "title": "Gift Gold",
      "submitButtonText": "Proceed",
      "helpAriaLabel": "Get help with gifting gold",
      "holdingsLabel": "Your Holdings",
      "inputSectionTitle": "How much gold do you want to gift",
      "minAmount": 10,
      "maxAmount": 100000,
      "minWeight": 0.01,
      "maxWeight": 100,
      "amountChips": {
        "enabled": true,
        "content": [
          { "order": 1, "value": "1000" },
          { "order": 2, "value": "2000" },
          { "order": 3, "value": "5000", "isPopular": true },
          { "order": 4, "value": "10000" },
          { "order": 5, "value": "20000" }
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
    "recipientDetails": {
      "title": "Recipient Details",
      "submitButtonText": "Proceed to Order",
      "helpAriaLabel": "Get help with recipient details",
      "receiverNameLabel": "Receiver's Name",
      "receiverNamePlaceholder": "Enter receiver name",
      "receiverMobileLabel": "Receiver's Mobile",
      "receiverMobilePlaceholder": "Enter receiver mobile number",
      "noteLabel": "Note",
      "notePlaceholder": "Sending you wishes to brighten up your day!",
      "maxNoteLength": 200,
      "giftCardLabel": "Choose Gift card",
      "scheduleLabel": "Schedule for later"
    },
    "panVerification": {
      "title": "PAN Verification",
      "submitButtonText": "Verify & Proceed",
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
      "helpAriaLabel": "Get help with name confirmation",
      "nameFieldLabel": "Name as per PAN",
      "instructionText": "Please confirm your name matches the PAN records"
    },
    "giftTransactionSummary": {
      "title": "Gift Summary",
      "submitButtonText": "Proceed",
      "helpAriaLabel": "Get help with gift summary",
      "showHelpIcon": true,
      "giftQuantityLabel": "Gift Quantity",
      "purchaseAmountLabel": "Purchase Amount",
      "gstLabel": "GST (3%)",
      "toPayLabel": "To Pay",
      "receiverDetailsTitle": "Receiver Details",
      "paymentSummaryTitle": "Payment summary",
      "infoBannerText": "Credit card payments are not allowed for digital gold purchase as per regulations",
      "secondaryInfoText": ""
    },
    "otpVerification": {
      "title": "Verify OTP",
      "submitButtonText": "Verify",
      "helpAriaLabel": "Get help with OTP verification",
      "otpLabel": "Enter OTP",
      "resendText": "Resend OTP",
      "resendCountdown": 30
    },
    "giftSuccess": {
      "title": "Gift Sent",
      "heading": "We've sent your lovely gift!",
      "submitButtonText": "Go to Homepage",
      "helpAriaLabel": "Get help",
      "disclaimerText": "The end recipient must accept the gift within 5 days, the gold units will be reversed back to the sender's account",
      "instructionsLinkText": "how to receive it",
      "copyLabel": "Copy",
      "shareLabel": "Share",
      "whatsappLabel": "WhatsApp",
      "homepageLabel": "Homepage"
    },
    "paymentFailure": {
      "title": "Payment Failed",
      "submitButtonText": "Try Again",
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
      "buy": { ... },
      "gift": {
        "id": 7,
        "collectGiftDetails": {
          "id": 7,
          "title": "Gift Gold",
          "submitButtonText": "Proceed",
          "holdingsLabel": "Your Holdings",
          "inputSectionTitle": "How much gold do you want to gift",
          "minAmount": 10,
          "maxAmount": 100000,
          "minWeight": 0.01,
          "maxWeight": 100,
          "amountChips": {
            "id": 7,
            "enabled": true,
            "content": [
              { "order": 1, "id": 31, "value": "1000", "isPopular": false },
              { "order": 2, "id": 32, "value": "2000", "isPopular": false },
              { "order": 3, "id": 33, "value": "5000", "isPopular": true },
              { "order": 4, "id": 34, "value": "10000", "isPopular": false },
              { "order": 5, "id": 35, "value": "20000", "isPopular": false }
            ]
          },
          "weightChips": {
            "id": 7,
            "enabled": true,
            "content": [
              { "order": 1, "id": 26, "value": "0.5", "isPopular": false },
              { "order": 2, "id": 27, "value": "1", "isPopular": true },
              { "order": 3, "id": 28, "value": "2", "isPopular": false },
              { "order": 4, "id": 29, "value": "5", "isPopular": false },
              { "order": 5, "id": 30, "value": "10", "isPopular": false }
            ]
          }
        },
        "recipientDetails": {
          "id": 7,
          "title": "Recipient Details",
          "submitButtonText": "Proceed to Order",
          "receiverNameLabel": "Receiver's Name",
          "receiverNamePlaceholder": "Enter receiver name",
          "receiverMobileLabel": "Receiver's Mobile",
          "receiverMobilePlaceholder": "Enter receiver mobile number",
          "noteLabel": "Note",
          "notePlaceholder": "Sending you wishes to brighten up your day!",
          "maxNoteLength": 200,
          "giftCardLabel": "Choose Gift card",
          "scheduleLabel": "Schedule for later"
        },
        "panVerification": { ... },
        "nameConfirmation": { ... },
        "giftTransactionSummary": {
          "id": 7,
          "title": "Gift Summary",
          "submitButtonText": "Proceed",
          "showHelpIcon": true,
          "infoBannerText": "Credit card payments are not allowed for digital gold purchase as per regulations",
          "secondaryInfoText": ""
        },
        "otpVerification": {
          "id": 7,
          "title": "Verify OTP",
          "submitButtonText": "Verify",
          "otpLabel": "Enter OTP",
          "resendText": "Resend OTP",
          "resendCountdown": 30
        },
        "giftSuccess": {
          "id": 7,
          "title": "Gift Sent",
          "heading": "We've sent your lovely gift!",
          "disclaimerText": "The end recipient must accept the gift within 5 days...",
          "instructionsLinkText": "how to receive it"
        },
        "paymentFailure": { ... }
      },
      "assets": { ... }
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
├── buy: operation-config (existing ✅)
│   └── collectTransactionDetails, panVerification, nameConfirmation,
│       transactionSummary, thankYou, paymentFailure
│
├── gift: operation-config (NEW)
│   ├── collectGiftDetails: page-gift-collect-details
│   │   ├── title, submitButtonText, holdingsLabel, inputSectionTitle
│   │   ├── minAmount, maxAmount, minWeight, maxWeight
│   │   ├── amountChips: section-amount-chips
│   │   │   └── content[]: amount-chip { order, value, isPopular }
│   │   └── weightChips: section-weight-chips
│   │       └── content[]: weight-chip { order, value, isPopular }
│   │
│   ├── recipientDetails: page-gift-recipient-details
│   │   └── title, submitButtonText, receiverNameLabel, receiverNamePlaceholder,
│   │       receiverMobileLabel, receiverMobilePlaceholder, noteLabel,
│   │       notePlaceholder, maxNoteLength, giftCardLabel, scheduleLabel
│   │
│   ├── panVerification: page-pan-verification (reused from buy)
│   │   └── title, submitButtonText, panFieldLabel, etc.
│   │
│   ├── nameConfirmation: page-name-confirmation (reused from buy)
│   │   └── title, submitButtonText, nameFieldLabel, instructionText
│   │
│   ├── giftTransactionSummary: page-gift-transaction-summary
│   │   └── title, submitButtonText, showHelpIcon, infoBannerText,
│   │       secondaryInfoText, giftQuantityLabel, purchaseAmountLabel,
│   │       gstLabel, toPayLabel, receiverDetailsTitle, paymentSummaryTitle
│   │
│   ├── otpVerification: page-gift-otp-verification
│   │   └── title, submitButtonText, otpLabel, resendText, resendCountdown
│   │
│   ├── giftSuccess: page-gift-success
│   │   └── title, heading, submitButtonText, disclaimerText,
│   │       instructionsLinkText, copyLabel, shareLabel, whatsappLabel, homepageLabel
│   │
│   └── paymentFailure: page-payment-failure (reused from buy)
│       └── title, submitButtonText, heading, description
│
├── sell: operation-config (future)
├── sip: operation-config (future)
└── assets: journey-assets
    └── successIllustration, failureIllustration, promoBannerLogo, promoBannerQrCode
```
