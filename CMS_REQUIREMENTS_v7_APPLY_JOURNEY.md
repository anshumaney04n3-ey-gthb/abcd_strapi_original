# Loans CMS Requirements v7 - Apply Journey

**Date:** 2026-03-31  
**Status:** IMPLEMENTED  
**Collection Type:** `gold-loan-apply-journey`

---

## 1. Journey Pages Overview

| Step ID | Page | Component | Purpose |
|---------|------|-----------|---------|
| `collect-basic-details` | Collect Basic Details | `GoldLoanBasicDetailsForm` | User enters name, pincode, loan amount, loan type |
| `eligible-lenders-display` | Eligible Lenders | `SelectLender` | Shows eligible lenders based on BRE |
| `success-screen` | Success | `SelectLender` (glLenderProps) | Confirmation after lead submission |
| `bre-regret-screen` | Regret | `ErrorPage` | No eligible lenders found |
| `bre-error-screen` | Error | `ErrorPage` | Technical error during BRE |
| `applied-cases` | Applied Cases | `GoldLoanHistoryCases` | View applied & disbursed history |

---

## 2. Schema (Aligned with Design System)

### CMS Wired Legend

| Status | Meaning |
|:------:|---------|
| ✅ | Field is wired to CMS |
| ❌ | Field is hardcoded in code |

### 2.1 `collectBasicDetails`

| Field | Type | Required | Default | Wired |
|-------|------|:--------:|---------|:-----:|
| `title` | string | Yes | "Basic Details" | ✅ |
| `ctaText` | string | No | "Continue" | ✅ |
| `pifaText` | string | No | "How did you learn about us?" | ✅ |
| `consentText` | string | No | "I authorise Aditya Birla Capital..." | ✅ |
| `consentLinkText` | string | No | "trusted lending partners" | ✅ |
| `consentLinkUrl` | string | No | "/terms" | ✅ |
| `loanTypes` | loan-type[] | No | [...] | ✅ |
| `lenders` | lender-option[] | No | [...] | ✅ |

**loan-type:** (for loan type selection)
| Field | Type | Required | Wired |
|-------|------|:--------:|:-----:|
| `id` | string | Yes | ✅ |
| `label` | string | Yes | ✅ |
| `value` | string | Yes | ✅ |

**lender-option:** (matches `LenderProp` in design system)
| Field | Type | Required | Wired |
|-------|------|:--------:|:-----:|
| `id` | string | Yes | ✅ |
| `name` | string | Yes | ✅ |
| `logo` | media | Yes | ✅ |

### 2.2 `eligibleLenders`

| Field | Type | Required | Default | Wired |
|-------|------|:--------:|---------|:-----:|
| `heading` | string | Yes | "Lenders selected for you" | ✅ |
| `pageTitle` | string | No | "Avail gold loan" | ✅ |
| `appliedTag` | string | No | "Applied" | ✅ |
| `infoBannerMessage` | string | No | "Note: Loan offers are subject to lender policies..." | ✅ |
| `infoBannerVariant` | enum | No | "warning" | ✅ |

### 2.3 `lenderCards` (Matches `LenderCardProps` in design system)

| Field | Type | Required | Wired |
|-------|------|:--------:|:-----:|
| `lenderCards` | lender-card-config[] | No | ✅ |

**lender-card-config:**
| Field | Type | Required | DS Mapping | Wired |
|-------|------|:--------:|------------|:-----:|
| `id` | string | Yes | - | ✅ |
| `variant` | enum | No | `variant` ("standard" / "exclusive") | ✅ |
| `disabled` | boolean | No | `disabled` | ✅ |
| `partner` | partner-info | Yes | `partner` | ✅ |
| `loanInfo` | loan-info | Yes | `loanInfo` | ✅ |
| `ctaButton` | cta-button | Yes | `ctaButton` | ✅ |
| `exclusiveOffer` | exclusive-offer | No | `exclusiveOffer` | ✅ |
| `backgroundSvgSrc` | media | No | `backgroundSvgSrc` | ✅ |
| `starIconLeftSrc` | media | No | `starIconLeftSrc` | ✅ |
| `starIconRightSrc` | media | No | `starIconRightSrc` | ✅ |

**partner-info:** (matches `PartnerInfo`)
| Field | Type | Required | Wired |
|-------|------|:--------:|:-----:|
| `heading` | string | Yes | ✅ |
| `name` | string | Yes | ✅ |
| `logo` | media | Yes | ✅ |
| `logoAlt` | string | No | ✅ |

