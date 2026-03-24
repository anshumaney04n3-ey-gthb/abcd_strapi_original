# Strapi Seed Commands

This file contains all commands to seed data into Strapi CMS.

## Prerequisites

1. **Install dependencies first:**
   ```bash
   cd /workspaces/abcd-dost-strapi-v2/seed_scripts
   npm install axios dotenv typescript ts-node @types/node
   ```

2. **Configure environment:**
   ```bash
   cp .env.example .env
   ```
   
   Edit `.env` with your settings:
   ```env
   API_BASE_URL=http://127.0.0.1:1337
   API_ENDPOINT=/api
   API_TOKEN=your-api-token
   TIMEOUT=10000
   RETRY_ATTEMPTS=3
   LOG_LEVEL=info
   ```

---

## Run All Seeds (Orchestrator)

```bash
cd /workspaces/abcd-dost-strapi-v2/seed_scripts
npx ts-node index.ts
```

---

## Individual Seed Commands

### Core Seeds (21 scripts)

```bash
# Core - Categories
npx ts-node core/01-categories.ts

# Core - Sub Categories
npx ts-node core/02-sub-categories.ts

# Core - Communication Channels
npx ts-node core/03-communication-channels.ts

# Core - FAQs
npx ts-node core/04-faqs.ts

# Core - Help Topics
npx ts-node core/05-help-topics.ts

# Core - Help Chips
npx ts-node core/06-help-chips.ts

# Core - Dashboard Contents
npx ts-node core/07-dashboard-contents.ts

# Core - DSK Categories
npx ts-node core/08-dsk-categories.ts

# Core - DSK Subcategories
npx ts-node core/09-dsk-subcategories.ts

# Core - Historical Gold Prices
npx ts-node core/10-historical-gold-prices.ts

# Core - Partner Configs
npx ts-node core/11-partner-configs.ts

# Core - Portfolios
npx ts-node core/12-portfolios.ts

# Core - Product Tutorials
npx ts-node core/13-product-tutorials.ts

# Core - Questions and Answers
npx ts-node core/14-questions-and-answers.ts

# Core - Sales Enablers
npx ts-node core/15-sales-enablers.ts

# Core - Sales Materials
npx ts-node core/16-sales-materials.ts

# Core - Non Executable Quotes
npx ts-node core/17-non-executable-quotes.ts

# Core - Order Histories
npx ts-node core/18-order-histories.ts

# Core - Order History V2s
npx ts-node core/19-order-history-v-twos.ts

# Core - User Gifts
npx ts-node core/20-user-gifts.ts

# Core - User SIPs
npx ts-node core/21-user-sips.ts
```

---

### Gold Loan Seeds (9 scripts)

```bash
# Gold Loan - Calculator Configs
npx ts-node gold-loan/01-gl-calculator-configs.ts

# Gold Loan - Campaign Configs
npx ts-node gold-loan/02-gl-campaign-configs.ts

# Gold Loan - Eligibility Configs
npx ts-node gold-loan/03-gl-eligibility-configs.ts

# Gold Loan - FAQs
npx ts-node gold-loan/04-gl-faqs.ts

# Gold Loan - Homepage Configs
npx ts-node gold-loan/05-gl-homepage-configs.ts

# Gold Loan - Journey Screens
npx ts-node gold-loan/06-gl-journey-screens.ts

# Gold Loan - Lender Configs
npx ts-node gold-loan/07-gl-lender-configs.ts

# Gold Loan - Loan Company Masters
npx ts-node gold-loan/08-gl-loan-company-masters.ts

# Gold Loan - Toggle Configs
npx ts-node gold-loan/09-gl-toggle-configs.ts
```

---

### DigiMetal Seeds (7 scripts)

```bash
# DigiMetal - Journey Pages
npx ts-node digimetal/01-digimetal-journey-pages.ts

# DigiMetal - Channel Mappings
npx ts-node digimetal/02-digimetal-channel-mappings.ts

# DigiMetal - CSP Configs
npx ts-node digimetal/03-digimetal-csp-configs.ts

# DigiMetal - Dashboard Pages
npx ts-node digimetal/04-digimetal-dashboard-pages.ts

# DigiMetal - Landing Pages
npx ts-node digimetal/05-digimetal-landing-pages.ts

# DigiMetal - Navigations
npx ts-node digimetal/06-digimetal-navigations.ts

# DigiMetal - Partner Configs
npx ts-node digimetal/07-digimetal-partner-configs.ts
```

