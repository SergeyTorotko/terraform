provider "azurerm" {
  features {}

}
resource "azurerm_storage_account" "tfstate" {
  //name                     = "tfstate${random_string.resource_code.result}"
  name = "tfstatestore2134"
  resource_group_name      = "node-app"
  location                 = "centralus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }

}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}

