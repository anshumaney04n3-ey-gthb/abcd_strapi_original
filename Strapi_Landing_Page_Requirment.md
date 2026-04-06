# Strapi Requirement - Component-wise

## Calculator

Strapi Component Name: `loans-landing-page`

Strapi URL: `/strapi/api/loans-landing-pages`

| Field Name | Type | Strapi Path |
|------------|------|-------------|
| interestRatePerMonth | number | calculator.interestRatePerMonth |
| ltvRatio | number | calculator.ltvRatio |
| noteLabel | string | calculator.noteLabel |
| noteText | string | calculator.noteText |

Sample Response:

```json
{
	"calculator": {
		"interestRatePerMonth": 0.74,
		"ltvRatio": 0.75,
		"noteLabel": "Note:",
		"noteText": "This is a tentative offer calculated on basis of LTV ratio of 75%. Final offer is subjective to lender's policy norms."
	}
}
```

## Process

Strapi Component Name: `loans-landing-page`

Strapi URL: `/strapi/api/loans-landing-pages`

| Field Name | Type | Strapi Path |
|------------|------|-------------|
| eyebrowText | string | process.eyebrowText |
| subtitle | string | process.subtitle |
| firstRowCount | number | process.firstRowCount |
| steps | component[] | process.steps |

Sample Response:

```json
{
	"process": {
		"eyebrowText": "Gold loan",
		"subtitle": "in 5 easy steps",
		"firstRowCount": 3,
		"steps": [
			{
				"id": "apply",
				"label": "Apply for a Gold Loan"
			},
			{
				"id": "appraise",
				"label": "Get your Gold Appraised"
			}
		]
	}
}
```

## Process Steps

Strapi Component Name: New component required for `process.steps[]`

Strapi URL: `/strapi/api/loans-landing-pages`

| Field Name | Type |
|------------|------|
| id | string |
| label | string |

Sample Response:

```json
{
	"id": "apply",
	"label": "Apply for a Gold Loan"
}
```

## Security Features

Strapi Component Name: `loans-landing-page`

Strapi URL: `/strapi/api/loans-landing-pages`

| Field Name | Type | Strapi Path |
|------------|------|-------------|
| title | string | securityFeatures.title |

Sample Response:

```json
{
	"securityFeatures": {
		"title": "Discover the Benefits of Gold Loan on ABCD"
	}
}
```

## App Promo

Strapi Component Name: `loans-landing-page`

Strapi URL: `/strapi/api/loans-landing-pages`

| Field Name | Type | Strapi Path |
|------------|------|-------------|
| title | string | appPromo.title |
| subtitle | string | appPromo.subtitle |

Sample Response:

```json
{
	"appPromo": {
		"title": "Everything Finance\nas simple as\nABCD",
		"subtitle": "Download the ABCD app and start doing more with your money everyday"
	}
}
```

## Hero

Strapi Component Name: `loans-landing-page`

Strapi URL: `/strapi/api/loans-landing-pages`

| Field Name | Type | Strapi Path |
|------------|------|-------------|
| priceValue | string | hero.priceValue |

Sample Response:

```json
{
	"hero": {
		"priceValue": "Up to 75% of gold value"
	}
}
```

## Overall Expected Response

```json
{
	"data": [
		{
			"calculator": {
				"interestRatePerMonth": 0.74,
				"ltvRatio": 0.75,
				"noteLabel": "Note:",
				"noteText": "This is a tentative offer calculated on basis of LTV ratio of 75%. Final offer is subjective to lender's policy norms."
			},
			"process": {
				"eyebrowText": "Gold loan",
				"subtitle": "in 5 easy steps",
				"firstRowCount": 3,
				"steps": [
					{
						"id": "apply",
						"label": "Apply for a Gold Loan"
					},
					{
						"id": "appraise",
						"label": "Get your Gold Appraised"
					}
				]
			},
			"securityFeatures": {
				"title": "Discover the Benefits of Gold Loan on ABCD"
			},
			"appPromo": {
				"title": "Everything Finance\nas simple as\nABCD",
				"subtitle": "Download the ABCD app and start doing more with your money everyday"
			},
			"hero": {
				"priceValue": "Up to 75% of gold value"
			}
		}
	]
}
```

