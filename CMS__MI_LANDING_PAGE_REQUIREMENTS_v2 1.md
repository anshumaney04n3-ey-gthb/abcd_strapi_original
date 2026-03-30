# Insurance CMS Landing Page Requirements v2

**Date:** 2026-03-15  
**Purpose:** Sync UAT Strapi with LOCAL configuration for Insurance Landing Page

---

## Table of Contents
- [1. Landing Page Overview](#1-landing-page-overview)
- [2. Component Requirements](#2-component-requirements)
  - [2.1 New Components](#21-new-components)
- [3. Sample Values](#3-sample-values)
- [4. Expected API Response](#4-expected-api-response)
- [5. Summary](#5-summary)

---

## 1. Landing Page Overview

**Content Type:** `insurance-landing-page`  
**API Endpoint:** `GET /api/insurance-landing-pages?filters[subProduct][$eq]=motor&populate=*`

---

## 2. Component Requirementsx       

### 2.1 New Components 

| Component Name      | Type      | Description                           |
|--------------------|-----------|---------------------------------------|
| `coverageComparison` | Component | Coverage comparison section           |
| `motorStatistics`  | Component    | Motor statistics section              |
| `widgetTabs`       | Component    | Widget tabs for insurance plans       |
| `insuranceTypes`   | Component    | Insurance type selection              |
| `motorCriticalTitle` | String    | Motor Critical Title                  |
| `motorCriticalSubtitle`   | String    | Motor Critical sub Title              |
| `typeOfMotorTitle`         | String    | Type of motor title                   |
| `typeOfMotorDescription`    | String    | Type of motor description             |
| `coverageComparisonTitle`   | String    | coverage comparison title             |
| `coverageComparisonCoveredTitle` | String    | coverage comparison covered title     |
| `coverageComparisonNotCoveredTitle` | String    | coverage comparison not covered title |
| `addOnsTitle` | String    | add ons title                         |
| `addOnsDescription`   | String    | add ons description                   |
| `getStartedTitle`         | String    | get started title                     |
| `getStartedDescription`     | String    | get started description               |
| `vehicleTrackEyebrow`       | String    | Vehicle track eyebrow                 |
| `vehicleTrackTitleLead`     | String    | Vehicle track title lead              |
| `vehicleTrackTitleEmphasis` | String    | Vehicle track title emphasis          |
| `vehicleTrackMobileTitleLead` | String    | Vehicle track mobile title ead        |
| `vehicleTrackMobileTitleEmphasis` | String    | Vehicle track mobile title emphasis   |
| `vehicleTrackMobileSubtitle` | String    | Vehicle track mobile subtitle         |
| `vehicleTrackFromLabel`     | String    | Vehicle track from label              |
| `howMotorInsuranceWorksTitle` | String    | How motor insurance works title       |
| `learnMoreTitle` | String    | learn more title                      |
| `learnMoreSubtitle`   | String    | learn more subtitle                   |
| `learnMoreBack`         | String    | learn more back                       |
| `learnMoreModalLabel`       | String    | learn more modal label                |
| `vehicleBannerAppLabel`     | String    | vehicle banner app label              |
| `vehicleBannerTitle`        | String    | vehicle banner title                  |
| `vehicleBannerMobileTitle`  | String    | vehicle banner mobile title           |
| `vehicleBannerSubtitle`     | String    | vehicle banner subtitle               |
| `vehicleBannerMobileSubtitle` | String    | vehicle banner mobile subtitle        |
| `vehicleBannerFromLabel`   | String    | vehicle banner from label             |
| `coverageComparisonSubtitle` | String    | coverage comparison subtitle          |


#### coverageComparison (Component Structure)
```
├── enabled (Boolean)
└── content (Repeatable)
    ├── coveredItems (Array of Objects)
    │   ├── id (String, required)
    │   ├── title (String, required)
    │   ├── description (String, required)
    │   ├── iconUrl (String, required)
    │   └── components (Array of Objects) // Optional, for nested/related coverage items
    ├── notCoveredItems (Array of Objects)
    │   ├── verdict (String, required, e.g., "negative")
    │   ├── title (String, optional)
    │   └── description (String, optional)
```

#### motorStatisticsItems (Component Structure)
```
├── id (Integer)
├── enabled (Boolean)
└── content (Repeatable)
    ├── order (Integer)
    ├── id (String)
    ├── value (String)
    ├── description (String)
    ├── iconUrl (String)
```

#### widgetTabs (Component Structure)
```
├── id (Integer)
├── enabled (Boolean)
└── content (Repeatable)
    ├── id (String)
    ├── label (String)
    ├── order (Integer)
    ├── tabImage (String)
    ├── icon (String)
    ├── startingPrice (String)
    ├── widgetInsuranceTitle (String, optional)
    ├── widgetBInsuranceTitle (String, optional)
```

#### insuranceTypes (Component Structure)
```
├── items (Repeatable)
    ├── id (String)
    ├── title (String)
    ├── description (String)
    ├── image (String)
    ├── buttonText (String)
    ├── order (Integer)
```

#### workTabs (Component Structure)
```
├── id (Integer)
├── enabled (Boolean)
└── content (Repeatable)
    ├── order (Integer)
    ├── id (Integer)
    ├── tabId (String)
    ├── label (String)
    ├── ctaText (String)
    ├── image (Object)
    │   ├── id (Integer)
    │   ├── documentId (String)
    │   ├── name (String)
    │   ├── alternativeText (String|null)
    │   ├── caption (String|null)
    │   ├── width (Integer)
    │   ├── height (Integer)
    │   ├── formats (Object)
    │   │   └── thumbnail (Object)
    │   │       ├── ext (String)
    │   │       ├── url (String)
    │   │       ├── hash (String)
    │   │       ├── mime (String)
    │   │       ├── name (String)
    │   │       ├── path (String|null)
    │   │       ├── size (Number)
    │   │       ├── width (Integer)
    │   │       ├── height (Integer)
    │   │       └── sizeInBytes (Integer)
    │   ├── hash (String)
    │   ├── ext (String)
    │   ├── mime (String)
    │   ├── size (Number)
    │   ├── url (String)
    │   ├── previewUrl (String|null)
    │   ├── provider (String)
    │   ├── provider_metadata (Object|null)
    │   ├── createdAt (String)
    │   ├── updatedAt (String)
    │   └── publishedAt (String)
    ├── steps (Repeatable)
    │   ├── order (Integer)
    │   ├── id (Integer)
    │   ├── number (Integer)
    │   └── text (String)
```

## 3. Sample Values

### coverageComparison
```json
{
  "coverageComparison": {
    "enabled": true,
    "content": [
      {
        "coveredItems": [
          {
            "id": "1",
            "title": "5.8 Lakh",
            "description": "Motor vehicle accidents in India annually",
            "iconUrl": "${LANDING_ASSETS}/motorAccidentLogo.png",
            "components": [
              {
                "id": "1.1",
                "title": "Sub-statistic",
                "description": "Sub-statistic description",
                "iconUrl": "${LANDING_ASSETS}/subIcon.png"
              }
            ]
          },
          {
            "id": "2",
            "title": "₹2.5 Lakh",
            "description": "India's most trusted refinery ensures purity and reliability.",
            "iconUrl": "${LANDING_ASSETS}/motorClaimLogo.png"
          },
          {
            "id": "3",
            "title": "Legal Requirements Changed in 2025",
            "description": "New motor vehicle regulations introduced in 2025 have strengthened insurance mandates, increased coverage limits, and imposed stricter penalties for non-compliance.",
            "iconUrl": "${LANDING_ASSETS}/motorLegalRequirementLogo.png"
          },
          {
            "id": "4",
            "title": "72%",
            "description": "Vehicles in India are under-insured with only basic third-party cover",
            "iconUrl": "${LANDING_ASSETS}/motorThirdPartyCoverLogo.png"
          },
          {
            "id": "5",
            "title": "₹2,500",
            "description": "Fine for driving without a valid insurance",
            "iconUrl": "${LANDING_ASSETS}/motorFineLogo.png"
          }
        ],
        "notCoveredItems": [
          {
            "verdict": "negative",
            "title": "Accidents:",
            "description": "Repairs or replacement if your vehicle is damaged due to a collision with another vehicle or object."
          },
          {
            "verdict": "negative",
            "title": "Invalid Licence or Policy:",
            "description": "Driving with an expired licence or insurance voids coverage."
          },
          {
            "verdict": "negative",
            "title": "Mechanical Wear and Tear:",
            "description": "Routine wear, mechanical or electrical breakdowns are excluded."
          },
          {
            "verdict": "negative",
            "title": "Geographical Limits:",
            "description": "Damages outside India or during illegal usage are not covered."
          },
          { "verdict": "negative" },
          { "verdict": "negative" }
        ]
      }
    ]
  }
}
```

### motorStatisticsItems
```json
{
  "motorStatisticsItems": {
    "id": 63,
    "enabled": true,
    "content": [
      {
        "order": 1,
        "id": "1",
        "value": "5.8 Lakh",
        "description": "Motor vehicle accidents in India annually",
        "iconUrl": "${LANDING_ASSETS}/statistic1.png"
      },
      {
        "order": 2,
        "id": "2",
        "value": "₹2.5 Lakh",
        "description": "Average motor accident claim amount",
        "iconUrl": "${LANDING_ASSETS}/statistic2.png"
      },
      {
        "order": 3,
        "id": "3",
        "value": "72%",
        "description": "Vehicles in India are under-insured with only basic third-party cover",
        "iconUrl": "${LANDING_ASSETS}/statistic3.png"
      },
      {
        "order": 4,
        "id": "4",
        "value": "₹2,500",
        "description": "Fine for driving without a valid insurance",
        "iconUrl": "${LANDING_ASSETS}/statistic4.png"
      }
    ]
  }
}
```

### widgetTabs
```json
{
  "widgetTabs": {
    "id": 1,
    "enabled": true,
    "content": [
      {
        "id": "tab1",
        "label": "Comprehensive",
        "order": 1,
        "tabImage": "${LANDING_ASSETS}/tabImage1.png",
        "icon": "star",
        "startingPrice": "999",
        "widgetInsuranceTitle": "Comprehensive Insurance",
        "widgetBInsuranceTitle": "Basic Coverage"
      },
      {
        "id": "tab2",
        "label": "Third Party",
        "order": 2,
        "tabImage": "${LANDING_ASSETS}/tabImage2.png",
        "icon": "shield",
        "startingPrice": "499",
        "widgetInsuranceTitle": "Third Party Insurance",
        "widgetBInsuranceTitle": "Basic Liability"
      }
    ]
  }
}
```

### insuranceTypes
```json
{
  "insuranceTypes": {
    "id": 1,
    "enabled": true,
    "content": [
      {
        "id": "type1",
        "title": "Comprehensive",
        "description": "Comprehensive coverage for your vehicle",
        "image": "${LANDING_ASSETS}/comprehensiveInsurance.png",
        "buttonText": "Get Quote",
        "order": 1
      },
      {
        "id": "type2",
        "title": "Third Party",
        "description": "Basic coverage as per legal requirements",
        "image": "${LANDING_ASSETS}/thirdPartyInsurance.png",
        "buttonText": "Get Quote",
        "order": 2
      }
    ]
  }
}
```

### workTabs
```json
{
  "workTabs": {
    "id": 1,
    "enabled": true,
    "content": [
      {
        "order": 1,
        "id": 1,
        "tabId": "tab1",
        "label": "Step 1",
        "ctaText": "Get Started",
        "image": {
          "id": 1,
          "documentId": "doc1",
          "name": "step1.png",
          "alternativeText": null,
          "caption": null,
          "width": 800,
          "height": 600,
          "formats": {
            "thumbnail": {
              "ext": ".png",
              "url": "/uploads/thumbnail_step1.png",
              "hash": "hash1",
              "mime": "image/png",
              "name": "thumbnail_step1",
              "path": null,
              "size": 1234,
              "width": 150,
              "height": 150,
              "sizeInBytes": 1234
            }
          },
          "hash": "hash1",
          "ext": ".png",
          "mime": "image/png",
          "size": 1234,
          "url": "/uploads/step1.png",
          "previewUrl": null,
          "provider": "local",
          "provider_metadata": null,
          "createdAt": "2023-03-15T12:00:00.000Z",
          "updatedAt": "2023-03-15T12:00:00.000Z",
          "publishedAt": "2023-03-15T12:00:00.000Z"
        },
        "steps": [
          {
            "order": 1,
            "id": 1,
            "number": 1,
            "text": "Register online"
          },
          {
            "order": 2,
            "id": 2,
            "number": 2,
            "text": "Provide vehicle details"
          }
        ]
      },
      {
        "order": 2,
        "id": 2,
        "tabId": "tab2",
        "label": "Step 2",
        "ctaText": "Next Steps",
        "image": {
          "id": 2,
          "documentId": "doc2",
          "name": "step2.png",
          "alternativeText": null,
          "caption": null,
          "width": 800,
          "height": 600,
          "formats": {
            "thumbnail": {
              "ext": ".png",
              "url": "/uploads/thumbnail_step2.png",
              "hash": "hash2",
              "mime": "image/png",
              "name": "thumbnail_step2",
              "path": null,
              "size": 1234,
              "width": 150,
              "height": 150,
              "sizeInBytes": 1234
            }
          },
          "hash": "hash2",
          "ext": ".png",
          "mime": "image/png",
          "size": 1234,
          "url": "/uploads/step2.png",
          "previewUrl": null,
          "provider": "local",
          "provider_metadata": null,
          "createdAt": "2023-03-15T12:00:00.000Z",
          "updatedAt": "2023-03-15T12:00:00.000Z",
          "publishedAt": "2023-03-15T12:00:00.000Z"
        },
        "steps": [
          {
            "order": 1,
            "id": 3,
            "number": 1,
            "text": "Choose a plan"
          },
          {
            "order": 2,
            "id": 4,
            "number": 2,
            "text": "Make the payment"
          }
        ]
      }
    ]
  }
}
```

### String Sample Values
```json
{
  "motorCriticalTitle": "Why Motor Insurance is Critical in India",
  "motorCriticalSubtitle": "These statistics show why every vehicle owner needs comprehensive insurance protection.",
  "typeOfMotorTitle": "Types of Motor Insurance",
  "typeOfMotorDescription": "Motor insurance is essential for protecting vehicles against unforeseen risks and is broadly classified into three types based on the vehicle's nature and purpose.",
  "coverageComparisonTitle": "Coverage Under Motor Insurance",
  "coverageComparisonCoveredTitle": "Covered",
  "coverageComparisonNotCoveredTitle": "Not Covered",
  "addOnsTitle": "Choose Add-Ons for Extra Protection",
  "addOnsDescription": "Add-ons are optional covers that enhance your basic motor insurance policy and provide extra protection. Keep in mind that opting for these add-ons will increase your premium but offer valuable benefits tailored to your needs.",
  "getStartedTitle": "Get started with motor insurance",
  "getStartedDescription": "Buying a motor insurance policy through Aditya Birla Capital Digital is simple, secure, and completely digital.",
  "vehicleTrackEyebrow": "The ABCD app",
  "vehicleTrackTitleLead": "Stay on top of all your vehicle's info with",
  "vehicleTrackTitleEmphasis": "ABCD's Vehicle Track",
  "vehicleTrackMobileTitleLead": "Everything Finance",
  "vehicleTrackMobileTitleEmphasis": "as simple as ABCD",
  "vehicleTrackMobileSubtitle": "Download the ABCD app and start doing more with your money everyday",
  "vehicleTrackFromLabel": "From the house of",
  "howMotorInsuranceWorksTitle": "How does Motor Insurance Works?",
  "learnMoreTitle": "Learn More",
  "learnMoreSubtitle": "Understanding key terms and policies can make it easier to choose, buy, renew, or claim your motor vehicle insurance policy online",
  "learnMoreBack": "Back to Learn More",
  "learnMoreModalLabel": "Motor Insurance Details",
  "vehicleBannerAppLabel": "The ABCD app",
  "vehicleBannerTitle": "Stay on top of all your\nvehicle's info with|ABCD's Vehicle Track",
  "vehicleBannerMobileTitle": "Everything Finance\nas simple as ABCD",
  "vehicleBannerSubtitle": "Monitor Insurance & PUC Expiry, Track Pending Challans\nInstantly, Stay Updated on Fuel Prices & Valuation.",
  "vehicleBannerMobileSubtitle": "Download the ABCD app and start doing more with your money everyday",
  "vehicleBannerFromLabel": "From the house of",
  "coverageComparisonSubtitle": "When buying motor insurance, know what’s covered and excluded to avoid surprises during claims. A comprehensive plan protects you from financial losses and vehicle damage."
}
```

---

## 4. Expected API Response

```json
{
  "data": [
    {
      "id": 1,
      "subProduct": "motor",
      "smartFeatures": {
        "enabled": true,
        "content": [
          {
            "id": "smart-gifting",
            "variant": "gifting",
            "number": "01",
            "title": "Different Plans",
            "description": "Choose from different types of Motor Insurance plans.",
            "ctaText": "Insure now",
            "backgroundImage": "${LANDING_ASSETS}/smartfeatureimage01.png",
            "decorativeImage": "${LANDING_ASSETS}/smart-features-gifting-decor.svg"
          },
          {
            "id": "smart-claims",
            "variant": "claims",
            "number": "02",
            "title": "Easy Claims",
            "description": "Quick and hassle-free claim process.",
            "ctaText": "Claim now",
            "backgroundImage": "${LANDING_ASSETS}/smartfeatureimage02.png",
            "decorativeImage": "${LANDING_ASSETS}/smart-features-claims-decor.svg"
          },
          {
            "id": "smart-support",
            "variant": "support",
            "number": "03",
            "title": "24/7 Support",
            "description": "Get assistance anytime, anywhere.",
            "ctaText": "Contact support",
            "backgroundImage": "${LANDING_ASSETS}/smartfeatureimage03.png",
            "decorativeImage": "${LANDING_ASSETS}/smart-features-support-decor.svg"
          }
        ]
      },
      "productHighlighters": {
        "id": 63,
        "enabled": true,
        "content": [
          {
            "order": 1,
            "id": 187,
            "text": "999.9 Pure Digital Gold",
            "showIcon": true,
            "showHeaderIcon": true
          },
          {
            "order": 2,
            "id": 188,
            "text": "100% Safe & Secure",
            "showIcon": true,
            "showHeaderIcon": true
          },
          {
            "order": 3,
            "id": 189,
            "text": "Guaranteed 24K ",
            "showIcon": true,
            "showHeaderIcon": true
          }
        ]
      },
      "trustedPartners": {
        "enabled": true,
        "content": [
          {
            "id": "1",
            "src": "${LANDING_ASSETS}/icici.png",
            "alt": "ICICI Lombard",
            "order": 1
          },
          {
            "id": "2",
            "src": "${LANDING_ASSETS}/acko.png",
            "alt": "ACKO",
            "order": 2
          },
          {
            "id": "3",
            "src": "${LANDING_ASSETS}/digital.png",
            "alt": "Digit",
            "order": 3
          }
        ]
      },
      "addOns": {
        "enabled": true,
        "content": [
          {
            "id": "zero-depreciation",
            "label": "Zero Depreciation Cover",
            "title": "Zero Depreciation Cover",
            "description": "Get enhanced claim benefits with no depreciation applied on covered parts and accessories during claim settlement.",
            "benefits": [
              { "text": "No depreciation on approved claims" },
              { "text": "Higher claim settlement value" },
              { "text": "Ideal for new and high-value vehicles" },
              { "text": "Available as an add-on across vehicle types" }
            ],
            "image": "${LANDING_ASSETS}/addon1.png"
          },
          {
            "id": "roadside-assistance",
            "label": "Roadside Assistance",
            "title": "Roadside Assistance",
            "description": "24/7 emergency support including towing, battery jumpstart, and minor repairs",
            "benefits": [
              { "text": "224/7 availability" },
              { "text": "Free towing (up to 50km for cars, 25km for bikes)" },
              { "text": "Emergency fuel delivery" },
              { "text": "Flat tyre assistance" },
              { "text": "Minor repair services" }
            ],
            "image": "${LANDING_ASSETS}/addon2.png"
          },
          {
            "id": "engine-protection",
            "label": "Engine Protection",
            "title": "Engine Protection",
            "description": "Covers engine damage due to water ingress during floods or water-logging",
            "benefits": [
              { "text": "Monsoon protection" },
              { "text": "Engine repair costs" },
              { "text": "Hydrostatic lock coverage" },
              { "text": "Essential for all vehicles" }
            ],
            "image": "${LANDING_ASSETS}/addon3.png"
          },
          {
            "id": "NCB-protection",
            "label": "NCB Protection",
            "title": "NCB Protection",
            "description": "Maintain your No Claim Bonus discount even after making a claim",
            "benefits": [
              { "text": "Preserve NCB discount" },
              { "text": "One claim per year" },
              { "text": "Long-term savings" },
              { "text": "Transferable between vehicles" }
            ],
            "image": "${LANDING_ASSETS}/addon4.png"
          },
          {
            "id": "return-to-invoice",
            "label": "Return to Invoice",
            "title": "Return to Invoice",
            "description": "Get the original invoice value if your vehicle is stolen or completely damaged",
            "benefits": [
              { "text": "Full invoice value " },
              { "text": "No depreciation loss" },
              { "text": "Total loss coverage" },
              { "text": "Market value protection" }
            ],
            "image": "${LANDING_ASSETS}/addon5.png"
          },
          {
            "id": "consumables-cover",
            "label": "Consumables Cover",
            "title": "Consumables Cover",
            "description": "Coverage for consumable items like engine oil, nuts, bolts used in repairs",
            "benefits": [
              { "text": "Engine oil coverage" },
              { "text": "Nuts & bolts included" },
              { "text": "Brake fluid and lubricants" },
              { "text": "Coolant and other fluids" }
            ],
            "image": "${LANDING_ASSETS}/addon5.png"
          },
          {
            "id": "key-lock-replace",
            "label": "Key & Lock Replace",
            "title": "Key & Lock Replacement",
            "description": "Coverage for key and lock replacement in case of theft or damage",
            "benefits": [
              { "text": "Key replacement cost" },
              { "text": "Lock change coverage" },
              { "text": "Emergency locksmith" },
              { "text": "Immobiliser replacement" }
            ],
            "image": "${LANDING_ASSETS}/addon5.png"
          },
          {
            "id": "personal-accident-cover",
            "label": "Personal Accident Cover",
            "title": "Enhanced coverage for driver and passengers",
            "description": "Enhanced coverage for driver and passengers",
            "benefits": [
              { "text": "Up to ₹15 lakh coverage" },
              { "text": "Permanent disability cover" },
              { "text": "Temporary disability benefits" },
              { "text": "Death benefit for family" }
            ],
            "image": "${LANDING_ASSETS}/addon5.png"
          }
        ]
      },
      "footerFeatures": {
        "enabled": true,
        "content": [
          { "id": "feat-1", "text": "Trusted by 2K+ users", "order": 1 },
          { "id": "feat-2", "text": "Get instant policy in 3 mins", "order": 2 },
          { "id": "feat-3", "text": "Easy claim assistance", "order": 3 }
        ]
      },
      "insurersList": {
        "enabled": true,
        "content": [
          {
            "insurerId": 1,
            "insurerName": "Acko",
            "insurerLogo": "acko-logo.png",
            "badge": "Best Seller",
            "networkGarages": 5000,
            "claimRatio": "98%",
            "promoBanner": ["banner1.png", "banner2.png"]
          },
          {
            "insurerId": 2,
            "insurerName": "ICICI",
            "insurerLogo": "icici-logo.png",
            "badge": "Popular",
            "networkGarages": 4500,
            "claimRatio": "97%",
            "promoBanner": ["banner3.png"]
          },
          {
            "insurerId": 3,
            "insurerName": "Digit",
            "insurerLogo": "digit-logo.png",
            "badge": "Value for Money",
            "networkGarages": 4000,
            "claimRatio": "96%",
            "promoBanner": ["banner4.png"],
            "whatsCovered": ["Own Damage", "Third Party", "Personal Accident"],
            "whatsNotCovered": ["Wear and Tear", "Drunk Driving"],
            "overview": "Digit offers comprehensive coverage with easy claim process."
          }
        ]
      },
      "motorStatisticsItems": {
        "id": 63,
        "enabled": true,
        "content": [
          {
            "order": 1,
            "id": "1",
            "value": "5.8 Lakh",
            "description": "Motor vehicle accidents in India annually",
            "iconUrl": "${LANDING_ASSETS}/statistic1.png"
          },
          {
            "order": 2,
            "id": "2",
            "value": "₹2.5 Lakh",
            "description": "Average motor accident claim amount",
            "iconUrl": "${LANDING_ASSETS}/statistic2.png"
          },
          {
            "order": 3,
            "id": "3",
            "value": "72%",
            "description": "Vehicles in India are under-insured with only basic third-party cover",
            "iconUrl": "${LANDING_ASSETS}/statistic3.png"
          },
          {
            "order": 4,
            "id": "4",
            "value": "₹2,500",
            "description": "Fine for driving without a valid insurance",
            "iconUrl": "${LANDING_ASSETS}/statistic4.png"
          }
        ]
      },
      "widgetTabs": {
        "id": 1,
        "enabled": true,
        "content": [
          {
            "id": "tab1",
            "label": "Comprehensive",
            "order": 1,
            "tabImage": "${LANDING_ASSETS}/tabImage1.png",
            "icon": "star",
            "startingPrice": "999",
            "widgetInsuranceTitle": "Comprehensive Insurance",
            "widgetBInsuranceTitle": "Basic Coverage"
          },
          {
            "id": "tab2",
            "label": "Third Party",
            "order": 2,
            "tabImage": "${LANDING_ASSETS}/tabImage2.png",
            "icon": "shield",
            "startingPrice": "499",
            "widgetInsuranceTitle": "Third Party Insurance",
            "widgetBInsuranceTitle": "Basic Liability"
          }
        ]
      },
      "insuranceTypes": {
        "id": 1,
        "enabled": true,
        "content": [
          {
            "id": "type1",
            "title": "Comprehensive",
            "description": "Comprehensive coverage for your vehicle",
            "image": "${LANDING_ASSETS}/comprehensiveInsurance.png",
            "buttonText": "Get Quote",
            "order": 1
          },
          {
            "id": "type2",
            "title": "Third Party",
            "description": "Basic coverage as per legal requirements",
            "image": "${LANDING_ASSETS}/thirdPartyInsurance.png",
            "buttonText": "Get Quote",
            "order": 2
          }
        ]
      },
      "workTabs": {
        "id": 1,
        "enabled": true,
        "content": [
          {
            "order": 1,
            "id": 1,
            "tabId": "tab1",
            "label": "Step 1",
            "ctaText": "Get Started",
            "image": {
              "id": 1,
              "documentId": "doc1",
              "name": "step1.png",
              "alternativeText": null,
              "caption": null,
              "width": 800,
              "height": 600,
              "formats": {
                "thumbnail": {
                  "ext": ".png",
                  "url": "/uploads/thumbnail_step1.png",
                  "hash": "hash1",
                  "mime": "image/png",
                  "name": "thumbnail_step1",
                  "path": null,
                  "size": 1234,
                  "width": 150,
                  "height": 150,
                  "sizeInBytes": 1234
                }
              },
              "hash": "hash1",
              "ext": ".png",
              "mime": "image/png",
              "size": 1234,
              "url": "/uploads/step1.png",
              "previewUrl": null,
              "provider": "local",
              "provider_metadata": null,
              "createdAt": "2023-03-15T12:00:00.000Z",
              "updatedAt": "2023-03-15T12:00:00.000Z",
              "publishedAt": "2023-03-15T12:00:00.000Z"
            },
            "steps": [
              {
                "order": 1,
                "id": 1,
                "number": 1,
                "text": "Register online"
              },
              {
                "order": 2,
                "id": 2,
                "number": 2,
                "text": "Provide vehicle details"
              }
            ]
          },
          {
            "order": 2,
            "id": 2,
            "tabId": "tab2",
            "label": "Step 2",
            "ctaText": "Next Steps",
            "image": {
              "id": 2,
              "documentId": "doc2",
              "name": "step2.png",
              "alternativeText": null,
              "caption": null,
              "width": 800,
              "height": 600,
              "formats": {
                "thumbnail": {
                  "ext": ".png",
                  "url": "/uploads/thumbnail_step2.png",
                  "hash": "hash2",
                  "mime": "image/png",
                  "name": "thumbnail_step2",
                  "path": null,
                  "size": 1234,
                  "width": 150,
                  "height": 150,
                  "sizeInBytes": 1234
                }
              },
              "hash": "hash2",
              "ext": ".png",
              "mime": "image/png",
              "size": 1234,
              "url": "/uploads/step2.png",
              "previewUrl": null,
              "provider": "local",
              "provider_metadata": null,
              "createdAt": "2023-03-15T12:00:00.000Z",
              "updatedAt": "2023-03-15T12:00:00.000Z",
              "publishedAt": "2023-03-15T12:00:00.000Z"
            },
            "steps": [
              {
                "order": 1,
                "id": 3,
                "number": 1,
                "text": "Choose a plan"
              },
              {
                "order": 2,
                "id": 4,
                "number": 2,
                "text": "Make the payment"
              }
            ]
          }
        ]
      },
      "coverageComparisonSubtitle": "When buying motor insurance, know what’s covered and excluded to avoid surprises during claims. A comprehensive plan protects you from financial losses and vehicle damage.",
      "motorCriticalTitle": "Why Motor Insurance is Critical in India",
      "motorCriticalSubtitle": "These statistics show why every vehicle owner needs comprehensive insurance protection.",
      "typeOfMotorTitle": "Types of Motor Insurance",
      "typeOfMotorDescription": "Motor insurance is essential for protecting vehicles against unforeseen risks and is broadly classified into three types based on the vehicle's nature and purpose.",
      "coverageComparisonTitle": "Coverage Under Motor Insurance",
      "coverageComparisonCoveredTitle": "Covered",
      "coverageComparisonNotCoveredTitle": "Not Covered",
      "addOnsTitle": "Choose Add-Ons for Extra Protection",
      "addOnsDescription": "Add-ons are optional covers that enhance your basic motor insurance policy and provide extra protection. Keep in mind that opting for these add-ons will increase your premium but offer valuable benefits tailored to your needs.",
      "getStartedTitle": "Get started with motor insurance",
      "getStartedDescription": "Buying a motor insurance policy through Aditya Birla Capital Digital is simple, secure, and completely digital.",
      "vehicleTrackEyebrow": "The ABCD app",
      "vehicleTrackTitleLead": "Stay on top of all your vehicle's info with",
      "vehicleTrackTitleEmphasis": "ABCD's Vehicle Track",
      "vehicleTrackMobileTitleLead": "Everything Finance",
      "vehicleTrackMobileTitleEmphasis": "as simple as ABCD",
      "vehicleTrackMobileSubtitle": "Download the ABCD app and start doing more with your money everyday",
      "vehicleTrackFromLabel": "From the house of",
      "howMotorInsuranceWorksTitle": "How does Motor Insurance Works?",
      "learnMoreTitle": "Learn More",
      "learnMoreSubtitle": "Understanding key terms and policies can make it easier to choose, buy, renew, or claim your motor vehicle insurance policy online",
      "learnMoreBack": "Back to Learn More",
      "learnMoreModalLabel": "Motor Insurance Details",
      "vehicleBannerAppLabel": "The ABCD app",
      "vehicleBannerTitle": "Stay on top of all your\nvehicle's info with|ABCD's Vehicle Track",
      "vehicleBannerMobileTitle": "Everything Finance\nas simple as ABCD",
      "vehicleBannerSubtitle": "Monitor Insurance & PUC Expiry, Track Pending Challans\nInstantly, Stay Updated on Fuel Prices & Valuation.",
      "vehicleBannerMobileSubtitle": "Download the ABCD app and start doing more with your money everyday",
      "vehicleBannerFromLabel": "From the house of"
      // ...other fields as per schema...
    }
  ]
}
```

---

## 5. Summary

| Category         | Count |
|------------------|-------|
| New Components   | 5     |
| Sample Values    | 5     |
| API Response     | 1     |

---

**Contact:** Motor Insurance Web Team  
**Environment:** UAT Strapi
