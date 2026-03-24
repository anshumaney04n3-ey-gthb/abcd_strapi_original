#!/bin/bash

# Load base URL configuration
source "$(dirname "$0")/config.sh"

BASE_URL="${BASE_URL:-http://localhost:1337}"
SEED_TYPE="digimetal-journey-pages"

echo "=============================================="
echo "Seeding DigiMetal Journey Pages"
echo "=============================================="
echo "Using BASE_URL: $BASE_URL"
echo ""

cleanup_all() {
    echo "[CLEANUP] Fetching existing entries..."
    response=$(curl -s "$BASE_URL/api/$SEED_TYPE")
    docIds=$(echo "$response" | grep -o '"documentId":"[^"]*"' | sed 's/"documentId":"//;s/"//')
    if [[ -n "$docIds" ]]; then
        count=0
        while IFS= read -r docId; do
            if [[ -n "$docId" && "$docId" != "null" ]]; then
                curl -s -X DELETE "$BASE_URL/api/$SEED_TYPE/$docId" > /dev/null
                count=$((count + 1))
            fi
        done <<< "$docIds"
        echo "[CLEANUP] Deleted $count existing entries"
    else
        echo "[CLEANUP] No existing entries found"
    fi
}

seed_entry() {
    local label="$1"
    local json_payload="$2"

    echo "----------------------------------------"
    echo "Seeding: $label"
    echo "----------------------------------------"

    response=$(curl -s -w "\n%{http_code}" -X POST "$BASE_URL/api/$SEED_TYPE" \
        -H "Content-Type: application/json" \
        -d "{\"data\": $json_payload}")

    http_code=$(echo "$response" | tail -n1)
    body=$(echo "$response" | sed '$d')

    if [[ "$http_code" == "200" || "$http_code" == "201" ]]; then
        entryId=$(echo "$body" | grep -o '"id":[0-9]*' | head -1 | sed 's/"id"://')
        echo "[SUCCESS] Created: $label (ID: $entryId)"
        return 0
    fi

    echo "[FAILED] HTTP $http_code for: $label"
    echo "Response: $body"
    return 1
}

# Cleanup existing entries
cleanup_all

echo ""
echo "=============================================="
echo "Starting seed entries..."
echo "=============================================="
echo ""

