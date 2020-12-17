provider "azurerm" {
  client_id = "01bc024b-aa5b-4719-840c-29b7a3dff875"
  tenant_id = "777c1949-a60f-47dc-a0d1-457fa0e2b4a6"
  client_secret = "IOB_Bj.T5AheL18zg._ErdEfr8296f.ckC"
  subscription_id = "cb10d8f8-978c-4bfc-8c34-d26443752202"
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