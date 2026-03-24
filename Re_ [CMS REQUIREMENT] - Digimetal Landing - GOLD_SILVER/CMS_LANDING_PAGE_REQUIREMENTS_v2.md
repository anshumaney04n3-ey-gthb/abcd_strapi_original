# CMS Landing Page - UAT Strapi Requirements

**Date:** 2026-02-13  
**Purpose:** Sync UAT Strapi with LOCAL configuration for DigiMetal Landing Page

---

## 1. Component Changes

### 1.1 NEW Components to Create

| Component Name | Type | Description |
|----------------|------|-------------|
| `widgetAmountChips` | Repeatable | Quick-select amount chips for purchase widget |
| `productHighlighters` | Repeatable | Header/banner product highlight badges |
| `smartFeatureGifting` | Single | Digital Gold Gifting feature card |

---

#### `widgetAmountChips` (Component Structure)
```
├── enabled (Boolean)
└── content (Repeatable)
    ├── order (Integer)
    ├── label (String) - e.g. "₹2,000"
    ├── value (String) - e.g. "2000"
    └── isPopular (Boolean)
```

#### `productHighlighters` (Component Structure)
```
├── enabled (Boolean)
└── content (Repeatable)
    ├── order (Integer)
    ├── text (String)
    ├── showIcon (Boolean)
    └── showHeaderIcon (Boolean)
```

#### `smartFeatureGifting` (Component Structure)
```
├── enabled (Boolean)
└── content (Single)
    ├── number (String) - e.g. "01"
    ├── title (String)
    ├── description (Text)
    ├── ctaText (String)
    ├── notificationHeaderText (String)
    ├── notificationTitle (String)
    ├── notificationBodyLines (JSON/Array)
    ├── backgroundImage (Media)
    └── decorativeImage (Media)
```

---

### 1.2 EXISTING Components to Modify

| Component | Change Required |
|-----------|-----------------|
| `benefits` | Add `icon` field (Media, nullable) to content items |
| `educationCards` | Add `href` field (String/URL) to content items |
| `appStoreButtons` | Add `url` field (String/URL) for download links |

---

## 2. Schema Changes

### 2.1 NEW Fields to Add (Content-Type Level)

| Field Name | Type | Default | Required |
|------------|------|---------|----------|
| `widgetPriceSuffix` | Short Text | "/gm" | No |
| `widgetPriceValidForSeconds` | Integer | 300 | No |
| `widgetMinAmount` | Integer | 10 | No |
| `widgetMaxAmount` | Integer | 500000 | No |
| `widgetMinWeight` | Integer | 0 | No |
| `widgetMaxWeight` | Integer | 50 | No |
| `sipCalculatorEnabled` | Boolean | true | No |
| `footerReferenceLogo` | Media (Single) | - | No |
| `securityDesktopBackground` | Media (Single) | - | No |
| `securityMobileBackground` | Media (Single) | - | No |

---

### 2.2 NEW Component Fields to Add (Content-Type Level)

| Field Name | Component Type |
|------------|----------------|
| `widgetAmountChips` | Use `widgetAmountChips` component |
| `productHighlighters` | Use `productHighlighters` component |
| `smartFeatureGifting` | Use `smartFeatureGifting` component |

---

---

## 3. Content Updates (After Schema Changes)

| Section | Update Required |
|---------|-----------------|
| `widgetTermsUrl` | Change from `/terms` to `https://www.adityabirlacapital.com/abc-digital/terms-conditions` |
| `widgetPrivacyUrl` | Change from `/privacy` to `https://www.adityabirlacapital.com/abcd/privacy-policy` |
| `comparisonColumns[2].title` | Change from `ETF` to `ETFs` |
| `appStoreButtons` | Add 2 buttons (Play Store, App Store) with icons and URLs |
| `educationCards` | Add 4th card: "Calculate Your Future Gains" with href |
| `heroSlides[1].order` | Fix order value from `1` to `2` |

---

## Summary

| Category | Count |
|----------|-------|
| New Components | 3 |
| Modified Components | 3 |
| New Schema Fields | 10 |
| New Component Fields | 3 |
| Content Updates | 6 |

---

**Contact:** [Your Name]  
**Environment:** UAT Strapi
