terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.98.0"
    }
  backend "azurerm" {
    resource_group_name  = "test-terraform"
    storage_account_name = "qwer134214nn"
    container_name       = "tfstate"
    key                  = "prod/unleash-app/terraform.tfstate"
  }   
  }
}

provider "azurerm" {
  features {}
}

#Create App Service Plan
module "app-service-plan" {
  source        = "../../modules/app service plan"
  plan_name     = "${var.plan_name}"
  rgname        = "${var.rgname}"
  app_plan_kind = "${var.app_plan_kind}"
  sku_size      = "${var.sku_size}"
  sku_tier      = "${var.sku_tier}"
  reserved      = "${var.reserved}"
  location      = "${var.location}"
}
