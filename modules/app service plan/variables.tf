variable "plan_name" {
  description = "Name of App Service Plan"
}
variable "rgname" {
  description = "Name of resource group"
}
variable "location" {
  description = "Location of resources"
}
variable "app_plan_kind" {
  description = "App service plan kind"
  validation {
    condition     = contains(["linux", "windows"], var.app_plan_kind)
    error_message = "The app_plan_kind value must be Linux or Windows."
  }
}
variable "sku_tier" {
  description = "SKU tier of App Service Plan"
  validation {
    condition     = contains(["Free", "Shared", "Basic", "Standard", "Premium", "PremiumV2", "PremiumV3"], var.sku_tier)
    error_message = "The sku_tier value must be Free, Shared, Basic, Standard, Premium, PremiumV2, PremiumV3."
  }
}
variable "sku_size" {
  description = "SKU size of App Service Plan"
  validation {
    condition     = contains(["F1", "B1", "B2", "B3", "S1", "S2", "S3", "P1V2", "P2V2", "P3V2", "P1V3", "P2V3", "P1V3"], var.sku_size)
    error_message = "The sku_size value must be F1, B1, B2, B3, S1, S2, S3 P1V2, P2V2, P3V2, P1V3, P2V3, P1V3."
  }
}
variable "reserved" {
  description = "Flag indicating if App Service Plan should be reserved. Forced to true if \"kind\" is \"Linux\"."
}
