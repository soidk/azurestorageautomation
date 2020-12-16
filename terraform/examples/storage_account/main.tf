provider "azurerm" {
  features {}
}



module "storage_account" {
  source                   = "../../modules/storageaccount"
  account_replication_type = var.account_replication_type
  location                 = var.location
  resource_group_name      = var.resource_group_name
  storage_account_name     = var.storage_account_name
  storage_account_tier     = var.storage_account_tier
}