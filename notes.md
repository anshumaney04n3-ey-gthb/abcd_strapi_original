
Can be accessed via : docker-compose exec python python to run Python commands


ssh-keygen -t ed25519 -C "anshuman.ranjan-v@adityabirlacapital.com"
cat ~/.ssh/id_ed25519.pub
ssh -T git@github.com

git clone git@github.com:AdityaBirlaCapitalDigital/abcd_strapi_dost_portal.git
cd abcd_strapi_dost_portal/

git config --global user.name "anshuman-ranjan-ABCD-EY" && git config --global user.email "anshuman.ranjan-v@adityabirlacapital.com"

git checkout qa && git pull origin qa

-----------------------------------------------------------------------------------------------
docker-compose up -d
docker ps -a
docker stop abc_dost_mysql abc_dost_python abc_dost_redis && docker rm abc_dost_mysql abc_dost_python abc_dost_redis && docker-compose up -d

-----------------------------------------------------------------------------------------------

rm -rf build dist/ .strapi 
.strapi-updater.json node_modules/ .cache && sleep 10 && echo "Waiting 10 seconds" && nvm use 20 && sleep 10 && echo "Waiting 10 seco
nds" && npm i && sleep 10 && echo "Waiting 10 seconds" && npm run develop

npm install @strapi/plugin-documentation@5.1.0 -E

-----------------------------------------------------------------------------------------------

Email : lucky.rajeshrathod-v@adityabirlacapital.com
Password : aiml@2025


manish.h-v@aditybirlacapital.com
sheena.saini-v@adityabirlacapital.com


-----------------------------------------------------------------------------------------------

Grafana Login creds
 
https://abcduat1.abcscuat.com/grafana/login
User: Grafana
Pass: grafana123

------------------------------------------------------------------------
npx strapi generate api loans-landing-page
npx strapi generate api investments-landing-page
npx strapi generate api tracks-landing-page
npx strapi generate api cards-landing-page
npx strapi generate api insurance-landing-page

npx strapi generate api loans-dashboard-page
npx strapi generate api investments-dashboard-page
npx strapi generate api tracks-dashboard-page
npx strapi generate api cards-dashboard-page
npx strapi generate api insurance-dashboard-page

npx strapi generate api loans-navigation
npx strapi generate api investments-navigation
npx strapi generate api tracks-navigation
npx strapi generate api cards-navigation
npx strapi generate api insurance-navigation

npx strapi generate api loans-journey-page
npx strapi generate api investments-journey-page
npx strapi generate api tracks-journey-page
npx strapi generate api cards-journey-page
npx strapi generate api insurance-journey-page

npx strapi generate api loans-partner-config
npx strapi generate api investments-partner-config
npx strapi generate api tracks-partner-config
npx strapi generate api cards-partner-config
npx strapi generate api insurance-partner-config

npx strapi generate api loans-channel-mapping
npx strapi generate api investments-channel-mapping
npx strapi generate api tracks-channel-mapping
npx strapi generate api cards-channel-mapping
npx strapi generate api insurance-channel-mapping


------------------------------------------------------------------------

Write a script for the below mentioned APIs to send POST request to them with sample data. I will run the script only once. Take your time and in terminal, please log what APIs you have given POST request and successfully entered the data. Remember that you only have to make API calls.

BaseURL : https://abcduat1.abcscuat.com/strapi


List of the APIs :
npx strapi generate api loans-landing-page
npx strapi generate api investments-landing-page
npx strapi generate api tracks-landing-page
npx strapi generate api cards-landing-page
npx strapi generate api insurance-landing-page

npx strapi generate api loans-dashboard-page
npx strapi generate api investments-dashboard-page
npx strapi generate api tracks-dashboard-page
npx strapi generate api cards-dashboard-page
npx strapi generate api insurance-dashboard-page

npx strapi generate api loans-navigation
npx strapi generate api investments-navigation
npx strapi generate api tracks-navigation
npx strapi generate api cards-navigation
npx strapi generate api insurance-navigation

npx strapi generate api loans-journey-page
npx strapi generate api investments-journey-page
npx strapi generate api tracks-journey-page
npx strapi generate api cards-journey-page
npx strapi generate api insurance-journey-page

npx strapi generate api loans-partner-config
npx strapi generate api investments-partner-config
npx strapi generate api tracks-partner-config
npx strapi generate api cards-partner-config
npx strapi generate api insurance-partner-config

npx strapi generate api loans-channel-mapping
npx strapi generate api investments-channel-mapping
npx strapi generate api tracks-channel-mapping
npx strapi generate api cards-channel-mapping
npx strapi generate api insurance-channel-mapping

Directory to find the APIs reference to create request body -> abcd_strapi_dost_portal/src/api/<collectionName>/content-types/<collectionName>/schema.json
------------------------------------------------------------------------
now create a folder named - curl-commands. Inside this folder provide all the GET curl with populate=* and                
  filter[subProduct][$eq]=gold in query params,  for all the POST APIs you just hit with the script. All GET curls should   
  be a separate file. 

Only create curl file, don't create sh file.
-----------------------------



Write a script for the below mentioned APIs to send POST request to them with sample data. File name -> seed-data-new.sh . I will run the script only once. Take your time and in terminal, please log what APIs you have given POST request and successfully entered the data. Remember that you only have to make API calls.

BaseURL : https://abcduat1.abcscuat.com/strapi

APIs :

1. loans-*
2. cards-*
3. digimetal-*
4. insurance-*
5. investments-*
6. tracks-*

Directory to find the APIs reference to create request body -> abcd_strapi_dost_portal/src/api/<collectionName>/content-types/<collectionName>/schema.json


-----------------------------------

ollama launch opencode --model minimax-m2.7:cloud
opencode models --refresh
opencode upgrade
curl -fsSL https://opencode.ai/install | bash
npm i -g opencode-ai
