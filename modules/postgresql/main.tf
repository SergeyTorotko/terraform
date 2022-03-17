#Create PostgreSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "postgresql-server" {
  name                = var.postgresql-server-name
  location            = var.location
  resource_group_name = var.rgname


  administrator_login    = var.postgresql-admin-login
  administrator_password = var.postgresql-admin-password

  sku_name              = var.postgresql-sku-name
  version               = var.postgresql-version
  storage_mb            = var.postgresql-storage
  backup_retention_days = 7
}
#Create Firewall rule for server
resource "azurerm_postgresql_flexible_server_firewall_rule" "postgresql-fw-rule" {
  name             = "Allow_Azure_services"
  server_id        = azurerm_postgresql_flexible_server.postgresql-server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
#Create Database for server
resource "azurerm_postgresql_flexible_server_database" "postgresql-db" {
  name      = var.postgresql-database-name
  server_id = azurerm_postgresql_flexible_server.postgresql-server.id
  charset   = var.charset
  collation = var.collation
}


