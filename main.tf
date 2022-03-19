terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    
  }
}
provider "azurerm" {
  features {}
}

#Create App Service Plan
module "app-service-plan" {
  source        = "./modules/app service plan"
  plan_name     = "${var.plan_name}"
  rgname        = "${var.rgname}"
  app_plan_kind = "${var.app_plan_kind}"
  sku_size      = "${var.sku_size}"
  sku_tier      = "${var.sku_tier}"
  reserved      = "${var.reserved}"
  location      = "${var.location}"
}

#Create App Service
module "app-service" {
  source           = "./modules/app service"
  app_name         = "${var.app_name}"
  rgname           = "${var.rgname}"
  location         = "${var.location}"
  plan_id          = module.app-service-plan.app_service_plan_id
}
#Create PostgreSQl Server & Database
module "postgreSQL" {
  source                    = "./modules/postgresql"
  location                  = "${var.location}"
  rgname                    = "${var.rgname}"
  postgresql-sku-name       = "${var.postgresql-sku-name}"
  postgresql-storage        = "${var.postgresql-storage}"
  postgresql-version        = "${var.postgresql-version}" 
  postgresql-server-name    = "${var.postgresql-server-name}"
  postgresql-database-name  = "${var.postgresql-database-name}"
  postgresql-admin-login    = "${var.postgresql-admin-login}"
  postgresql-admin-password = "${var.postgresql-admin-password}"
  collation                 = "${var.collation}"
  charset                   = "${var.charset}"
 
}




