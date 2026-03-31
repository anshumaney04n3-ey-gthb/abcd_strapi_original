# Insurance CMS Dashboard Page Requirements v1

**Date:** 2026-03-26  
**Purpose:** Sync UAT Strapi with LOCAL configuration for Insurance Dashboard Page

---

## Table of Contents
- [1. Dashboard Page Overview](#1-dashboard-page-overview)
- [2. Component Requirements](#2-component-requirements)
  - [2.1 New Components](#21-new-components)
- [3. Sample Values](#3-sample-values)
- [4. Expected API Response](#4-expected-api-response)
- [5. Summary](#5-summary)

---

## 1. Dashboard Page Overview

**Content Type:** `insurance-dashboard-page`  
**API Endpoint:** `GET /api/insurance-dashboard-pages?filters[subProduct][$eq]=motor&populate=*`


---

## 2. Component Requirements

### 2.1 New Components

| Component Name      | Type       | Description                            |
|--------------------|------------|----------------------------------------|
| `actionCards`      | Repeatable | Action cards for insurance types       |
| `exploreItems`     | Repeatable | Explore/navigation items               |
| `sidebarFAQs`      | Repeatable | FAQ items for sidebar                  |
| `partners`         | Repeatable | Insurance partner logos                |
| `partnerTrustItems`| Repeatable | Trust indicators/stats                 |
| `footer`           | Repeatable | Footer with features & branding        |
| `crossSell`        | Repeatable | Cross-sell section content             |
| `keyHighlights`    | Repeatable | Vehicle-type specific highlights       |
| `aiPoweredBadgeJourneyEnabled` | Boolean | Toggle for AI badge journey |
| `navigation`       | Object     | Navigation configuration               |

#### actionCards (Component Structure)
```
├── enabled (Boolean)
└── content (Repeatable)
    ├── order (Integer)
    ├── id (String)
    ├── title (String)
    ├── subtitle (String)
    ├── image (String)
    └── type (String, e.g., "car", "bike")
```

#### exploreItems (Component Structure)
```
├── enabled (Boolean)
└── content (Repeatable)
    ├── order (Integer)
    ├── id (String)
    ├── title (String)
    ├── icon (String)
    └── isExternal (Boolean)
```

#### sidebarFAQs (Component Structure)
```
├── enabled (Boolean)
└── content (Repeatable)
    ├── order (Integer)
    ├── id (String)
    ├── title (String)
    ├── icon (String)
    ├── description (String)
    ├── isExternal (Boolean)
    └── externalUrl (String)
```

#### partners (Component Structure)
```
├── enabled (Boolean)
└── content (Repeatable)
    ├── order (Integer)
    ├── id (String)
    ├── src (String)
    └── alt (String)
```

#### partnerTrustItems (Component Structure)
```
├── enabled (Boolean)
└── content (Repeatable)
    ├── order (Integer)
    ├── icon (String)
    └── text (String)
```

#### crossSell (Component Structure)
```
├── enabled (Boolean)
└── content (Repeatable)
    ├── title (String)
    ├── subtitle (String)
    ├── price (String)
    ├── buttonText (String)
    └── carImageSrc (String)
```

#### keyHighlights (Component Structure)
```
├── enabled (Boolean)
└── content (Repeatable)
    ├── order (Integer)
    ├── vehicleType (String)
    ├── badgeText (String)
    ├── title (String)
    ├── ctaText (String)
    ├── heroImage (String)
    └── highlights (Repeatable)
        ├── order (Integer)
        ├── id (String)
        └── text (String)
```
---

## 3. Sample Values

### actionCards
```json
{
  "actionCards": {
    "enabled": true,
    "content": [
      {
        "order": 1,
        "id": "car",
        "title": "Car insurance",
        "subtitle": "Starts at just ₹1,999",
        "image": "${LANDING_ASSETS}/dashboard/insuranceCar.svg",
        "type": "car"
      },
      {
        "order": 2,
        "id": "bike",
        "title": "Bike insurance",
        "subtitle": "Starts at just ₹999",
        "image": "${LANDING_ASSETS}/dashboard/insuranceBike.svg",
        "type": "bike"
      }
    ]
  }
}
```

### exploreItems
```json
{
  "exploreItems": [
    {
      "id": "renew-policy",
      "title": "Renew instantly - Upload your policy",
      "icon": "${LANDING_ASSETS}/mobile-nav/icon-motor-insurance.png",
      "isExternal": true,
      "order": 1
    },
    {
      "id": "policies",
      "title": "My Policies",
      "icon": "${LANDING_ASSETS}/mobile-nav/icon-pocket-insurance.png",
      "isExternal": true,
      "order": 2
    },
    {
      "id": "track-insurance",
      "title": "Track insurance, challans, & more, all in one place.",
      "icon": "${LANDING_ASSETS}/mobile-nav/icon-vehicle-track.png",
      "isExternal": true,
      "order": 3
    }
  ]
}
```

### sidebarFAQs
```json
{
  "sidebarFAQs": [
    {
      "id": "why-motor-insurance",
      "title": "Why Motor Insurance?",
      "icon": "${LANDING_ASSETS}/dashboard/car-icon.svg",
      "content": "Motor insurance is mandatory by law and protects you financially against accidents, theft, and third-party liabilities.",
      "isExternal": false,
      "order": 1
    },
    {
      "id": "how-it-works",
      "title": "How Motor Insurance at ABCD works?",
      "icon": "${LANDING_ASSETS}/dashboard/faq-car-icon.png",
      "content": "Choose your vehicle type, compare plans, and complete your purchase online. Policy issuance is quick and support is available throughout.",
      "isExternal": false,
      "order": 2
    },
    {
      "id": "other-questions",
      "title": "Other questions?",
      "icon": "",
      "content": "",
      "isExternal": true,
      "externalUrl": "https://help.abcd.com/motor-insurance",
      "order": 3
    }
  ]
}
```

### partners
```json
{
  "partners": [
    {
      "id": "icici",
      "src": "${LANDING_ASSETS}/dashboard/icic.svg",
      "alt": "ICICI Insurance",
      "order": 1
    },
    {
      "id": "acko",
      "src": "${LANDING_ASSETS}/dashboard/acko.svg",
      "alt": "Acko Insurance",
      "order": 2
    },
    {
      "id": "digit",
      "src": "${LANDING_ASSETS}/dashboard/digit.svg",
      "alt": "Digit Insurance",
      "order": 3
    },
    {
      "id": "tata",
      "src": "${LANDING_ASSETS}/dashboard/tata.svg",
      "alt": "Tata Insurance",
      "order": 4
    },
    {
      "id": "bajaj",
      "src": "${LANDING_ASSETS}/dashboard/general.svg",
      "alt": "Bajaj Insurance",
      "order": 5
    }
  ]
}
```

### partnerTrustItems
```json
{
  "partnerTrustItems": [
    {
      "icon": "${LANDING_ASSETS}/dashboard/trust.svg",
      "text": "Trusted by\n2K+ users",
      "order": 1
    },
    {
      "icon": "${LANDING_ASSETS}/dashboard/bolt.svg",
      "text": "Get instant policy\nin 3 mins",
      "order": 2
    },
    {
      "icon": "${LANDING_ASSETS}/dashboard/agent.svg",
      "text": "Easy claim\nassistance",
      "order": 3
    }
  ]
}
```

### crossSell
```json
{
  "crossSell": {
    "title": "Checked your challans yet?",
    "subtitle": "Stay on top of your pending challans and PUC expiry",
    "price": "0",
    "buttonText": "Activate now",
    "carImageSrc": "${LANDING_ASSETS}/landing/motorAccidentLogo.png"
  }
}
```

### keyHighlights
```json
{
  "keyHighlights": [
    {
      "vehicleType": "4W",
      "badgeText": "Join 2K+ users trusting ABCD for Motor Insurance.",
      "title": "Get car insurance now!",
      "ctaText": "Apply now",
      "heroImage": "${LANDING_ASSETS}/landing/motor/carIcon.png",
      "highlights": [
        {
          "id": "car-1",
          "text": "Unlock a special price on your car insurance",
          "order": 1
        }
      ],
      "order": 1
    },
    {
      "vehicleType": "2W",
      "badgeText": "Join 2K+ users trusting ABCD for Motor Insurance.",
      "title": "Get bike insurance now!",
      "ctaText": "Apply now",
      "heroImage": "${LANDING_ASSETS}/landing/motor/bikeIcon.png",
      "highlights": [
        {
          "id": "bike-1",
          "text": "Unlock a special price on your bike insurance",
          "order": 1
        }
      ],
      "order": 2
    }
  ]
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
      "aiPoweredBadgeJourneyEnabled": true,
      
      "actionCards": {
        "enabled": true,
        "content": [
          {
            "order": 1,
            "id": "car",
            "title": "Car insurance",
            "subtitle": "Starts at just ₹1,999",
            "image": "${LANDING_ASSETS}/dashboard/insuranceCar.svg",
            "type": "car"
          },
          {
            "order": 2,
            "id": "bike",
            "title": "Bike insurance",
            "subtitle": "Starts at just ₹999",
            "image": "${LANDING_ASSETS}/dashboard/insuranceBike.svg",
            "type": "bike"
          }
        ]
      },

      "exploreItems": {
        "enabled": true,
        "content": [
          {
            "order": 1,
            "id": "renew-policy",
            "title": "Renew instantly - Upload your policy",
            "icon": "${LANDING_ASSETS}/mobile-nav/icon-motor-insurance.png",
            "isExternal": true
          },
          {
            "order": 2,
            "id": "policies",
            "title": "My Policies",
            "icon": "${LANDING_ASSETS}/mobile-nav/icon-pocket-insurance.png",
            "isExternal": true
          },
          {
            "order": 3,
            "id": "track-insurance",
            "title": "Track insurance, challans, & more, all in one place.",
            "icon": "${LANDING_ASSETS}/mobile-nav/icon-vehicle-track.png",
            "isExternal": true
          }
        ]
      },

      "sidebarFAQs": {
        "enabled": true,
        "content": [
          {
            "order": 1,
            "id": "why-motor-insurance",
            "title": "Why Motor Insurance?",
            "icon": "${LANDING_ASSETS}/dashboard/car-icon.svg",
            "description": "Motor insurance is mandatory by law and protects you financially against accidents, theft, and third-party liabilities.",
            "isExternal": false
          },
          {
            "order": 2,
            "id": "how-it-works",
            "title": "How Motor Insurance at ABCD works?",
            "icon": "${LANDING_ASSETS}/dashboard/faq-car-icon.png",
            "description": "Choose your vehicle type, compare plans, and complete your purchase online. Policy issuance is quick and support is available throughout.",
            "isExternal": false
          },
          {
            "order": 3,
            "id": "other-questions",
            "title": "Other questions?",
            "icon": "",
            "description": "",
            "isExternal": true,
            "externalUrl": "https://help.abcd.com/motor-insurance"
          }
        ]
      },

      "partners": {
        "enabled": true,
        "content": [
          {
            "order": 1,
            "id": "icici",
            "src": "${LANDING_ASSETS}/dashboard/icic.svg",
            "alt": "ICICI Insurance"
          },
          {
            "order": 2,
            "id": "acko",
            "src": "${LANDING_ASSETS}/dashboard/acko.svg",
            "alt": "Acko Insurance"
          },
          {
            "order": 3,
            "id": "digit",
            "src": "${LANDING_ASSETS}/dashboard/digit.svg",
            "alt": "Digit Insurance"
          },
          {
            "order": 4,
            "id": "tata",
            "src": "${LANDING_ASSETS}/dashboard/tata.svg",
            "alt": "Tata Insurance"
          },
          {
            "order": 5,
            "id": "bajaj",
            "src": "${LANDING_ASSETS}/dashboard/general.svg",
            "alt": "Bajaj Insurance"
          }
        ]
      },

      "partnerTrustItems": {
        "enabled": true,
        "content": [
          {
            "order": 1,
            "icon": "${LANDING_ASSETS}/dashboard/trust.svg",
            "text": "Trusted by\n2K+ users"
          },
          {
            "order": 2,
            "icon": "${LANDING_ASSETS}/dashboard/bolt.svg",
            "text": "Get instant policy\nin 3 mins"
          },
          {
            "order": 3,
            "icon": "${LANDING_ASSETS}/dashboard/agent.svg",
            "text": "Easy claim\nassistance"
          }
        ]
      },
      "crossSell": {
        "enabled": true,
        "content": {
          "title": "Checked your challans yet?",
          "subtitle": "Stay on top of your pending challans and PUC expiry",
          "price": "0",
          "buttonText": "Activate now",
          "carImageSrc": "${LANDING_ASSETS}/landing/motorAccidentLogo.png"
        }
      },

      "keyHighlights": {
        "enabled": true,
        "content": [
          {
            "order": 1,
            "vehicleType": "4W",
            "badgeText": "Join 2K+ users trusting ABCD for Motor Insurance.",
            "title": "Get car insurance now!",
            "ctaText": "Apply now",
            "heroImage": "${LANDING_ASSETS}/landing/motor/carIcon.png",
            "highlights": [
              {
                "id": "car-1",
                "text": "Unlock a special price on your car insurance"
              }
            ]
          },
          {
            "order": 2,
            "vehicleType": "2W",
            "badgeText": "Join 2K+ users trusting ABCD for Motor Insurance.",
            "title": "Get bike insurance now!",
            "ctaText": "Apply now",
            "heroImage": "${LANDING_ASSETS}/landing/motor/bikeIcon.png",
            "highlights": [
              {
                "id": "bike-1",
                "text": "Unlock a special price on your bike insurance"
              }
            ]
          }
        ]
      },

      "navigation": {
        "id": 9,
        "enabled": true,
        "content": []
      }
    }
  ]
}
```

---

## 5. Summary

| Category         | Count |
|------------------|-------|
| New Components   | 10    |
| Sample Values    | 8     |
| API Response     | 1     |

---

**Contact:** Motor Insurance Dashboard Team  
**Environment:** UAT Strapi
