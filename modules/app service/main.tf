resource "azurerm_app_service" "app" {
  name                = var.app_name
  resource_group_name = var.rgname
  location            = var.location
  app_service_plan_id = var.plan_id
}