# ==========================================
# GOLD - Partner: default
# ==========================================
GOLD_DEFAULT_JSON='{
    "subProduct": "gold",
    "partner": "default",
    "buy": {
        "collectTransactionDetailsBuy": {
            "title": "Buy Digital Gold",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with buying gold",
            "inputSectionTitle": "How much gold do you want to buy?",
            "infoBannerMessage": "Start investing with as little as Rs.50",
            "refreshTimeSeconds": 290,
            "minAmount": 50,
            "maxAmount": 500000,
            "minWeight": 0.001,
            "maxWeight": 50,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "500", "isPopular": false },
                    { "order": 2, "value": "1000", "isPopular": true },
                    { "order": 3, "value": "5000", "isPopular": false },
                    { "order": 4, "value": "10000", "isPopular": false },
                    { "order": 5, "value": "25000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "1", "isPopular": false },
                    { "order": 2, "value": "2", "isPopular": true },
                    { "order": 3, "value": "5", "isPopular": false },
                    { "order": 4, "value": "10", "isPopular": false },
                    { "order": 5, "value": "20", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Order Summary",
            "submitButtonText": "Proceed to Pay",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with order summary",
            "reviewTitle": "REVIEW TRANSACTION",
            "descriptionPrefix": "Total payable amount"
        },
        "thankYou": {
            "title": "Transaction Success",
            "submitButtonText": "View Transaction Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "You just purchased",
            "messageSuffix": "of 999.9 Gold"
        },
        "paymentFailure": {
            "title": "Payment Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Payment Failed",
            "description": "We couldn'\''t process your payment. Please try again."
        }
    },
    "sell": {
        "selectRedeemType": {
            "title": "Sell Gold",
            "sectionTitle": "How do you want to sell your gold?",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with redemption options",
            "paymentMethods": [
                {
                    "order": 1,
                    "methodId": "cash-instantly",
                    "methodType": "cash",
                    "iconSrc": "/assets/sell-flow/cashInHand.svg",
                    "iconAlt": "Cash in hand",
                    "title": "Cash Instantly",
                    "description": ["Get your money instantly deposited to your bank account."],
                    "options": [
                        { "order": 1, "iconSrc": "/assets/sell-flow/bank-outline.svg", "iconAlt": "Bank account", "label": "", "iconSize": 24 },
                        { "order": 2, "iconSrc": "/assets/sell-flow/upi.png", "iconAlt": "UPI", "label": "", "iconSize": 32 }
                    ]
                },
                {
                    "order": 2,
                    "methodId": "gold-in-hand",
                    "methodType": "gold-in-hand",
                    "iconSrc": "/assets/sell-flow/Gold-In-Hand.png",
                    "iconAlt": "Gold in-hand",
                    "title": "Gold in-hand",
                    "description": ["Pure 999.9 gold coin", "Get delivered in 7-8 days"]
                }
            ]
        },
        "collectTransactionDetailsSell": {
            "title": "Sell Digital Gold",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with selling gold",
            "inputSectionTitle": "How much gold do you want to sell?",
            "infoBannerMessage": "Live sell prices updated every 5 minutes",
            "purityBadgeMessage": "999.9 purity digital gold | 100% safe & secure",
            "disclaimerText": "Live buy/sell prices for Digital Gold are set by MMTC-PAMP",
            "retentionBannerHeading": "Embrace Long-Term Prosperity",
            "retentionBannerSubtext": "Keep Your Gold for Tomorrow!",
            "refreshTimeSeconds": 290,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "2000", "isPopular": false },
                    { "order": 2, "value": "5000", "isPopular": true },
                    { "order": 3, "value": "10000", "isPopular": false },
                    { "order": 4, "value": "15000", "isPopular": false },
                    { "order": 5, "value": "50000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "0.5", "isPopular": false },
                    { "order": 2, "value": "1", "isPopular": true },
                    { "order": 3, "value": "2", "isPopular": false },
                    { "order": 4, "value": "5", "isPopular": false },
                    { "order": 5, "value": "10", "isPopular": false }
                ]
            },
            "validationConfig": {
                "minAmount": 50,
                "maxAmount": 100000,
                "minWeight": 0.001,
                "maxWeight": 50
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review Transaction",
            "submitButtonText": "Confirm Sell",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with transaction review",
            "reviewTitle": "REVIEW TRANSACTION",
            "descriptionPrefix": "Will be credited to your account"
        },
        "thankYou": {
            "title": "Transaction Success",
            "submitButtonText": "View Transaction Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "You just sold",
            "messageSuffix": "of 999.9 Gold"
        },
        "thankYouSell": {
            "title": "Transaction Success",
            "heading": "Congratulations!",
            "messagePrefix": "You just sold",
            "messageSuffix": "of 999.9 Gold"
        },
        "paymentFailure": {
            "title": "Payment Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Payment Failed",
            "description": "We couldn'\''t process your payment. Please try again."
        }
    },
    "sip": {
        "collectTransactionDetailsSIP": {
            "title": "Start SIP in Gold",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with Gold SIP",
            "inputSectionTitle": "How much do you want to invest monthly?",
            "infoBannerMessage": "Start SIP with as little as Rs.100",
            "refreshTimeSeconds": 290,
            "minAmount": 100,
            "maxAmount": 500000,
            "minWeight": 0.001,
            "maxWeight": 50,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "100", "isPopular": true },
                    { "order": 2, "value": "500", "isPopular": false },
                    { "order": 3, "value": "1000", "isPopular": false },
                    { "order": 4, "value": "2500", "isPopular": false },
                    { "order": 5, "value": "5000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "0.5", "isPopular": false },
                    { "order": 2, "value": "1", "isPopular": true },
                    { "order": 3, "value": "2", "isPopular": false },
                    { "order": 4, "value": "5", "isPopular": false },
                    { "order": 5, "value": "10", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review SIP Details",
            "submitButtonText": "Confirm SIP",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with SIP review",
            "reviewTitle": "REVIEW SIP",
            "descriptionPrefix": "Your SIP will start from"
        },
        "thankYou": {
            "title": "SIP Started",
            "submitButtonText": "View SIP Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "Your Gold SIP has been started",
            "messageSuffix": ""
        },
        "thankYouSell": {
            "title": "SIP Started",
            "heading": "Congratulations!",
            "messagePrefix": "Your Gold SIP has been started",
            "messageSuffix": ""
        },
        "paymentFailure": {
            "title": "SIP Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "SIP Setup Failed",
            "description": "We couldn'\''t process your SIP. Please try again."
        }
    },
    "gift": {
        "collectTransactionDetailsGift": {
            "title": "Gift Gold",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with gifting gold",
            "inputSectionTitle": "How much gold do you want to gift?",
            "infoBannerMessage": "Gift the joy of gold to your loved ones",
            "refreshTimeSeconds": 290,
            "minAmount": 50,
            "maxAmount": 500000,
            "minWeight": 0.001,
            "maxWeight": 50,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "500", "isPopular": false },
                    { "order": 2, "value": "1000", "isPopular": true },
                    { "order": 3, "value": "5000", "isPopular": false },
                    { "order": 4, "value": "10000", "isPopular": false },
                    { "order": 5, "value": "25000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "1", "isPopular": false },
                    { "order": 2, "value": "2", "isPopular": true },
                    { "order": 3, "value": "5", "isPopular": false },
                    { "order": 4, "value": "10", "isPopular": false },
                    { "order": 5, "value": "20", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "Recipient PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with recipient PAN verification",
            "panFieldLabel": "Recipient PAN Number",
            "panFieldPlaceholder": "Enter recipient PAN",
            "nameFieldLabel": "Name as per PAN",
            "nameFieldPlaceholder": "Enter name as per PAN",
            "dobFieldLabel": "Date of Birth",
            "dobFieldPlaceholder": "DD/MM/YYYY",
            "noteText": "Recipient PAN details are required for compliance",
            "termsPreText": "By proceeding, you agree to our",
            "termsLinkText": "Terms & Conditions",
            "termsLinkHref": "https://www.adityabirlacapital.com/abc-digital/terms-conditions"
        },
        "nameConfirmation": {
            "title": "Name Confirmation",
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Recipient Name as per PAN",
            "instructionText": "Please confirm the recipient name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review Gift Details",
            "submitButtonText": "Confirm Gift",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with gift review",
            "reviewTitle": "REVIEW GIFT",
            "descriptionPrefix": "Gift will be sent to"
        },
        "thankYou": {
            "title": "Gold Gifted!",
            "submitButtonText": "View Gift Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Gold Gifting Successful!",
            "messagePrefix": "You have gifted",
            "messageSuffix": "of 999.9 Gold"
        },
        "thankYouSell": {
            "title": "Gold Gifted!",
            "heading": "Gold Gifting Successful!",
            "messagePrefix": "You have gifted",
            "messageSuffix": "of 999.9 Gold"
        },
        "paymentFailure": {
            "title": "Gift Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Gold Gifting Failed",
            "description": "We couldn'\''t process your gift. Please try again."
        }
    },
    "assets": {}
}'

# ==========================================
# GOLD - Partner: Vodafone
# ==========================================
GOLD_VODAFONE_JSON='{
    "subProduct": "gold",
    "partner": "Vodafone",
    "buy": {
        "collectTransactionDetailsBuy": {
            "title": "Buy Digital Gold",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with buying gold",
            "inputSectionTitle": "How much gold do you want to buy?",
            "infoBannerMessage": "Start investing with as little as Rs.50",
            "refreshTimeSeconds": 290,
            "minAmount": 50,
            "maxAmount": 500000,
            "minWeight": 0.001,
            "maxWeight": 50,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "500", "isPopular": false },
                    { "order": 2, "value": "1000", "isPopular": true },
                    { "order": 3, "value": "5000", "isPopular": false },
                    { "order": 4, "value": "10000", "isPopular": false },
                    { "order": 5, "value": "25000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "1", "isPopular": false },
                    { "order": 2, "value": "2", "isPopular": true },
                    { "order": 3, "value": "5", "isPopular": false },
                    { "order": 4, "value": "10", "isPopular": false },
                    { "order": 5, "value": "20", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Order Summary",
            "submitButtonText": "Proceed to Pay",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with order summary",
            "reviewTitle": "REVIEW TRANSACTION",
            "descriptionPrefix": "Total payable amount"
        },
        "thankYou": {
            "title": "Transaction Success",
            "submitButtonText": "View Transaction Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "You just purchased",
            "messageSuffix": "of 999.9 Gold"
        },
        "paymentFailure": {
            "title": "Payment Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Payment Failed",
            "description": "We couldn'\''t process your payment. Please try again."
        }
    },
    "sell": {
        "selectRedeemType": {
            "title": "Sell Gold",
            "sectionTitle": "How do you want to sell your gold?",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with redemption options",
            "paymentMethods": [
                {
                    "order": 1,
                    "methodId": "cash-instantly",
                    "methodType": "cash",
                    "iconSrc": "/assets/sell-flow/cashInHand.svg",
                    "iconAlt": "Cash in hand",
                    "title": "Cash Instantly",
                    "description": ["Get your money instantly deposited to your bank account."],
                    "options": [
                        { "order": 1, "iconSrc": "/assets/sell-flow/bank-outline.svg", "iconAlt": "Bank account", "label": "", "iconSize": 24 },
                        { "order": 2, "iconSrc": "/assets/sell-flow/upi.png", "iconAlt": "UPI", "label": "", "iconSize": 32 }
                    ]
                },
                {
                    "order": 2,
                    "methodId": "gold-in-hand",
                    "methodType": "gold-in-hand",
                    "iconSrc": "/assets/sell-flow/Gold-In-Hand.png",
                    "iconAlt": "Gold in-hand",
                    "title": "Gold in-hand",
                    "description": ["Pure 999.9 gold coin", "Get delivered in 7-8 days"]
                }
            ]
        },
        "collectTransactionDetailsSell": {
            "title": "Sell Digital Gold",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with selling gold",
            "inputSectionTitle": "How much gold do you want to sell?",
            "infoBannerMessage": "Live sell prices updated every 5 minutes",
            "purityBadgeMessage": "999.9 purity digital gold | 100% safe & secure",
            "disclaimerText": "Live buy/sell prices for Digital Gold are set by MMTC-PAMP",
            "retentionBannerHeading": "Embrace Long-Term Prosperity",
            "retentionBannerSubtext": "Keep Your Gold for Tomorrow!",
            "refreshTimeSeconds": 290,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "2000", "isPopular": false },
                    { "order": 2, "value": "5000", "isPopular": true },
                    { "order": 3, "value": "10000", "isPopular": false },
                    { "order": 4, "value": "15000", "isPopular": false },
                    { "order": 5, "value": "50000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "0.5", "isPopular": false },
                    { "order": 2, "value": "1", "isPopular": true },
                    { "order": 3, "value": "2", "isPopular": false },
                    { "order": 4, "value": "5", "isPopular": false },
                    { "order": 5, "value": "10", "isPopular": false }
                ]
            },
            "validationConfig": {
                "minAmount": 50,
                "maxAmount": 100000,
                "minWeight": 0.001,
                "maxWeight": 50
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review Transaction",
            "submitButtonText": "Confirm Sell",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with transaction review",
            "reviewTitle": "REVIEW TRANSACTION",
            "descriptionPrefix": "Will be credited to your account"
        },
        "thankYou": {
            "title": "Transaction Success",
            "submitButtonText": "View Transaction Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "You just sold",
            "messageSuffix": "of 999.9 Gold"
        },
        "thankYouSell": {
            "title": "Transaction Success",
            "heading": "Congratulations!",
            "messagePrefix": "You just sold",
            "messageSuffix": "of 999.9 Gold"
        },
        "paymentFailure": {
            "title": "Payment Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Payment Failed",
            "description": "We couldn'\''t process your payment. Please try again."
        }
    },
    "sip": {
        "collectTransactionDetailsSIP": {
            "title": "Start SIP in Gold",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with Gold SIP",
            "inputSectionTitle": "How much do you want to invest monthly?",
            "infoBannerMessage": "Start SIP with as little as Rs.100",
            "refreshTimeSeconds": 290,
            "minAmount": 100,
            "maxAmount": 500000,
            "minWeight": 0.001,
            "maxWeight": 50,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "100", "isPopular": true },
                    { "order": 2, "value": "500", "isPopular": false },
                    { "order": 3, "value": "1000", "isPopular": false },
                    { "order": 4, "value": "2500", "isPopular": false },
                    { "order": 5, "value": "5000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "0.5", "isPopular": false },
                    { "order": 2, "value": "1", "isPopular": true },
                    { "order": 3, "value": "2", "isPopular": false },
                    { "order": 4, "value": "5", "isPopular": false },
                    { "order": 5, "value": "10", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review SIP Details",
            "submitButtonText": "Confirm SIP",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with SIP review",
            "reviewTitle": "REVIEW SIP",
            "descriptionPrefix": "Your SIP will start from"
        },
        "thankYou": {
            "title": "SIP Started",
            "submitButtonText": "View SIP Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "Your Gold SIP has been started",
            "messageSuffix": ""
        },
        "thankYouSell": {
            "title": "SIP Started",
            "heading": "Congratulations!",
            "messagePrefix": "Your Gold SIP has been started",
            "messageSuffix": ""
        },
        "paymentFailure": {
            "title": "SIP Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "SIP Setup Failed",
            "description": "We couldn'\''t process your SIP. Please try again."
        }
    },
    "gift": {
        "collectTransactionDetailsGift": {
            "title": "Gift Gold",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with gifting gold",
            "inputSectionTitle": "How much gold do you want to gift?",
            "infoBannerMessage": "Gift the joy of gold to your loved ones",
            "refreshTimeSeconds": 290,
            "minAmount": 50,
            "maxAmount": 500000,
            "minWeight": 0.001,
            "maxWeight": 50,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "500", "isPopular": false },
                    { "order": 2, "value": "1000", "isPopular": true },
                    { "order": 3, "value": "5000", "isPopular": false },
                    { "order": 4, "value": "10000", "isPopular": false },
                    { "order": 5, "value": "25000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "1", "isPopular": false },
                    { "order": 2, "value": "2", "isPopular": true },
                    { "order": 3, "value": "5", "isPopular": false },
                    { "order": 4, "value": "10", "isPopular": false },
                    { "order": 5, "value": "20", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "Recipient PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with recipient PAN verification",
            "panFieldLabel": "Recipient PAN Number",
            "panFieldPlaceholder": "Enter recipient PAN",
            "nameFieldLabel": "Name as per PAN",
            "nameFieldPlaceholder": "Enter name as per PAN",
            "dobFieldLabel": "Date of Birth",
            "dobFieldPlaceholder": "DD/MM/YYYY",
            "noteText": "Recipient PAN details are required for compliance",
            "termsPreText": "By proceeding, you agree to our",
            "termsLinkText": "Terms & Conditions",
            "termsLinkHref": "https://www.adityabirlacapital.com/abc-digital/terms-conditions"
        },
        "nameConfirmation": {
            "title": "Name Confirmation",
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Recipient Name as per PAN",
            "instructionText": "Please confirm the recipient name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review Gift Details",
            "submitButtonText": "Confirm Gift",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with gift review",
            "reviewTitle": "REVIEW GIFT",
            "descriptionPrefix": "Gift will be sent to"
        },
        "thankYou": {
            "title": "Gold Gifted!",
            "submitButtonText": "View Gift Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Gold Gifting Successful!",
            "messagePrefix": "You have gifted",
            "messageSuffix": "of 999.9 Gold"
        },
        "thankYouSell": {
            "title": "Gold Gifted!",
            "heading": "Gold Gifting Successful!",
            "messagePrefix": "You have gifted",
            "messageSuffix": "of 999.9 Gold"
        },
        "paymentFailure": {
            "title": "Gift Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Gold Gifting Failed",
            "description": "We couldn'\''t process your gift. Please try again."
        }
    },
    "assets": {}
}'

# ==========================================
# SILVER - Partner: default
# ==========================================
SILVER_DEFAULT_JSON='{
    "subProduct": "silver",
    "partner": "default",
    "buy": {
        "collectTransactionDetailsBuy": {
            "title": "Buy Digital Silver",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with buying silver",
            "inputSectionTitle": "How much silver do you want to buy?",
            "infoBannerMessage": "Start investing with as little as Rs.50",
            "refreshTimeSeconds": 290,
            "minAmount": 50,
            "maxAmount": 500000,
            "minWeight": 0.1,
            "maxWeight": 1000,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "500", "isPopular": false },
                    { "order": 2, "value": "1000", "isPopular": true },
                    { "order": 3, "value": "5000", "isPopular": false },
                    { "order": 4, "value": "10000", "isPopular": false },
                    { "order": 5, "value": "25000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "10", "isPopular": false },
                    { "order": 2, "value": "50", "isPopular": true },
                    { "order": 3, "value": "100", "isPopular": false },
                    { "order": 4, "value": "250", "isPopular": false },
                    { "order": 5, "value": "500", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Order Summary",
            "submitButtonText": "Proceed to Pay",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with order summary",
            "reviewTitle": "REVIEW TRANSACTION",
            "descriptionPrefix": "Total payable amount"
        },
        "thankYou": {
            "title": "Transaction Success",
            "submitButtonText": "View Transaction Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "You just purchased",
            "messageSuffix": "of 999 Silver"
        },
        "paymentFailure": {
            "title": "Payment Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Payment Failed",
            "description": "We couldn'\''t process your payment. Please try again."
        }
    },
    "sell": {
        "selectRedeemType": {
            "title": "Sell Silver",
            "sectionTitle": "How do you want to sell your silver?",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with redemption options",
            "paymentMethods": [
                {
                    "order": 1,
                    "methodId": "cash-instantly",
                    "methodType": "cash",
                    "iconSrc": "/assets/sell-flow/cashInHand.svg",
                    "iconAlt": "Cash in hand",
                    "title": "Cash Instantly",
                    "description": ["Get your money instantly deposited to your bank account."],
                    "options": [
                        { "order": 1, "iconSrc": "/assets/sell-flow/bank-outline.svg", "iconAlt": "Bank account", "label": "", "iconSize": 24 },
                        { "order": 2, "iconSrc": "/assets/sell-flow/upi.png", "iconAlt": "UPI", "label": "", "iconSize": 32 }
                    ]
                },
                {
                    "order": 2,
                    "methodId": "silver-in-hand",
                    "methodType": "silver-in-hand",
                    "iconSrc": "/assets/sell-flow/Silver-In-Hand.png",
                    "iconAlt": "Silver in-hand",
                    "title": "Silver in-hand",
                    "description": ["Pure 999 silver coin", "Get delivered in 7-8 days"]
                }
            ]
        },
        "collectTransactionDetailsSell": {
            "title": "Sell Digital Silver",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with selling silver",
            "inputSectionTitle": "How much silver do you want to sell?",
            "infoBannerMessage": "Live sell prices updated every 5 minutes",
            "purityBadgeMessage": "999 purity digital silver | 100% safe & secure",
            "disclaimerText": "Live buy/sell prices for Digital Silver are set by MMTC-PAMP",
            "retentionBannerHeading": "Embrace Long-Term Prosperity",
            "retentionBannerSubtext": "Keep Your Silver for Tomorrow!",
            "refreshTimeSeconds": 290,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "1000", "isPopular": false },
                    { "order": 2, "value": "2000", "isPopular": true },
                    { "order": 3, "value": "5000", "isPopular": false },
                    { "order": 4, "value": "10000", "isPopular": false },
                    { "order": 5, "value": "25000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "10", "isPopular": false },
                    { "order": 2, "value": "50", "isPopular": true },
                    { "order": 3, "value": "100", "isPopular": false },
                    { "order": 4, "value": "250", "isPopular": false },
                    { "order": 5, "value": "500", "isPopular": false }
                ]
            },
            "validationConfig": {
                "minAmount": 50,
                "maxAmount": 100000,
                "minWeight": 0.1,
                "maxWeight": 1000
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review Transaction",
            "submitButtonText": "Confirm Sell",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with transaction review",
            "reviewTitle": "REVIEW TRANSACTION",
            "descriptionPrefix": "Will be credited to your account"
        },
        "thankYou": {
            "title": "Transaction Success",
            "submitButtonText": "View Transaction Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "You just sold",
            "messageSuffix": "of 999 Silver"
        },
        "thankYouSell": {
            "title": "Transaction Success",
            "heading": "Congratulations!",
            "messagePrefix": "You just sold",
            "messageSuffix": "of 999 Silver"
        },
        "paymentFailure": {
            "title": "Payment Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Payment Failed",
            "description": "We couldn'\''t process your payment. Please try again."
        }
    },
    "sip": {
        "collectTransactionDetailsSIP": {
            "title": "Start SIP in Silver",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with Silver SIP",
            "inputSectionTitle": "How much do you want to invest monthly?",
            "infoBannerMessage": "Start SIP with as little as Rs.100",
            "refreshTimeSeconds": 290,
            "minAmount": 100,
            "maxAmount": 500000,
            "minWeight": 0.1,
            "maxWeight": 1000,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "100", "isPopular": true },
                    { "order": 2, "value": "500", "isPopular": false },
                    { "order": 3, "value": "1000", "isPopular": false },
                    { "order": 4, "value": "2500", "isPopular": false },
                    { "order": 5, "value": "5000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "10", "isPopular": false },
                    { "order": 2, "value": "50", "isPopular": true },
                    { "order": 3, "value": "100", "isPopular": false },
                    { "order": 4, "value": "250", "isPopular": false },
                    { "order": 5, "value": "500", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review SIP Details",
            "submitButtonText": "Confirm SIP",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with SIP review",
            "reviewTitle": "REVIEW SIP",
            "descriptionPrefix": "Your SIP will start from"
        },
        "thankYou": {
            "title": "SIP Started",
            "submitButtonText": "View SIP Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "Your Silver SIP has been started",
            "messageSuffix": ""
        },
        "thankYouSell": {
            "title": "SIP Started",
            "heading": "Congratulations!",
            "messagePrefix": "Your Silver SIP has been started",
            "messageSuffix": ""
        },
        "paymentFailure": {
            "title": "SIP Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "SIP Setup Failed",
            "description": "We couldn'\''t process your SIP. Please try again."
        }
    },
    "gift": {
        "collectTransactionDetailsGift": {
            "title": "Gift Silver",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with gifting silver",
            "inputSectionTitle": "How much silver do you want to gift?",
            "infoBannerMessage": "Gift the joy of silver to your loved ones",
            "refreshTimeSeconds": 290,
            "minAmount": 50,
            "maxAmount": 500000,
            "minWeight": 0.1,
            "maxWeight": 1000,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "500", "isPopular": false },
                    { "order": 2, "value": "1000", "isPopular": true },
                    { "order": 3, "value": "5000", "isPopular": false },
                    { "order": 4, "value": "10000", "isPopular": false },
                    { "order": 5, "value": "25000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "10", "isPopular": false },
                    { "order": 2, "value": "50", "isPopular": true },
                    { "order": 3, "value": "100", "isPopular": false },
                    { "order": 4, "value": "250", "isPopular": false },
                    { "order": 5, "value": "500", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "Recipient PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with recipient PAN verification",
            "panFieldLabel": "Recipient PAN Number",
            "panFieldPlaceholder": "Enter recipient PAN",
            "nameFieldLabel": "Name as per PAN",
            "nameFieldPlaceholder": "Enter name as per PAN",
            "dobFieldLabel": "Date of Birth",
            "dobFieldPlaceholder": "DD/MM/YYYY",
            "noteText": "Recipient PAN details are required for compliance",
            "termsPreText": "By proceeding, you agree to our",
            "termsLinkText": "Terms & Conditions",
            "termsLinkHref": "https://www.adityabirlacapital.com/abc-digital/terms-conditions"
        },
        "nameConfirmation": {
            "title": "Name Confirmation",
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Recipient Name as per PAN",
            "instructionText": "Please confirm the recipient name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review Gift Details",
            "submitButtonText": "Confirm Gift",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with gift review",
            "reviewTitle": "REVIEW GIFT",
            "descriptionPrefix": "Gift will be sent to"
        },
        "thankYou": {
            "title": "Silver Gifted!",
            "submitButtonText": "View Gift Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Silver Gifting Successful!",
            "messagePrefix": "You have gifted",
            "messageSuffix": "of 999 Silver"
        },
        "thankYouSell": {
            "title": "Silver Gifted!",
            "heading": "Silver Gifting Successful!",
            "messagePrefix": "You have gifted",
            "messageSuffix": "of 999 Silver"
        },
        "paymentFailure": {
            "title": "Gift Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Silver Gifting Failed",
            "description": "We couldn'\''t process your gift. Please try again."
        }
    },
    "assets": {}
}'

# ==========================================
# SILVER - Partner: Vodafone
# ==========================================
SILVER_VODAFONE_JSON='{
    "subProduct": "silver",
    "partner": "Vodafone",
    "buy": {
        "collectTransactionDetailsBuy": {
            "title": "Buy Digital Silver",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with buying silver",
            "inputSectionTitle": "How much silver do you want to buy?",
            "infoBannerMessage": "Start investing with as little as Rs.50",
            "refreshTimeSeconds": 290,
            "minAmount": 50,
            "maxAmount": 500000,
            "minWeight": 0.1,
            "maxWeight": 1000,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "500", "isPopular": false },
                    { "order": 2, "value": "1000", "isPopular": true },
                    { "order": 3, "value": "5000", "isPopular": false },
                    { "order": 4, "value": "10000", "isPopular": false },
                    { "order": 5, "value": "25000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "10", "isPopular": false },
                    { "order": 2, "value": "50", "isPopular": true },
                    { "order": 3, "value": "100", "isPopular": false },
                    { "order": 4, "value": "250", "isPopular": false },
                    { "order": 5, "value": "500", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Order Summary",
            "submitButtonText": "Proceed to Pay",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with order summary",
            "reviewTitle": "REVIEW TRANSACTION",
            "descriptionPrefix": "Total payable amount"
        },
        "thankYou": {
            "title": "Transaction Success",
            "submitButtonText": "View Transaction Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "You just purchased",
            "messageSuffix": "of 999 Silver"
        },
        "paymentFailure": {
            "title": "Payment Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Payment Failed",
            "description": "We couldn'\''t process your payment. Please try again."
        }
    },
    "sell": {
        "selectRedeemType": {
            "title": "Sell Silver",
            "sectionTitle": "How do you want to sell your silver?",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with redemption options",
            "paymentMethods": [
                {
                    "order": 1,
                    "methodId": "cash-instantly",
                    "methodType": "cash",
                    "iconSrc": "/assets/sell-flow/cashInHand.svg",
                    "iconAlt": "Cash in hand",
                    "title": "Cash Instantly",
                    "description": ["Get your money instantly deposited to your bank account."],
                    "options": [
                        { "order": 1, "iconSrc": "/assets/sell-flow/bank-outline.svg", "iconAlt": "Bank account", "label": "", "iconSize": 24 },
                        { "order": 2, "iconSrc": "/assets/sell-flow/upi.png", "iconAlt": "UPI", "label": "", "iconSize": 32 }
                    ]
                },
                {
                    "order": 2,
                    "methodId": "silver-in-hand",
                    "methodType": "silver-in-hand",
                    "iconSrc": "/assets/sell-flow/Silver-In-Hand.png",
                    "iconAlt": "Silver in-hand",
                    "title": "Silver in-hand",
                    "description": ["Pure 999 silver coin", "Get delivered in 7-8 days"]
                }
            ]
        },
        "collectTransactionDetailsSell": {
            "title": "Sell Digital Silver",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with selling silver",
            "inputSectionTitle": "How much silver do you want to sell?",
            "infoBannerMessage": "Live sell prices updated every 5 minutes",
            "purityBadgeMessage": "999 purity digital silver | 100% safe & secure",
            "disclaimerText": "Live buy/sell prices for Digital Silver are set by MMTC-PAMP",
            "retentionBannerHeading": "Embrace Long-Term Prosperity",
            "retentionBannerSubtext": "Keep Your Silver for Tomorrow!",
            "refreshTimeSeconds": 290,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "1000", "isPopular": false },
                    { "order": 2, "value": "2000", "isPopular": true },
                    { "order": 3, "value": "5000", "isPopular": false },
                    { "order": 4, "value": "10000", "isPopular": false },
                    { "order": 5, "value": "25000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "10", "isPopular": false },
                    { "order": 2, "value": "50", "isPopular": true },
                    { "order": 3, "value": "100", "isPopular": false },
                    { "order": 4, "value": "250", "isPopular": false },
                    { "order": 5, "value": "500", "isPopular": false }
                ]
            },
            "validationConfig": {
                "minAmount": 50,
                "maxAmount": 100000,
                "minWeight": 0.1,
                "maxWeight": 1000
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review Transaction",
            "submitButtonText": "Confirm Sell",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with transaction review",
            "reviewTitle": "REVIEW TRANSACTION",
            "descriptionPrefix": "Will be credited to your account"
        },
        "thankYou": {
            "title": "Transaction Success",
            "submitButtonText": "View Transaction Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "You just sold",
            "messageSuffix": "of 999 Silver"
        },
        "thankYouSell": {
            "title": "Transaction Success",
            "heading": "Congratulations!",
            "messagePrefix": "You just sold",
            "messageSuffix": "of 999 Silver"
        },
        "paymentFailure": {
            "title": "Payment Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Payment Failed",
            "description": "We couldn'\''t process your payment. Please try again."
        }
    },
    "sip": {
        "collectTransactionDetailsSIP": {
            "title": "Start SIP in Silver",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with Silver SIP",
            "inputSectionTitle": "How much do you want to invest monthly?",
            "infoBannerMessage": "Start SIP with as little as Rs.100",
            "refreshTimeSeconds": 290,
            "minAmount": 100,
            "maxAmount": 500000,
            "minWeight": 0.1,
            "maxWeight": 1000,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "100", "isPopular": true },
                    { "order": 2, "value": "500", "isPopular": false },
                    { "order": 3, "value": "1000", "isPopular": false },
                    { "order": 4, "value": "2500", "isPopular": false },
                    { "order": 5, "value": "5000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "10", "isPopular": false },
                    { "order": 2, "value": "50", "isPopular": true },
                    { "order": 3, "value": "100", "isPopular": false },
                    { "order": 4, "value": "250", "isPopular": false },
                    { "order": 5, "value": "500", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with PAN verification",
            "panFieldLabel": "PAN Number",
            "panFieldPlaceholder": "Enter your PAN",
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
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Name as per PAN",
            "instructionText": "Please confirm your name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review SIP Details",
            "submitButtonText": "Confirm SIP",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with SIP review",
            "reviewTitle": "REVIEW SIP",
            "descriptionPrefix": "Your SIP will start from"
        },
        "thankYou": {
            "title": "SIP Started",
            "submitButtonText": "View SIP Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Congratulations!",
            "messagePrefix": "Your Silver SIP has been started",
            "messageSuffix": ""
        },
        "thankYouSell": {
            "title": "SIP Started",
            "heading": "Congratulations!",
            "messagePrefix": "Your Silver SIP has been started",
            "messageSuffix": ""
        },
        "paymentFailure": {
            "title": "SIP Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "SIP Setup Failed",
            "description": "We couldn'\''t process your SIP. Please try again."
        }
    },
    "gift": {
        "collectTransactionDetailsGift": {
            "title": "Gift Silver",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with gifting silver",
            "inputSectionTitle": "How much silver do you want to gift?",
            "infoBannerMessage": "Gift the joy of silver to your loved ones",
            "refreshTimeSeconds": 290,
            "minAmount": 50,
            "maxAmount": 500000,
            "minWeight": 0.1,
            "maxWeight": 1000,
            "amountChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "500", "isPopular": false },
                    { "order": 2, "value": "1000", "isPopular": true },
                    { "order": 3, "value": "5000", "isPopular": false },
                    { "order": 4, "value": "10000", "isPopular": false },
                    { "order": 5, "value": "25000", "isPopular": false }
                ]
            },
            "weightChips": {
                "enabled": true,
                "content": [
                    { "order": 1, "value": "10", "isPopular": false },
                    { "order": 2, "value": "50", "isPopular": true },
                    { "order": 3, "value": "100", "isPopular": false },
                    { "order": 4, "value": "250", "isPopular": false },
                    { "order": 5, "value": "500", "isPopular": false }
                ]
            }
        },
        "panVerification": {
            "title": "Recipient PAN Verification",
            "submitButtonText": "Verify PAN",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with recipient PAN verification",
            "panFieldLabel": "Recipient PAN Number",
            "panFieldPlaceholder": "Enter recipient PAN",
            "nameFieldLabel": "Name as per PAN",
            "nameFieldPlaceholder": "Enter name as per PAN",
            "dobFieldLabel": "Date of Birth",
            "dobFieldPlaceholder": "DD/MM/YYYY",
            "noteText": "Recipient PAN details are required for compliance",
            "termsPreText": "By proceeding, you agree to our",
            "termsLinkText": "Terms & Conditions",
            "termsLinkHref": "https://www.adityabirlacapital.com/abc-digital/terms-conditions"
        },
        "nameConfirmation": {
            "title": "Name Confirmation",
            "submitButtonText": "Confirm & Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with name confirmation",
            "nameFieldLabel": "Recipient Name as per PAN",
            "instructionText": "Please confirm the recipient name matches the PAN records"
        },
        "paymentDetails": {
            "title": "Payment Details",
            "submitButtonText": "Continue",
            "secondaryLinkText": "Go back",
            "helpAriaLabel": "Get help with payment details",
            "upiSectionTitle": "Select UPI",
            "bankSectionTitle": "Select Bank Account",
            "addNewUpiText": "Add new UPI ID",
            "addNewBankText": "Add new bank account"
        },
        "otpVerification": {
            "title": "OTP Verification",
            "submitButtonText": "Verify",
            "secondaryLinkText": "Resend OTP",
            "helpAriaLabel": "Get help with OTP verification",
            "instructionText": "Enter the OTP sent to your registered mobile number",
            "otpLength": 6
        },
        "reviewTransaction": {
            "title": "Review Gift Details",
            "submitButtonText": "Confirm Gift",
            "secondaryLinkText": "Modify details",
            "helpAriaLabel": "Get help with gift review",
            "reviewTitle": "REVIEW GIFT",
            "descriptionPrefix": "Gift will be sent to"
        },
        "thankYou": {
            "title": "Silver Gifted!",
            "submitButtonText": "View Gift Details",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help",
            "heading": "Silver Gifting Successful!",
            "messagePrefix": "You have gifted",
            "messageSuffix": "of 999 Silver"
        },
        "thankYouSell": {
            "title": "Silver Gifted!",
            "heading": "Silver Gifting Successful!",
            "messagePrefix": "You have gifted",
            "messageSuffix": "of 999 Silver"
        },
        "paymentFailure": {
            "title": "Gift Failed",
            "submitButtonText": "Try Again",
            "secondaryLinkText": "Go to Dashboard",
            "helpAriaLabel": "Get help with payment",
            "heading": "Silver Gifting Failed",
            "description": "We couldn'\''t process your gift. Please try again."
        }
    },
    "assets": {}
}'

# Seed all entries
seed_entry "Gold - Partner: default" "$GOLD_DEFAULT_JSON"
seed_entry "Gold - Partner: Vodafone" "$GOLD_VODAFONE_JSON"
# Skipping Silver - Partner: default
seed_entry "Silver - Partner: Vodafone" "$SILVER_VODAFONE_JSON"

echo ""
echo "=============================================="
echo "Seeding completed!"
echo "=============================================="