**loan-info:** (matches `LoanInfo`)
| Field | Type | Required | Wired |
|-------|------|:--------:|:-----:|
| `loanStartsFrom` | loan-info-field | Yes | ✅ |
| `minWeight` | loan-info-field | Yes | ✅ |
| `startingRoi` | loan-info-field | Yes | ✅ |

**loan-info-field:** (matches `LoanInfoField`)
| Field | Type | Required | Wired |
|-------|------|:--------:|:-----:|
| `heading` | string | Yes | ✅ |
| `value` | string | Yes | ✅ |

**cta-button:** (matches `CtaButton`)
| Field | Type | Required | Wired |
|-------|------|:--------:|:-----:|
| `label` | string | Yes | ✅ |
| `disabled` | boolean | No | ✅ |

**exclusive-offer:** (matches `ExclusiveOffer`)
| Field | Type | Required | Wired |
|-------|------|:--------:|:-----:|
| `badgeText` | string | No | ✅ |
| `badgeIcon` | media | No | ✅ |
| `badgeIconAlt` | string | No | ✅ |
| `benefits` | exclusive-benefit[] | No | ✅ |
| `showCornerDecor` | boolean | No | ✅ |

**exclusive-benefit:** (matches `ExclusiveBenefit`)
| Field | Type | Required | Wired |
|-------|------|:--------:|:-----:|
| `id` | string | Yes | ✅ |
| `headline` | string | Yes | ✅ |
| `subtext` | string | Yes | ✅ |

### 2.4 `successScreen`

| Field | Type | Required | Default | Wired |
|-------|------|:--------:|---------|:-----:|
| `title` | string | Yes | "Congratulations!" | ✅ |
| `pageTitle` | string | No | "Avail gold loan" | ✅ |
| `message` | string | Yes | "Your loan application has been successfully submitted to {lenderName}..." | ✅ |
| `ctaText` | string | No | "Done" | ✅ |
| `exploreOtherCtaText` | string | No | "Explore Other Lenders" | ✅ |

### 2.5 `breRegretScreen`

| Field | Type | Required | Default | Wired |
|-------|------|:--------:|---------|:-----:|
| `title` | string | Yes | "We're sorry" | ✅ |
| `pageTitle` | string | No | "Avail gold loan" | ✅ |
| `message` | string | Yes | "You are not eligible for the available lenders" | ✅ |
| `ctaText` | string | No | "Re-Apply" | ✅ |

### 2.6 `breErrorScreen`

| Field | Type | Required | Default | Wired |
|-------|------|:--------:|---------|:-----:|
| `title` | string | Yes | "Something went wrong" | ✅ |
| `pageTitle` | string | No | "Avail gold loan" | ✅ |
| `message` | string | Yes | "We encountered an error while processing your request..." | ✅ |
| `ctaText` | string | No | "Retry" | ✅ |
| `secondaryCtaText` | string | No | "Go Back" | ✅ |

### 2.7 `appliedCases` (Matches `GoldLoanHistoryCasesProps`)

| Field | Type | Required | Default | Wired |
|-------|------|:--------:|---------|:-----:|
| `title` | string | Yes | "Avail gold loan" | ✅ |
| `appliedTitle` | string | No | "Applied Cases" | ✅ |
| `disbursedTitle` | string | No | "Disbursed Cases" | ✅ |
| `appliedDateLabel` | string | No | "Applied Date" | ✅ |
| `appliedAmountLabel` | string | No | "Applied amount" | ✅ |
| `disbursedDateLabel` | string | No | "Date of disbursal" | ✅ |
| `disbursedAmountLabel` | string | No | "Disbursed amount" | ✅ |

### 2.8 `assets`

| Field | Type | Required | Wired |
|-------|------|:--------:|:-----:|
| `shieldIcon` | media | No | ✅ |
| `defaultLenderLogo` | media | No | ✅ |

---

## 3. Expected API Response

**Endpoint:** `GET /api/gold-loan-apply-journey?filters[subProduct][$eq]=gold&populate=*`

