curl --location 'https://abcduat1.abcscuat.com/strapi/api/digimetal-journey-pages' \
--header 'Content-Type: application/json' \
--data '{
    "data": {
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
                        {
                            "order": 1,
                            "value": "500",
                            "isPopular": false
                        },
                        {
                            "order": 2,
                            "value": "1000",
                            "isPopular": true
                        },
                        {
                            "order": 3,
                            "value": "5000",
                            "isPopular": false
                        },
                        {
                            "order": 4,
                            "value": "10000",
                            "isPopular": false
                        },
                        {
                            "order": 5,
                            "value": "25000",
                            "isPopular": false
                        }
                    ]
                },
                "weightChips": {
                    "enabled": true,
                    "content": [
                        {
                            "order": 1,
                            "value": "1",
                            "isPopular": false
                        },
                        {
                            "order": 2,
                            "value": "2",
                            "isPopular": true
                        },
                        {
                            "order": 3,
                            "value": "5",
                            "isPopular": false
                        },
                        {
                            "order": 4,
                            "value": "10",
                            "isPopular": false
                        },
                        {
                            "order": 5,
                            "value": "20",
                            "isPopular": false
                        }
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
                        "description": [
                            "Get your money instantly deposited to your bank account."
                        ],
                        "options": [
                            {
                                "order": 1,
                                "iconSrc": "/assets/sell-flow/bank-outline.svg",
                                "iconAlt": "Bank account",
                                "label": "",
                                "iconSize": 24
                            },
                            {
                                "order": 2,
                                "iconSrc": "/assets/sell-flow/upi.png",
                                "iconAlt": "UPI",
                                "label": "",
                                "iconSize": 32
                            }
                        ]
                    },
                    {
                        "order": 2,
                        "methodId": "gold-in-hand",
                        "methodType": "gold-in-hand",
                        "iconSrc": "/assets/sell-flow/Gold-In-Hand.png",
                        "iconAlt": "Gold in-hand",
                        "title": "Gold in-hand",
                        "description": [
                            "Pure 999.9 gold coin",
                            "Get delivered in 7-8 days"
                        ]
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
                        {
                            "order": 1,
                            "value": "2000",
                            "isPopular": false
                        },
                        {
                            "order": 2,
                            "value": "5000",
                            "isPopular": true
                        },
                        {
                            "order": 3,
                            "value": "10000",
                            "isPopular": false
                        },
                        {
                            "order": 4,
                            "value": "15000",
                            "isPopular": false
                        },
                        {
                            "order": 5,
                            "value": "50000",
                            "isPopular": false
                        }
                    ]
                },
                "weightChips": {
                    "enabled": true,
                    "content": [
                        {
                            "order": 1,
                            "value": "0.5",
                            "isPopular": false
                        },
                        {
                            "order": 2,
                            "value": "1",
                            "isPopular": true
                        },
                        {
                            "order": 3,
                            "value": "2",
                            "isPopular": false
                        },
                        {
                            "order": 4,
                            "value": "5",
                            "isPopular": false
                        },
                        {
                            "order": 5,
                            "value": "10",
                            "isPopular": false
                        }
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
                        {
                            "order": 1,
                            "value": "100",
                            "isPopular": true
                        },
                        {
                            "order": 2,
                            "value": "500",
                            "isPopular": false
                        },
                        {
                            "order": 3,
                            "value": "1000",
                            "isPopular": false
                        },
                        {
                            "order": 4,
                            "value": "2500",
                            "isPopular": false
                        },
                        {
                            "order": 5,
                            "value": "5000",
                            "isPopular": false
                        }
                    ]
                },
                "weightChips": {
                    "enabled": true,
                    "content": [
                        {
                            "order": 1,
                            "value": "0.5",
                            "isPopular": false
                        },
                        {
                            "order": 2,
                            "value": "1",
                            "isPopular": true
                        },
                        {
                            "order": 3,
                            "value": "2",
                            "isPopular": false
                        },
                        {
                            "order": 4,
                            "value": "5",
                            "isPopular": false
                        },
                        {
                            "order": 5,
                            "value": "10",
                            "isPopular": false
                        }
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
                        {
                            "order": 1,
                            "value": "500",
                            "isPopular": false
                        },
                        {
                            "order": 2,
                            "value": "1000",
                            "isPopular": true
                        },
                        {
                            "order": 3,
                            "value": "5000",
                            "isPopular": false
                        },
                        {
                            "order": 4,
                            "value": "10000",
                            "isPopular": false
                        },
                        {
                            "order": 5,
                            "value": "25000",
                            "isPopular": false
                        }
                    ]
                },
                "weightChips": {
                    "enabled": true,
                    "content": [
                        {
                            "order": 1,
                            "value": "1",
                            "isPopular": false
                        },
                        {
                            "order": 2,
                            "value": "2",
                            "isPopular": true
                        },
                        {
                            "order": 3,
                            "value": "5",
                            "isPopular": false
                        },
                        {
                            "order": 4,
                            "value": "10",
                            "isPopular": false
                        },
                        {
                            "order": 5,
                            "value": "20",
                            "isPopular": false
                        }
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
    }
}'