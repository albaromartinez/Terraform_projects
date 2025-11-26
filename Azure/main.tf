module "azurerm_resource_group" {
  source   = "./modules/resource_group-az"
  name     = "${var.azurerm_resource_group_name}_${random_string.random_name.result}"
  location = var.azurerm_resource_group_location
  tags = merge(
    var.tags,{
    Resource: "ResourceGroup"
    }
  )
}

module "azurerm_storage_account" {
  source              = "./modules/storage"
  name                = "${var.azurerm_storage_account_name}${random_string.random_name.result}"
  resource_group_name = module.azurerm_resource_group.name
  location            = module.azurerm_resource_group.location
  tags = merge(
    var.tags,{
    Resource: "StorageAccount"
    }
  )
}
