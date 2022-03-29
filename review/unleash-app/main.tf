terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.98.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Shared"
    storage_account_name = "tfstatestore2134"
    container_name       = "terraform"
    key                  = "prod/unleash-app/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

#Create App Service Plan
module "app_service_plan" {
  source        = "../../modules/app service plan"
  plan_name     = var.plan_name
  rgname        = var.rgname
  app_plan_kind = var.app_plan_kind
  sku_size      = var.sku_size
  sku_tier      = var.sku_tier
  reserved      = var.reserved
  location      = var.location
}

#Create App Service
module "app_service" {
  source   = "../../modules/app service"
  app_name = var.app_name
  rgname   = var.rgname
  location = var.location
  plan_id  = module.app_service_plan.app_service_plan_id
}

#Create PostgreSQl Server & Database
module "postgreSQL" {
  source                    = "../../modules/postgresql"
  location                  = var.location
  rgname                    = var.rgname
  postgresql_sku_name       = var.postgresql_sku_name
  postgresql_storage        = var.postgresql_storage
  postgresql_version        = var.postgresql_version
  postgresql_server_name    = var.postgresql_server_name
  postgresql_database_name  = var.postgresql_database_name
  postgresql_admin_login    = var.postgresql_admin_login
  postgresql_admin_password = var.postgresql_admin_password
  collation                 = var.collation
  charset                   = var.charset
}