```json
{
  "data": [
    {
      "id": 1,
      "subProduct": "gold",
      "partner": "default",
      "collectBasicDetails": {
        "title": "Basic Details",
        "ctaText": "Continue",
        "pifaText": "How did you learn about us?",
        "consentText": "I authorise Aditya Birla Capital Digital Limited to access my data to process my loan application and share with its",
        "consentLinkText": "trusted lending partners",
        "consentLinkUrl": "/terms",
        "loanTypes": [
          { "id": "fresh", "label": "Fresh Loan", "value": "Fresh Loan" },
          { "id": "bt", "label": "Existing Loan Transfer", "value": "Existing Loan Transfer" }
        ],
        "lenders": [
          { "id": "muthoot", "name": "Muthoot FinCorp", "logo": { "url": "/uploads/muthoot-logo.png" } },
          { "id": "iifl", "name": "IIFL Finance", "logo": { "url": "/uploads/iifl-logo.png" } },
          { "id": "rupeek", "name": "Rupeek", "logo": { "url": "/uploads/rupeek-logo.png" } },
          { "id": "other", "name": "Other", "logo": { "url": "/uploads/gold.svg" } }
        ]
      },
      "eligibleLenders": {
        "heading": "Lenders selected for you",
        "pageTitle": "Avail gold loan",
        "appliedTag": "Applied",
        "infoBannerMessage": "Note: Loan offers are subject to lender policies and may change during the loan application process.",
        "infoBannerVariant": "warning"
      },
      "lenderCards": [
        {
          "id": "muthoot",
          "variant": "standard",
          "partner": {
            "heading": "Lending Partner",
            "name": "Muthoot Fincorp",
            "logo": { "url": "/uploads/muthoot-logo.svg" },
            "logoAlt": "Muthoot Fincorp"
          },
          "loanInfo": {
            "loanStartsFrom": { "heading": "Loan starts from", "value": "₹3,000" },
            "minWeight": { "heading": "Min. weight", "value": "2g" },
            "startingRoi": { "heading": "Starting ROI", "value": "0.97% p.m" }
          },
          "ctaButton": { "label": "Apply Now" },
          "backgroundSvgSrc": { "url": "/uploads/RectangleGroup.svg" },
          "starIconLeftSrc": { "url": "/uploads/star-shooting.svg" },
          "starIconRightSrc": { "url": "/uploads/star-shooting-right.svg" }
        },
        {
          "id": "iifl",
          "variant": "standard",
          "partner": {
            "heading": "Lending Partner",
            "name": "IIFL Finance",
            "logo": { "url": "/uploads/iifl-logo.svg" },
            "logoAlt": "IIFL Finance"
          },
          "loanInfo": {
            "loanStartsFrom": { "heading": "Loan starts from", "value": "₹3,000" },
            "minWeight": { "heading": "Min. weight", "value": "1g" },
            "startingRoi": { "heading": "Starting ROI", "value": "0.99% p.m" }
          },
          "ctaButton": { "label": "Apply Now" }
        },
        {
          "id": "rupeek",
          "variant": "exclusive",
          "partner": {
            "heading": "Lending Partner",
            "name": "Rupeek",
            "logo": { "url": "/uploads/rupeek-logo.svg" },
            "logoAlt": "Rupeek"
          },
          "loanInfo": {
            "loanStartsFrom": { "heading": "Loan starts from", "value": "₹30,000" },
            "minWeight": { "heading": "Min. weight", "value": "10g" },
            "startingRoi": { "heading": "Starting ROI", "value": "0.79% p.m" }
          },
          "ctaButton": { "label": "Apply Now" },
          "exclusiveOffer": {
            "badgeText": "Exclusive employee offer",
            "badgeIcon": { "url": "/uploads/star-four-points.svg" },
            "badgeIconAlt": "Exclusive",
            "benefits": [
              { "id": "1", "headline": "90%", "subtext": "PF waiver" },
              { "id": "2", "headline": "25%", "subtext": "additional LTV (upto 85%)" },
              { "id": "3", "headline": "Zero", "subtext": "foreclosure & withdrawal charges" }
            ],
            "showCornerDecor": true
          }
        }
      ],
      "successScreen": {
        "title": "Congratulations!",
        "pageTitle": "Avail gold loan",
        "message": "Your loan application has been successfully submitted to {lenderName}. Your dedicated Relationship Manager will get in touch with you within 24 working hours for further process.",
        "ctaText": "Done",
        "exploreOtherCtaText": "Explore Other Lenders"
      },
      "breRegretScreen": {
        "title": "We're sorry",
        "pageTitle": "Avail gold loan",
        "message": "You are not eligible for the available lenders",
        "ctaText": "Re-Apply"
      },
      "breErrorScreen": {
        "title": "Something went wrong",
        "pageTitle": "Avail gold loan",
        "message": "We encountered an error while processing your request. Please try again.",
        "ctaText": "Retry",
        "secondaryCtaText": "Go Back"
      },
      "appliedCases": {
        "title": "Avail gold loan",
        "appliedTitle": "Applied Cases",
        "disbursedTitle": "Disbursed Cases",
        "appliedDateLabel": "Applied Date",
        "appliedAmountLabel": "Applied amount",
        "disbursedDateLabel": "Date of disbursal",
        "disbursedAmountLabel": "Disbursed amount"
      },
      "assets": {
        "shieldIcon": { "url": "/uploads/shield-check.svg" },
        "defaultLenderLogo": { "url": "/uploads/gold.svg" }
      }
    }
  ],
  "meta": {
    "pagination": { "page": 1, "pageSize": 25, "pageCount": 1, "total": 1 }
  }
}
```

