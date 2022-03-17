variable "postgresql-server-name" {
  description = "Name of PostgreSQL Server"
}
variable "postgresql-database-name" {
  description = "Name of PostgreSQl Databse"
}
variable "postgresql-admin-login" {
  description = "Login to authenticate to PostgreSQL Server"
}
variable "postgresql-admin-password" {
  description = "Password to authenticate to PostgreSQL Server"
}
variable "postgresql-version" {
  description = "PostgreSQL Server version to deploy"
}
variable "postgresql-sku-name" {
  description = "PostgreSQL SKU Name"
}
variable "postgresql-storage" {
  description = "PostgreSQL Storage in MB"
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