Before starting the project :
nvm use 20

To clean stale data:-
rm -rf .cache build .strapi .strapi-updater.json dist/
rm -rf .cache build .strapi node_modules/.vite
rm -rf node_modules/ dist/ .strapi .strapi-updater.json .cache

Command to generate APIs :
npm run strapi generate api digimetal-navigation

--------------------------------------------
MySQL commands;

use abc_dost;show tables;

--------------------------------------------

MYSQL Dump:

Command template:
mysqldump -u <DB_USER> -pPassword@123 <DB_NAME> up_permissions up_permissions_role_lnk up_roles up_users up_users_role_lnk > strapi_permissions_dump.sql;

Actual Command:
mysqldump -u root -pPassword@123 abc_dost up_permissions up_permissions_role_lnk up_roles up_users up_users_role_lnk > strapi_permissions_dump.sql;

--------------------------------------------
## MySQL start command:
sudo service mysql start

## MySQL status command:
sudo service mysql status

## MySQL stop command:
sudo service mysql stop

MYSQL Import:

Command template:
mysql -u <DB_USER> -p <DB_NAME> < strapi_permissions_dump.sql

Actual Command:
mysql -u root -pPassword@123 abc_dost < strapi_permissions_dump.sql


--------------------------------------------

Admin Registration URL : http://127.0.0.1:1337/dashboard/auth/register
Admin Login URL : http://127.0.0.1:1337/dashboard/auth/login

Error : Whenever error comes -> "An error occured, or 404 API error", do this:-

1. Go to /config/server.ts
2. Check -> url: '/strapi' should not be present
3. Do this :-
rm -rf .cache build
npm run build
npm run develop


--------------------------------------------
APIs :-

http://127.0.0.1:1337/api/categories?populate=*
http://127.0.0.1:1337/api/communication-channels?populate=*
http://127.0.0.1:1337/api/dashboard-contents?populate=*
http://127.0.0.1:1337/api/dsk-categories?populate=*
http://127.0.0.1:1337/api/dsk-subcategories?populate=*
http://127.0.0.1:1337/api/faqs?populate=*
http://127.0.0.1:1337/api/help-chips?populate=*
http://127.0.0.1:1337/api/help-topics?populate=*
http://127.0.0.1:1337/api/historical-gold-prices?populate=*
http://127.0.0.1:1337/api/landing-articles?populate=*
http://127.0.0.1:1337/api/landing-banners?populate=*
http://127.0.0.1:1337/api/landing-comparisons?populate=*
http://127.0.0.1:1337/api/landing-comparison-criteria?populate=*
http://127.0.0.1:1337/api/landing-configs?populate=*
http://127.0.0.1:1337/api/landing-features?populate=*
http://127.0.0.1:1337/api/landing-pages?populate=*
http://127.0.0.1:1337/api/landing-steps?populate=*
http://127.0.0.1:1337/api/landing-trust-pointers?populate=*
http://127.0.0.1:1337/api/landing-videos?populate=*
http://127.0.0.1:1337/api/non-executable-quotes?populate=*
http://127.0.0.1:1337/api/order-histories?populate=*
http://127.0.0.1:1337/api/order-history-v-twos?populate=*
http://127.0.0.1:1337/api/partner-configs?populate=*
http://127.0.0.1:1337/api/portfolios?populate=*
http://127.0.0.1:1337/api/product-tutorials?populate=*
http://127.0.0.1:1337/api/questions-and-answers?populate=*
http://127.0.0.1:1337/api/sales-enablers?populate=*
http://127.0.0.1:1337/api/sales-materials?populate=*
http://127.0.0.1:1337/api/sub-categories?populate=*
http://127.0.0.1:1337/api/user-gifts?populate=*
http://127.0.0.1:1337/api/user-sips?populate=*

Gold Loan APIs :-

http://127.0.0.1:1337/api/gl-calculator-configs?populate=*
http://127.0.0.1:1337/api/gl-campaign-configs?populate=*
http://127.0.0.1:1337/api/gl-eligibility-configs?populate=*
http://127.0.0.1:1337/api/gl-faqs?populate=*
http://127.0.0.1:1337/api/gl-homepage-configs?populate=*
http://127.0.0.1:1337/api/gl-journey-screens?populate=*
http://127.0.0.1:1337/api/gl-lender-configs?populate=*
http://127.0.0.1:1337/api/gl-loan-company-masters?populate=*
http://127.0.0.1:1337/api/gl-toggle-configs?populate=*
