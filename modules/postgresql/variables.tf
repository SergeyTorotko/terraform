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
variable "rgname" {
  description = "Name of resource group"
}
variable "location" {
  description = "Location of resources"
}
variable "charset" {
  description = "Charset of database"
}
variable "collation" {
  description = "Collation of database"
}
