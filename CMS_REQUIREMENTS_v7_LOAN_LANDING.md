# Loans CMS Requirements v7 - Landing Page

**Date:** 2026-03-31  
**Status:** IMPLEMENTED  
**Collection Type:** `loans-landing-pages`

---

## 1. Components

### 1.1 Landing Page Sections

| Key | Component | Purpose |
|-----|-----------|---------|
| `header` | `landing-header` | Logo configuration |
| `hero` | `landing-hero` | Hero section with title, CTAs, partner logos |
| `widget` | `landing-widget` | Login widget (unauthenticated) |
| `calculator` | `landing-calculator` | Gold loan calculator |
| `trustedPartners` | `landing-trusted-partners` | Lender comparison table |
| `eligibility` | `landing-eligibility` | Eligibility criteria |
| `process` | `landing-process` | How Gold Loan Works tabs |
| `securityFeatures` | `landing-security-features` | Benefits/security features |
| `faq` | `landing-faq` | FAQ section with tabs |
| `footer` | `landing-footer` | Footer with reference details |
| `appPromo` | `landing-app-promo` | App download promotion |
| `mobileNavigation` | `landing-mobile-nav` | Mobile navigation |
| `sectionLabels` | `landing-section-labels` | Section title overrides |

### 1.2 Reusable Components

| Component | Used In |
|-----------|---------|
| `partner-logo` | `hero.partnerLogos[]` |
| `product-highlighter` | `hero.productHighlighters[]` |
| `process-tab` | `process.tabs[]` |
| `process-step` | `process.tabs[].steps[]` |
| `faq-tab` | `faq.tabs[]` |
| `faq-item` | `faq.tabs[].items[]` |
| `trusted-partner-column` | `trustedPartners.columns[]` |
| `trusted-partner-row` | `trustedPartners.rows[]` |
| `eligibility-item` | `eligibility.items[]` |
| `security-feature` | `securityFeatures.items[]` |
| `footer-feature` | `footer.features[]` |
| `cta-button` | `appPromo.ctaButtons[]` |

---

## 2. Schema

### 2.1 `header`

| Field | Type | Required |
|-------|------|:--------:|
| `logo` | media | Yes |
| `logoAlt` | string | No |
| `logoSize` | integer | No |
| `mobileHeaderLogo` | media | No |

### 2.2 `hero`

| Field | Type | Required |
|-------|------|:--------:|
| `title` | string | Yes |
| `titleAuthenticated` | string | No |
| `priceLabel` | string | No |
| `priceValue` | string | No |
| `description` | string | Yes |
| `descriptionHighlight` | string | No |
| `ctaText` | string | No |
| `image` | media | No |
| `imageAuthenticated` | media | No |
| `imageAlt` | string | No |
| `partnerLogos` | partner-logo[] | No |
| `partnerLogosAuthenticated` | partner-logo[] | No |
| `productHighlighters` | product-highlighter[] | No |
| `backgroundGradient` | string | No |
| `showSeparator` | boolean | No |

**partner-logo:**
| Field | Type | Required |
|-------|------|:--------:|
| `id` | string | Yes |
| `src` | media | Yes |
| `alt` | string | Yes |

**product-highlighter:**
| Field | Type | Required |
|-------|------|:--------:|
| `id` | string | Yes |
| `text` | string | Yes |
| `showIcon` | boolean | No |
| `order` | integer | No |

### 2.3 `widget`

| Field | Type | Required |
|-------|------|:--------:|
| `headerTitle` | string | Yes |
| `title` | string | Yes |
| `mobileInputPlaceholder` | string | No |
| `consentLabel` | string | No |
| `termsText` | string | No |
| `termsUrl` | string | No |
| `privacyText` | string | No |
| `privacyUrl` | string | No |
| `ctaButtonText` | string | No |
| `ctaTrustText` | string | No |
| `ctaLoadingText` | string | No |

### 2.4 `calculator`

| Field | Type | Required |
|-------|------|:--------:|
| `title` | string | Yes |
| `subtitle` | string | No |
| `ctaText` | string | No |
| `goldRateKarat` | integer | No |

### 2.5 `trustedPartners`

| Field | Type | Required |
|-------|------|:--------:|
| `title` | string | No |
| `subtitle` | string | No |
| `columns` | trusted-partner-column[] | Yes |
| `rows` | trusted-partner-row[] | Yes |
| `ctaText` | string | No |

**trusted-partner-column:**
| Field | Type | Required |
|-------|------|:--------:|
| `id` | string | Yes |
| `name` | string | Yes |
| `logoUrl` | media | Yes |
| `highlighted` | boolean | No |

**trusted-partner-row:**
| Field | Type | Required |
|-------|------|:--------:|
| `id` | string | Yes |
| `label` | string | Yes |
| `values` | string[] | Yes |

