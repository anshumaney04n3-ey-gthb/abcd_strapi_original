# DigiMetal CSP Config API Documentation

This document provides comprehensive documentation for the DigiMetal Content Security Policy (CSP) configuration content structure, components, and API usage.

---

## Table of Contents

1. [Overview](#overview)
2. [Content Type Schema](#content-type-schema)
3. [Components](#components)
   - [CSP Directive](#csp-directive)
4. [API Endpoints](#api-endpoints)
5. [Sample API Request & Response](#sample-api-request--response)
6. [Web App Integration](#web-app-integration)
7. [CSP Directive Reference](#csp-directive-reference)

---

## Overview

The DigiMetal CSP Config is a **collection type** content structure designed for managing Content Security Policy configurations. It supports multiple configurations per product (gold, silver, common).

**API Identifier:** `api::digimetal-csp-config.digimetal-csp-config`

**Location:** `/src/api/digimetal-csp-config/`

---

## Content Type Schema

**Location:** `/src/api/digimetal-csp-config/content-types/digimetal-csp-config/schema.json`

### Main Attributes

| Attribute | Type | Required | Unique | Default | Description |
|-----------|------|----------|--------|---------|-------------|
| `identifier` | string | Yes | Yes | - | Unique config identifier (e.g., "default", "gold", "silver") |
| `subProduct` | enumeration | Yes | No | `common` | Product type: `gold`, `silver`, or `common` |
| `directives` | component[] | Yes | No | - | Array of CSP directives |
| `reportUri` | string | No | No | - | CSP violation report endpoint |
| `reportOnly` | boolean | No | No | `false` | Use Content-Security-Policy-Report-Only header |
| `isActive` | boolean | No | No | `true` | Whether this config is active |
| `description` | text | No | No | - | Config description |

### Schema JSON

```json
{
  "kind": "collectionType",
  "collectionName": "digimetal_csp_configs",
  "info": {
    "singularName": "digimetal-csp-config",
    "pluralName": "digimetal-csp-configs",
    "displayName": "DigiMetal CSP Config",
    "description": "Content Security Policy configuration for DigiMetal products"
  },
  "options": {
    "draftAndPublish": true
  },
  "attributes": {
    "identifier": {
      "type": "string",
      "required": true,
      "unique": true
    },
    "subProduct": {
      "type": "enumeration",
      "enum": ["gold", "silver", "common"],
      "required": true,
      "default": "common"
    },
    "directives": {
      "type": "component",
      "component": "digimetal-config.csp-directive",
      "repeatable": true,
      "required": true
    },
    "reportUri": {
      "type": "string"
    },
    "reportOnly": {
      "type": "boolean",
      "default": false
    },
    "isActive": {
      "type": "boolean",
      "default": true
    },
    "description": {
      "type": "text"
    }
  }
}
```

---

## Components

All components are located in `/src/components/digimetal-config/`

### CSP Directive

**File:** `csp-directive.json`

A single CSP directive with its allowed sources.

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `directive` | enumeration | Yes | CSP directive name |
| `sources` | json | Yes | Array of allowed sources |

#### Supported Directives

| Directive | Description |
|-----------|-------------|
| `default-src` | Default fallback for other directives |
| `script-src` | Valid sources for JavaScript |
| `style-src` | Valid sources for stylesheets |
| `img-src` | Valid sources for images |
| `font-src` | Valid sources for fonts |
| `connect-src` | Valid sources for fetch, XHR, WebSocket |
| `frame-src` | Valid sources for iframes |
| `frame-ancestors` | Valid parents that can embed this page |
| `object-src` | Valid sources for plugins |
| `base-uri` | Valid URLs for `<base>` element |
| `form-action` | Valid URLs for form submissions |
| `media-src` | Valid sources for media (audio/video) |
| `worker-src` | Valid sources for workers |
| `manifest-src` | Valid sources for web manifests |

#### Schema

```json
{
  "collectionName": "components_digimetal_config_csp_directives",
  "info": {
    "displayName": "CSP Directive",
    "description": "A single CSP directive with its allowed sources",
    "icon": "shield"
  },
  "attributes": {
    "directive": {
      "type": "enumeration",
      "enum": [
        "default-src",
        "script-src",
        "style-src",
        "img-src",
        "font-src",
        "connect-src",
        "frame-src",
        "frame-ancestors",
        "object-src",
        "base-uri",
        "form-action",
        "media-src",
        "worker-src",
        "manifest-src"
      ],
      "required": true
    },
    "sources": {
      "type": "json",
      "required": true
    }
  }
}
```

---

## API Endpoints

### Get All CSP Configs

```
GET /api/digimetal-csp-configs?populate=*
```

### Get Specific CSP Config

```
GET /api/digimetal-csp-configs?filters[identifier][$eq]=default&populate=*
GET /api/digimetal-csp-configs?filters[subProduct][$eq]=gold&populate=*
```

### Query Parameters

| Parameter | Description |
|-----------|-------------|
| `filters[identifier][$eq]=default` | Filter by identifier |
| `filters[subProduct][$eq]=gold` | Filter by product type |
| `filters[isActive][$eq]=true` | Filter active configs only |
| `populate=*` | Populate directives array |

---

## Sample API Request & Response

### curl Command

```bash
curl -s \
  -H "Authorization: Bearer $STRAPI_API_TOKEN" \
  'http://localhost:1337/api/digimetal-csp-configs?populate=*'
```

### Response Structure

```json
{
  "data": [
    {
      "id": 2,
      "documentId": "vfg98wfdaq35b0txeid4lq54",
      "identifier": "default",
      "subProduct": "common",
      "reportUri": "/digitalmetal/api/csp-report",
      "reportOnly": false,
      "isActive": true,
      "description": "Default CSP configuration for all DigiMetal products",
      "createdAt": "2026-02-14T16:32:12.067Z",
      "updatedAt": "2026-02-14T16:32:12.067Z",
      "publishedAt": "2026-02-14T16:32:12.069Z",
      "directives": [
        {
          "id": 12,
          "directive": "default-src",
          "sources": ["'self'"]
        },
        {
          "id": 13,
          "directive": "script-src",
          "sources": [
            "'self'",
            "'unsafe-inline'",
            "https://www.googletagmanager.com",
            "https://checkout.razorpay.com",
            "https://*.razorpay.com"
          ]
        },
        {
          "id": 14,
          "directive": "style-src",
          "sources": ["'self'", "'unsafe-inline'"]
        },
        {
          "id": 15,
          "directive": "img-src",
          "sources": [
            "'self'",
            "data:",
            "https:",
            "http://localhost:1337",
            "https://abcduat1.abcscuat.com",
            "https://storage.googleapis.com"
          ]
        },
        {
          "id": 16,
          "directive": "connect-src",
          "sources": [
            "'self'",
            "https://www.google-analytics.com",
            "http://localhost:1337",
            "https://abcduat1.abcscuat.com",
            "https://*.razorpay.com",
            "https://api.razorpay.com",
            "https://lumberjack.razorpay.com"
          ]
        },
        {
          "id": 17,
          "directive": "frame-src",
          "sources": [
            "'self'",
            "https://*.razorpay.com",
            "https://api.razorpay.com"
          ]
        },
        {
          "id": 18,
          "directive": "media-src",
          "sources": [
            "'self'",
            "https:",
            "http://localhost:1337",
            "https://abcduat1.abcscuat.com"
          ]
        },
        {
          "id": 19,
          "directive": "font-src",
          "sources": ["'self'"]
        },
        {
          "id": 20,
          "directive": "frame-ancestors",
          "sources": ["'none'"]
        },
        {
          "id": 21,
          "directive": "object-src",
          "sources": ["'none'"]
        },
        {
          "id": 22,
          "directive": "base-uri",
          "sources": ["'self'"]
        }
      ]
    },
    {
      "id": 4,
      "documentId": "cy7y4cpngk99yuxglqb2t7cd",
      "identifier": "gold",
      "subProduct": "gold",
      "reportUri": "/digimetal/api/csp-report",
      "reportOnly": false,
      "isActive": true,
      "description": "CSP configuration specific to DigiGold product",
      "directives": ["..."]
    },
    {
      "id": 6,
      "documentId": "t33tetjq5p3cd2cmwh3g4no4",
      "identifier": "silver",
      "subProduct": "silver",
      "reportUri": "/digimetal/api/csp-report",
      "reportOnly": false,
      "isActive": true,
      "description": "CSP configuration specific to DigiSilver product",
      "directives": ["..."]
    }
  ],
  "meta": {
    "pagination": {
      "page": 1,
      "pageSize": 25,
      "pageCount": 1,
      "total": 3
    }
  }
}
```

---

## Web App Integration

### Building CSP Header

```typescript
interface CSPDirective {
  directive: string;
  sources: string[];
}

interface CSPConfig {
  identifier: string;
  subProduct: string;
  directives: CSPDirective[];
  reportUri?: string;
  reportOnly: boolean;
  isActive: boolean;
}

function buildCSPHeader(config: CSPConfig): string {
  const directives = config.directives
    .map(d => `${d.directive} ${d.sources.join(' ')}`)
    .join('; ');
  
  if (config.reportUri) {
    return `${directives}; report-uri ${config.reportUri}`;
  }
  
  return directives;
}

// Usage in Next.js middleware or headers config
const cspHeader = buildCSPHeader(cspConfig);
const headerName = cspConfig.reportOnly 
  ? 'Content-Security-Policy-Report-Only' 
  : 'Content-Security-Policy';
```

### Next.js Headers Configuration

```typescript
// next.config.js
async headers() {
  return [
    {
      source: '/:path*',
      headers: [
        {
          key: 'Content-Security-Policy',
          value: buildCSPHeader(await fetchCSPConfig()),
        },
      ],
    },
  ];
}
```

---

## CSP Directive Reference

### Common Source Values

| Source | Description |
|--------|-------------|
| `'self'` | Same origin as the document |
| `'none'` | No sources allowed |
| `'unsafe-inline'` | Allow inline scripts/styles (not recommended) |
| `'unsafe-eval'` | Allow eval() (not recommended) |
| `'nonce-{{nonce}}'` | Allow scripts with specific nonce |
| `data:` | Allow data: URIs |
| `blob:` | Allow blob: URIs |
| `https:` | Allow any HTTPS source |
| `https://*.domain.com` | Allow specific domain with wildcard |

### Recommended Configuration

| Directive | Recommended Sources |
|-----------|---------------------|
| `default-src` | `'self'` |
| `script-src` | `'self'`, `'nonce-{{nonce}}'`, trusted CDNs |
| `style-src` | `'self'`, `'unsafe-inline'` (for styled-components) |
| `img-src` | `'self'`, `data:`, `https:`, CMS domains |
| `connect-src` | `'self'`, API domains, analytics |
| `frame-src` | `'self'`, payment gateways |
| `frame-ancestors` | `'none'` (prevent clickjacking) |
| `object-src` | `'none'` |
| `base-uri` | `'self'` |

---

## Component Hierarchy

```
digimetal-csp-config (Collection)
├── identifier: string (unique)
├── subProduct: enum (gold, silver, common)
├── directives[]: csp-directive
│   ├── directive: enum (default-src, script-src, etc.)
│   └── sources: json (array of strings)
├── reportUri: string
├── reportOnly: boolean
├── isActive: boolean
└── description: text
```

---

## Available Configurations

| Identifier | SubProduct | Description |
|------------|------------|-------------|
| `default` | common | Base CSP for all products |
| `gold` | gold | Gold-specific overrides |
| `silver` | silver | Silver-specific overrides |

---

## Seed Data Location

| File | Description |
|------|-------------|
| `seed/digimetal/csp-config/default.json` | Default CSP configuration |
| `seed/digimetal/csp-config/gold.json` | Gold-specific CSP |
| `seed/digimetal/csp-config/silver.json` | Silver-specific CSP |

---

## Notes

1. **Inheritance:** Product-specific configs can override default config directives
2. **Report URI:** CSP violations are reported to `/digitalmetal/api/csp-report`
3. **Report-Only Mode:** Set `reportOnly: true` to test CSP without blocking
4. **Nonce Support:** Use `'nonce-{{nonce}}'` in script-src for dynamic scripts
5. **Environment-Specific:** Add localhost URLs for development, remove for production