---

## Quick Reference Table

| Category | Script | Endpoint |
|----------|--------|----------|
| **Core** | 01-categories.ts | /categories |
| **Core** | 02-sub-categories.ts | /sub-categories |
| **Core** | 03-communication-channels.ts | /communication-channels |
| **Core** | 04-faqs.ts | /faqs |
| **Core** | 05-help-topics.ts | /help-topics |
| **Core** | 06-help-chips.ts | /help-chips |
| **Core** | 07-dashboard-contents.ts | /dashboard-contents |
| **Core** | 08-dsk-categories.ts | /dsk-categories |
| **Core** | 09-dsk-subcategories.ts | /dsk-subcategories |
| **Core** | 10-historical-gold-prices.ts | /historical-gold-prices |
| **Core** | 11-partner-configs.ts | /partner-configs |
| **Core** | 12-portfolios.ts | /portfolios |
| **Core** | 13-product-tutorials.ts | /product-tutorials |
| **Core** | 14-questions-and-answers.ts | /questions-and-answers |
| **Core** | 15-sales-enablers.ts | /sales-enablers |
| **Core** | 16-sales-materials.ts | /sales-materials |
| **Core** | 17-non-executable-quotes.ts | /non-executable-quotes |
| **Core** | 18-order-histories.ts | /order-histories |
| **Core** | 19-order-history-v-twos.ts | /order-history-v-twos |
| **Core** | 20-user-gifts.ts | /user-gifts |
| **Core** | 21-user-sips.ts | /user-sips |
| **Gold Loan** | 01-gl-calculator-configs.ts | /gl-calculator-configs |
| **Gold Loan** | 02-gl-campaign-configs.ts | /gl-campaign-configs |
| **Gold Loan** | 03-gl-eligibility-configs.ts | /gl-eligibility-configs |
| **Gold Loan** | 04-gl-faqs.ts | /gl-faqs |
| **Gold Loan** | 05-gl-homepage-configs.ts | /gl-homepage-configs |
| **Gold Loan** | 06-gl-journey-screens.ts | /gl-journey-screens |
| **Gold Loan** | 07-gl-lender-configs.ts | /gl-lender-configs |
| **Gold Loan** | 08-gl-loan-company-masters.ts | /gl-loan-company-masters |
| **Gold Loan** | 09-gl-toggle-configs.ts | /gl-toggle-configs |
| **DigiMetal** | 01-digimetal-journey-pages.ts | /digimetal-journey-pages |
| **DigiMetal** | 02-digimetal-channel-mappings.ts | /digimetal-channel-mappings |
| **DigiMetal** | 03-digimetal-csp-configs.ts | /digimetal-csp-configs |
| **DigiMetal** | 04-digimetal-dashboard-pages.ts | /digimetal-dashboard-pages |
| **DigiMetal** | 05-digimetal-landing-pages.ts | /digimetal-landing-pages |
| **DigiMetal** | 06-digimetal-navigations.ts | /digimetal-navigations |
| **DigiMetal** | 07-digimetal-partner-configs.ts | /digimetal-partner-configs |

---

## Batch Commands

### Run all Core seeds:
```bash
cd /workspaces/abcd-dost-strapi-v2/seed_scripts
for f in core/*.ts; do npx ts-node "$f"; done
```

### Run all Gold Loan seeds:
```bash
cd /workspaces/abcd-dost-strapi-v2/seed_scripts
for f in gold-loan/*.ts; do npx ts-node "$f"; done
```

### Run all DigiMetal seeds:
```bash
cd /workspaces/abcd-dost-strapi-v2/seed_scripts
for f in digimetal/*.ts; do npx ts-node "$f"; done
```

---

## Notes

- Ensure Strapi server is running before seeding
- Run `categories` before `sub-categories` (dependency)
- Run `dsk-categories` before `dsk-subcategories` (dependency)
- Use the orchestrator (`index.ts`) for automatic dependency handling
