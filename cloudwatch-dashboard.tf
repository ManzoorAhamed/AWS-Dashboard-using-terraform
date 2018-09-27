provider "aws" {
  region			= "us-east-1"
  shared_credentials_file	= "/Users/<userName>/.aws/credentials"
  profile                 = "AWS-Profile"
}


module "Wordpress-TEST" {
	dashboardName = "Wordpress-TEST"
	fileName = "Wordpress-TEST.yaml"
	source		= "./dashboardboard"
}

module "Wordpress-QA" {
        dashboardName = "Wordpress-QA"
        fileName = "Wordpress-QA.yaml"
        source          = "./dashboardboard"
}


module "Wordpress-Prod" {
        dashboardName = "Wordpress-Prod"
        fileName = "Wordpress-PROD.yaml"
        source          = "./dashboardboard"
}
