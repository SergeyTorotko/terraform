#variable "backend_rgname" {
#  description = "Name of resource group with storage account"
#}
#variable "backend_account_name" {
#  description = "Name of storage account"
#}
#variable "backend_container_name" {
#  description = "Name of container"
#}
#variable "backend_key" {
#  description = "Name or path for .tfstate file"
#}
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
variable "app_name" {
  description = "Name of App service"
}
variable "postgresql_server_name" {
  description = "Name of PostgreSQL Server"
}
variable "postgresql_database_name" {
  description = "Name of PostgreSQl Databse"
}
variable "postgresql_admin_login" {
  description = "Login to authenticate to PostgreSQL Server"
}
variable "postgresql_admin_password" {
  description = "Password to authenticate to PostgreSQL Server"
}
variable "postgresql_version" {
  description = "PostgreSQL Server version to deploy"
  validation {
    condition     = contains(["11", "12", "13"], var.postgresql_version)
    error_message = "The postgresql_version value must be 11, 12, 13."
  }
}
variable "postgresql_sku_name" {
  description = "PostgreSQL SKU Name"
  validation {
    condition     = contains(["B_Standard_B1ms", "B_Standard_B2s", "GP_Standard_D2ds_v3", "GP_Standard_D4ds_v3", "GP_Standard_D2ds_v4", "GP_Standard_D4ds_v4", "MO_Standard_E2s_v3", "MO_Standard_E4s_v3", "MO_Standard_E2s_v4", "MO_Standard_E4s_v4"], var.postgresql_sku_name)
    error_message = "The postgresql_sku_name value must be B_Standard_B1ms, B_Standard_B2s, GP_Standard_D2ds_v3, GP_Standard_D4ds_v3, GP_Standard_D2ds_v4, GP_Standard_D4ds_v4, MO_Standard_E2s_v3, MO_Standard_E4s_v3, MO_Standard_E2s_v4, MO_Standard_E4s_v4."
  }
}
variable "postgresql_storage" {
  description = "PostgreSQL Storage in MB"
  validation {
    condition     = contains(["32768", "65536", "131072", "262144", "524288", "1048576", "2097152", "4194304", "8388608", "16777216", "33554432"], var.postgresql_storage)
    error_message = "The postgresql_storage value must be 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216, 33554432."
  }
}
variable "charset" {
  description = "Charset of database"
}
variable "collation" {
  description = "Collation of database"
}
