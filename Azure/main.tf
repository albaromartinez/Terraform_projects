module "azurerm_resource_group" {
  source   = "./modules/resource_group-az"
  name     = azurecaf_name.rg.result
  location = var.azurerm_resource_group_location
  tags = var.tags

}
module "azurerm_storage_account" {
  source              = "./modules/storage"
  name                = azurecaf_name.storage.result
  resource_group_name = module.azurerm_resource_group.name
  location            = module.azurerm_resource_group.location
  tags = var.tags
  depends_on = [ module.azurerm_resource_group ]

}

module "azurerm_virtual_network" {
  source                  = "./modules/vnetwork"
  resource_group_name     = module.azurerm_resource_group.name
  resource_group_location = module.azurerm_resource_group.location
  random_name             = random_pet.prefix.id
  depends_on = [ module.azurerm_resource_group, module.azurerm_storage_account ]
}
# Virtual Machine Module

module "azurerm_windows_virtual_machine" {
  source                  = "./modules/windows_server"
  resource_group_name     = module.azurerm_resource_group.name
  resource_group_location = module.azurerm_resource_group.location
  network_interface_ids   = module.azurerm_virtual_network.network_interface_ids
  storage_account_uri     = module.azurerm_storage_account.primary_blob_endpoint
  azurerm_storage_account = module.azurerm_storage_account.name
  admin_username  = var.admin_username
  random_password = random_password.password.result
  vm_random_name  = random_pet.prefix.id
  prefix          = random_pet.prefix.id
  tags = var.tags
  depends_on = [  module.azurerm_resource_group, module.azurerm_storage_account,module.azurerm_virtual_network ]
}
