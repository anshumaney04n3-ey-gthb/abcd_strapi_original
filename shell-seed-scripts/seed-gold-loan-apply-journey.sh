#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"
echo "Seeding Gold Loan Apply Journey..."

curl -X POST "$BASE_URL/api/gold-loan-apply-journeys" -H "Content-Type: application/json" -d '{
  "data": {
    "subProduct": "gold",
    "partner": "default",
    "collectBasicDetails": {
      "title": "Basic Details",
      "ctaText": "Continue",
      "pifaText": "How did you learn about us?",
      "consentText": "I authorise Aditya Birla Capital Digital Limited to access my data to process my loan application and share with its trusted lending partners",
      "consentLinkText": "trusted lending partners",
      "consentLinkUrl": "/terms",
      "loanTypes": [
        {
          "label": "Fresh Loan",
          "value": "Fresh Loan"
        },
        {
          "label": "Existing Loan Transfer",
          "value": "Existing Loan Transfer"
        }
      ],
      "lenders": [
        {
          "name": "Muthoot FinCorp"
        },
        {
          "name": "IIFL Finance"
        },
        {
          "name": "Rupeek"
        },
        {
          "name": "Other"
        }
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
        "variant": "standard",
        "disabled": false,
        "partner": {
          "heading": "Lending Partner",
          "name": "Muthoot Fincorp",
          "logoAlt": "Muthoot Fincorp"
        },
        "loanInfo": {
          "loanStartsFrom": {
            "heading": "Loan starts from",
            "value": "₹3,000"
          },
          "minWeight": {
            "heading": "Min. weight",
            "value": "2g"
          },
          "startingRoi": {
            "heading": "Starting ROI",
            "value": "0.97% p.m"
          }
        },
        "ctaButton": {
          "label": "Apply Now",
          "disabled": false
        }
      },
      {
        "variant": "standard",
        "disabled": false,
        "partner": {
          "heading": "Lending Partner",
          "name": "IIFL Finance",
          "logoAlt": "IIFL Finance"
        },
        "loanInfo": {
          "loanStartsFrom": {
            "heading": "Loan starts from",
            "value": "₹3,000"
          },
          "minWeight": {
            "heading": "Min. weight",
            "value": "1g"
          },
          "startingRoi": {
            "heading": "Starting ROI",
            "value": "0.99% p.m"
          }
        },
        "ctaButton": {
          "label": "Apply Now",
          "disabled": false
        }
      },
      {
        "variant": "exclusive",
        "disabled": false,
        "partner": {
          "heading": "Lending Partner",
          "name": "Rupeek",
          "logoAlt": "Rupeek"
        },
        "loanInfo": {
          "loanStartsFrom": {
            "heading": "Loan starts from",
            "value": "₹30,000"
          },
          "minWeight": {
            "heading": "Min. weight",
            "value": "10g"
          },
          "startingRoi": {
            "heading": "Starting ROI",
            "value": "0.79% p.m"
          }
        },
        "ctaButton": {
          "label": "Apply Now",
          "disabled": false
        },
        "exclusiveOffer": {
          "badgeText": "Exclusive employee offer",
          "badgeIconAlt": "Exclusive",
          "benefits": [
            {
              "headline": "90%",
              "subtext": "PF waiver"
            },
            {
              "headline": "25%",
              "subtext": "additional LTV (upto 85%)"
            },
            {
              "headline": "Zero",
              "subtext": "foreclosure & withdrawal charges"
            }
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
    }
  }
}'

echo "Gold Loan Apply Journey seeding completed"