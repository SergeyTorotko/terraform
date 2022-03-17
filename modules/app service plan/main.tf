resource "azurerm_app_service_plan" "plan" {
  name                = var.plan_name
  resource_group_name = var.rgname
  location            = var.location
  kind                = var.app_plan_kind
  reserved            = var.reserved
  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}