---

## 4. Design System Mapping

| CMS Field | Design System Type | Notes |
|-----------|-------------------|-------|
| `lenderCards[].partner` | `PartnerInfo` | Direct 1:1 mapping |
| `lenderCards[].loanInfo` | `LoanInfo` | Direct 1:1 mapping |
| `lenderCards[].ctaButton` | `CtaButton` | `onClick` added at runtime |
| `lenderCards[].exclusiveOffer` | `ExclusiveOffer` | Direct 1:1 mapping |
| `lenderCards[].variant` | `'standard' \| 'exclusive'` | Direct enum |
| `collectBasicDetails.lenders` | `LenderProp[]` | Direct 1:1 mapping |

**Minimal Transformation Required:**
- Media URLs: `getCmsMediaUrl(field.logo)` 
- Add runtime handlers: `ctaButton.onClick`, `onValidationChange`

---

## 5. Wiring Summary

| Section | Total Fields | ✅ Wired | ❌ Hardcoded |
|---------|:------------:|:--------:|:------------:|
| collectBasicDetails | 8 | 8 | 0 |
| loan-type | 3 | 3 | 0 |
| lender-option | 3 | 3 | 0 |
| eligibleLenders | 5 | 5 | 0 |
| lenderCards | 10 | 10 | 0 |
| partner-info | 4 | 4 | 0 |
| loan-info | 3 | 3 | 0 |
| loan-info-field | 2 | 2 | 0 |
| cta-button | 2 | 2 | 0 |
| exclusive-offer | 5 | 5 | 0 |
| exclusive-benefit | 3 | 3 | 0 |
| successScreen | 5 | 5 | 0 |
| breRegretScreen | 4 | 4 | 0 |
| breErrorScreen | 5 | 5 | 0 |
| appliedCases | 7 | 7 | 0 |
| assets | 2 | 2 | 0 |
| **TOTAL** | **71** | **71** | **0** |

---

## 6. Implementation Files

| File | Purpose |
|------|---------|
| `src/app/[subProduct]/customer/@orchestratorContent/apply/content/fallback.ts` | Default content with design-system aligned types |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/content/index.ts` | CMS fetch and transform logic |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/collect-basic-details/page.tsx` | Server component fetching CMS |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/collect-basic-details/CollectBasicDetailsClient.tsx` | Wired client component |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/eligible-lenders-display/page.tsx` | Server component fetching CMS |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/eligible-lenders-display/EligibleLendersClient.tsx` | Wired client with lenderCards |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/success-screen/page.tsx` | Server component fetching CMS |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/success-screen/SuccessScreenClient.tsx` | Wired client component |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/bre-regret-screen/page.tsx` | Server component fetching CMS |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/bre-regret-screen/BRERegretClient.tsx` | Wired client component |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/bre-error-screen/page.tsx` | Server component fetching CMS |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/bre-error-screen/BREErrorClient.tsx` | Wired client component |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/applied-cases/page.tsx` | Server component fetching CMS |
| `src/app/[subProduct]/customer/@orchestratorContent/apply/applied-cases/AppliedcasesClient.tsx` | Wired client component |

---

## 8. Strapi Schema Creation Checklist

- [ ] Create `gold-loan-apply-journey` collection type
- [ ] Add `subProduct` enum (gold, personal, home)
- [ ] Add `partner` string (default: "default")
- [ ] Create components:
  - [ ] `collect-basic-details`
  - [ ] `eligible-lenders`
  - [ ] `lender-card-config` (with nested partner, loanInfo, ctaButton, exclusiveOffer)
  - [ ] `partner-info`
  - [ ] `loan-info`
  - [ ] `loan-info-field`
  - [ ] `cta-button`
  - [ ] `exclusive-offer`
  - [ ] `exclusive-benefit`
  - [ ] `success-screen`
  - [ ] `bre-regret-screen`
  - [ ] `bre-error-screen`
  - [ ] `applied-cases`
  - [ ] `loan-type`
  - [ ] `lender-option`
  - [ ] `journey-assets`
