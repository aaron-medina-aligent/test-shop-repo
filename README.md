Now it's done and time to write a readme file.

Here's the file structure:
shopify-theme-development-tools
├── bitbucket-pipelines.yml
├── Dockerfile
├── download.sh
├── local_dev_scripts
│   ├── set-up-dev-env.sh
│   ├── shopify-build.sh
│   ├── shopify-dev.sh
│   ├── shopify-get-theme-info.sh
│   ├── shopify-run.sh
│   ├── shopify-stop.sh
│   ├── shopify-theme-check.sh
│   ├── shopify-theme-pull.sh
│   └── utils.sh
├── local.env
└── README.md

Can you please help me write the README file on how to set up a new shopify client repository.

TARGET STRUCTURE FOR README
Title: Aligent Shopify Theme Development Tools
Information:
- version: (beta) 1.0
- author: Aaron Medina aaron.medina@aligent.com.au
File Structure:
File Description:
Usage Instructions:


----------------

Description for this repository:
This repo contains script that will assist in setting up the client's shopify theme repository and development environment.
This also contains scripts that will help the developers during the implementation process.
<Feel free to add more description based on the content of the repository>

File Structure:
shopify-theme-development-tools
├── bitbucket-pipelines.yml
├── Dockerfile
├── download.sh
├── local_dev_scripts
│   ├── set-up-dev-env.sh
│   ├── shopify-build.sh
│   ├── shopify-dev.sh
│   ├── shopify-get-theme-info.sh
│   ├── shopify-run.sh
│   ├── shopify-stop.sh
│   ├── shopify-theme-check.sh
│   ├── shopify-theme-pull.sh
│   └── utils.sh
├── local.env
└── README.md

File Description:
bitbucket-pipelines.yml - contains the configuration for the bitbucket pipelines.
Dockerfile - contains the configuration for the docker image for the local development environment.
download.sh - script that will download all the necessary files for the shopify theme development tools.
local_dev_scripts - directory that contains all the scripts that will help the developers during the implementation process.
set-up-dev-env.sh - script that will set up the development environment for the shopify theme, will initiate the local.env file.
shopify-build.sh - script that builds the docker image
shopify-dev.sh -
shopify-get-theme-info.sh - 
shopify-run.sh - 
shopify-stop.sh -
shopify-theme-check.sh - 
shopify-theme-pull.sh - 
utils.sh - 
local.env - will contain the environment variables for the local development environment. THIS SHOULD NOT BE INCLUDED IN THE REPOSITORY.


Usage Instructions:
1. Create a new bitbucket repository for the client's shopify theme.
2. Get into the repository and run the following command:
   ```
    bash <(curl -s https://raw.githubusercontent.com/aaron-medina-aligent/test-shop-repo/main/download.sh)
   ```
   This will download all the necessary files for the shopify theme development tools, will generate a gitignore file that ensures the local.environment will not be included in the repository.
3. Run the following command to set up the development environment:
   ```
   bash ./local_dev_scripts/set-up-dev-env.sh
   ```
   This will set up the development environment for the shopify theme and will prompt for the following information

   IMAGE_NAME (current: shopify-docker-image) - Default value. Can leave as is.
   CONTAINER_NAME (current: shopify-container) - Default value. Can leave as is. 
   SHOPIFY_STORE (current: mystore.shopify) - Must be a valid shopify store 
   THEME_ID (current: XXXXXXXX) - Target theme that you would like to work on. You can use the shopify-get-theme-info.sh and update this part later. 
   FAIL_LEVEL [crash|error|suggestion|style|warning|info] (current: crash) - 
   SHOPIFY_ACCESS_TOKEN (current: XXXXXXXXXXXX) - Generated from Theme Access app from Shopify
4. 