### 2.6 `eligibility`

| Field | Type | Required |
|-------|------|:--------:|
| `title` | string | No |
| `items` | eligibility-item[] | Yes |

**eligibility-item:**
| Field | Type | Required |
|-------|------|:--------:|
| `id` | string | Yes |
| `label` | string | Yes |
| `value` | string | Yes |
| `alternateValueBackground` | boolean | No |

### 2.7 `process`

| Field | Type | Required |
|-------|------|:--------:|
| `title` | string | Yes |
| `titleAuthenticated` | string | No |
| `imageSrc` | media | No |
| `decorativeImageSrc` | media | No |
| `tabs` | process-tab[] | Yes |
| `ctaText` | string | No |

**process-tab:**
| Field | Type | Required |
|-------|------|:--------:|
| `id` | string | Yes |
| `label` | string | Yes |
| `steps` | process-step[] | Yes |
| `image` | media | No |
| `ctaText` | string | No |

**process-step:**
| Field | Type | Required |
|-------|------|:--------:|
| `number` | integer | Yes |
| `text` | string | Yes |

### 2.8 `securityFeatures`

| Field | Type | Required |
|-------|------|:--------:|
| `items` | security-feature[] | Yes |
| `desktopBackgroundUrl` | media | No |
| `mobileBackgroundUrl` | media | No |

**security-feature:**
| Field | Type | Required |
|-------|------|:--------:|
| `id` | string | Yes |
| `title` | string | Yes |
| `description` | text | Yes |
| `iconUrl` | media | No |

### 2.9 `faq`

| Field | Type | Required |
|-------|------|:--------:|
| `title` | string | Yes |
| `tabs` | faq-tab[] | No |
| `items` | faq-item[] | No |
| `defaultOpenIds` | string[] | No |
| `viewMoreButtonText` | string | No |
| `disclaimerLabel` | string | No |
| `disclaimerText` | text | No |

**faq-tab:**
| Field | Type | Required |
|-------|------|:--------:|
| `id` | string | Yes |
| `label` | string | Yes |
| `defaultOpenIds` | string[] | No |
| `items` | faq-item[] | Yes |

**faq-item:**
| Field | Type | Required |
|-------|------|:--------:|
| `id` | string | Yes |
| `question` | string | Yes |
| `answer` | text | Yes |

### 2.10 `footer`

| Field | Type | Required |
|-------|------|:--------:|
| `referenceHeading` | string | No |
| `referenceName` | string | No |
| `referenceLogo` | media | No |
| `referenceCertification` | string | No |
| `sideImage` | media | No |
| `sideImageAlt` | string | No |
| `features` | footer-feature[] | No |

**footer-feature:**
| Field | Type | Required |
|-------|------|:--------:|
| `id` | string | Yes |
| `text` | string | Yes |

### 2.11 `appPromo`

| Field | Type | Required |
|-------|------|:--------:|
| `houseLogoSrc` | media | No |
| `qrSrc` | media | No |
| `phoneImageSrc` | media | No |
| `ctaButtons` | cta-button[] | No |

**cta-button:**
| Field | Type | Required |
|-------|------|:--------:|
| `label` | string | Yes |
| `link` | string | Yes |
| `iconSrc` | media | No |
| `iconAlt` | string | No |

### 2.12 `mobileNavigation`

| Field | Type | Required |
|-------|------|:--------:|
| `footerBannerText` | string | No |
| `appStoreButtonIcon` | string | No |
| `appStoreButtonLabel` | string | No |
| `appStoreButtonUrl` | string | No |
| `playStoreButtonIcon` | string | No |
| `playStoreButtonLabel` | string | No |
| `playStoreButtonUrl` | string | No |

### 2.13 `sectionLabels`

| Field | Type | Required |
|-------|------|:--------:|
| `eligibilityTitle` | string | No |
| `trustedPartnersTitle` | string | No |
| `trustedPartnersSubtitle` | string | No |
| `benefitsTitle` | string | No |

---

## 3. Expected API Response

**Endpoint:** `GET /api/loans-landing-pages?filters[subProduct][$eq]=gold&populate=*`

