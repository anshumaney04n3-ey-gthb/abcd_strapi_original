# Loans CMS Requirements v7 - Feature Toggles

**Date:** 2026-03-31  
**Status:** PROPOSED  
**Collection Type:** `gold-loan-feature-toggles`

---

## 1. Schema

| Field | Type | Required | Default | Description |
|-------|------|:--------:|:-------:|-------------|
| `subProduct` | enum | Yes | - | Product variant (gold, personal, home) |
| `partner` | string | No | "default" | Partner code |
| `isAutoLenderSelection` | boolean | No | false | Enable automatic lender selection |
| `isMultiLenderEnable` | boolean | No | false | Enable multi-lender flow |
| `isEmployeeOfferAvailable` | boolean | No | false | Show employee-specific offers |
| `isExclusiveOfferAvailable` | boolean | No | false | Show exclusive offers |

---

## 2. Expected API Response

**Endpoint:** `GET /api/gold-loan-feature-toggles?filters[subProduct][$eq]=gold&populate=*`

```json
{
  "data": [
    {
      "id": 1,
      "subProduct": "gold",
      "partner": "default",
      "isAutoLenderSelection": false,
      "isMultiLenderEnable": true,
      "isEmployeeOfferAvailable": false,
      "isExclusiveOfferAvailable": true
    }
  ],
  "meta": {
    "pagination": { "page": 1, "pageSize": 25, "pageCount": 1, "total": 1 }
  }
}
```

---

## 3. Strapi Schema Creation Checklist

- [ ] Create `gold-loan-feature-toggles` collection type
- [ ] Add `subProduct` enum field (gold, personal, home)
- [ ] Add `partner` string field with default "default"
- [ ] Add `isAutoLenderSelection` boolean field (default: false)
- [ ] Add `isMultiLenderEnable` boolean field (default: false)
- [ ] Add `isEmployeeOfferAvailable` boolean field (default: false)
- [ ] Add `isExclusiveOfferAvailable` boolean field (default: false)
