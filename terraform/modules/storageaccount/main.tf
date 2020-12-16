resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name//"example-resources"
  location = var.location//"West Europe"
}


resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name//"storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.storage_account_tier//"Standard"
  account_replication_type = var.account_replication_type //"GRS"

  tags = {
    environment = "test"
  }
}