```json
{
  "data": [
    {
      "id": 1,
      "subProduct": "gold",
      "partner": "default",
      "header": {
        "logo": { "url": "/uploads/abcd_logo.svg" },
        "logoAlt": "ABCD Logo",
        "logoSize": 40
      },
      "hero": {
        "title": "Easy and Hassle-Free\nGold Loans",
        "titleAuthenticated": "Easy and Hassle-Free Gold Loans",
        "priceLabel": "starting at just",
        "priceValue": "₹ 3,000 +",
        "description": "Multiple Trusted Lenders, 24-Hour Disbursal, 13,000+ Pincodes servicability.",
        "descriptionHighlight": "24-Hour",
        "ctaText": "Apply Now",
        "image": { "url": "/uploads/hero-bg-unauth.png" },
        "imageAuthenticated": { "url": "/uploads/hero-bg.png" },
        "partnerLogos": [
          { "id": "1", "src": { "url": "/uploads/muthoot-logo-new.png" }, "alt": "Muthoot Finance" }
        ],
        "productHighlighters": [
          { "id": "1", "text": "Instant disbursal", "showIcon": true, "order": 1 }
        ],
        "showSeparator": true
      },
      "widget": {
        "headerTitle": "Avail Gold Loan",
        "title": "Enter your details to get started",
        "consentLabel": "I agree with",
        "termsText": "Terms & Conditions",
        "termsUrl": "https://www.adityabirlacapital.com/abc-digital/terms-conditions",
        "ctaButtonText": "Apply for Gold Loan",
        "ctaTrustText": "Join 1L+ investors trusting ABCD for Gold Loans"
      },
      "calculator": {
        "title": "Gold Loan Calculator",
        "ctaText": "Apply Now",
        "goldRateKarat": 24
      },
      "trustedPartners": {
        "title": "Trusted Lending Partners",
        "subtitle": "Quick approvals. Secure gold loans made simple.",
        "columns": [
          { "id": "iifl", "name": "IIFL Finance", "logoUrl": { "url": "/uploads/iifl-logo.png" }, "highlighted": true }
        ],
        "rows": [
          { "id": "min-loan", "label": "Minimum Loan Amount", "values": ["₹3,000 onwards", "₹3,000 onwards"] }
        ],
        "ctaText": "Apply Now"
      },
      "eligibility": {
        "title": "Gold Loan Eligibility",
        "items": [
          { "id": "nationality", "label": "Nationality", "value": "Must be an Indian Citizen" }
        ]
      },
      "process": {
        "title": "Gold Loan Process",
        "titleAuthenticated": "How Gold Loan Works?",
        "imageSrc": { "url": "/uploads/process-photo.png" },
        "tabs": [
          {
            "id": "apply",
            "label": "Apply Online",
            "steps": [
              { "number": 1, "text": "Download the ABCD App and register yourself" }
            ],
            "image": { "url": "/uploads/how-it-works-buy.png" },
            "ctaText": "Apply Now"
          }
        ],
        "ctaText": "Apply Now"
      },
      "securityFeatures": {
        "items": [
          { "id": "1", "title": "High Loan to Value", "description": "Up to 85% LTV ratio", "iconUrl": { "url": "/uploads/icon-rupee.svg" } }
        ],
        "desktopBackgroundUrl": { "url": "/uploads/background.svg" }
      },
      "faq": {
        "title": "Frequently Asked Questions",
        "tabs": [
          {
            "id": "general",
            "label": "General",
            "defaultOpenIds": ["1"],
            "items": [
              { "id": "1", "question": "What is the minimum gold purity?", "answer": "18 karats minimum." }
            ]
          }
        ],
        "defaultOpenIds": ["1"],
        "viewMoreButtonText": "View More",
        "disclaimerLabel": "Disclaimer :",
        "disclaimerText": "The answers provided here are for informative purposes..."
      },
      "footer": {
        "referenceHeading": "Powered by",
        "referenceName": "ABCD",
        "referenceLogo": { "url": "/uploads/logo.svg" },
        "sideImage": { "url": "/uploads/footer-side.svg" },
        "features": [
          { "id": "1", "text": "Get Instant Offer" }
        ]
      },
      "appPromo": {
        "houseLogoSrc": { "url": "/uploads/abcd-logo.png" },
        "qrSrc": { "url": "/uploads/qr-code.png" },
        "phoneImageSrc": { "url": "/uploads/phone.png" },
        "ctaButtons": [
          { "label": "App Store", "link": "https://apps.apple.com/", "iconSrc": { "url": "/uploads/apple.svg" } }
        ]
      },
      "mobileNavigation": {
        "footerBannerText": "Download the app",
        "appStoreButtonLabel": "App Store",
        "appStoreButtonUrl": "https://apps.apple.com"
      },
      "sectionLabels": {
        "eligibilityTitle": "Gold Loan Eligibility",
        "trustedPartnersTitle": "Trusted Lending Partners"
      }
    }
  ],
  "meta": {
    "pagination": { "page": 1, "pageSize": 25, "pageCount": 1, "total": 1 }
  }
}
```

---

## 4. Strapi Schema Creation Checklist

- [ ] Create `loans-landing-pages` collection type
- [ ] Add `subProduct` enum field (gold, personal, home)
- [ ] Add `partner` string field with default "default"
- [ ] Create component schemas in `loans-landing` category
- [ ] Create reusable component schemas (partner-logo, process-tab, faq-item, etc.)
