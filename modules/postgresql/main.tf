#Create PostgreSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "postgresql_server" {
  name                = var.postgresql_server_name
  location            = var.location
  resource_group_name = var.rgname

  administrator_login    = var.postgresql_admin_login
  administrator_password = var.postgresql_admin_password

  sku_name   = var.postgresql_sku_name
  version    = var.postgresql_version
  storage_mb = var.postgresql_storage
  zone = "2"

  lifecycle {
    prevent_destroy = true
  }
}

#Create Database for server
resource "azurerm_postgresql_flexible_server_database" "postgresql_db" {
  name      = var.postgresql_database_name
  server_id = azurerm_postgresql_flexible_server.postgresql_server.id
  charset   = var.charset
  collation = var.collation

  lifecycle {
    prevent_destroy = true
  }
}
