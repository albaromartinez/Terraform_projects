module "azurerm_resource_group" {
  source   = "./modules/resource_group-az"
  name     = "rg-${local.prefix}"
  location = var.azurerm_resource_group_location
  tags     = local.tags

}
module "azurerm_storage_account" {
  source              = "./modules/storage"
  name                = var.sta_name
  resource_group_name = module.azurerm_resource_group.name
  location            = module.azurerm_resource_group.location
  tags                = local.tags
  depends_on          = [module.azurerm_resource_group]

}

module "azurerm_virtual_network" {
  source                  = "./modules/vnetwork"
  resource_group_name     = module.azurerm_resource_group.name
  resource_group_location = module.azurerm_resource_group.location
  prefix_name             = local.prefix
  depends_on              = [module.azurerm_resource_group, module.azurerm_storage_account]
}
# Virtual Machine Module

# module "azurerm_windows_virtual_machine" {
#   source                  = "./modules/windows_server"
#   resource_group_name     = module.azurerm_resource_group.name
#   resource_group_location = module.azurerm_resource_group.location
#   network_interface_ids   = module.azurerm_virtual_network.win_network_interface_ids
#   storage_account_uri     = module.azurerm_storage_account.primary_blob_endpoint
#   azurerm_storage_account = module.azurerm_storage_account.name
#   admin_username          = var.admin_username_win
#   random_password         = random_password.password.result
#   prefix                  = local.prefix
#   tags                    = var.tags
#   depends_on              = [module.azurerm_resource_group, module.azurerm_storage_account, module.azurerm_virtual_network]
# }

module "ssh_key_gen" {
  source                  = "./modules/ssh_key_gen"
  resource_group_name     = module.azurerm_resource_group.name
  resource_group_location = module.azurerm_resource_group.location
  resource_group_id       = module.azurerm_resource_group.resource_group_id
  depends_on              = [module.azurerm_resource_group]
}

# Vm linux
module "azurerm_linux_virtual_machine" {
  source                  = "./modules/vm_linux"
  resource_group_name     = module.azurerm_resource_group.name
  resource_group_location = module.azurerm_resource_group.location
  resource_group_id       = module.azurerm_resource_group.resource_group_id
  network_interface_ids   = module.azurerm_virtual_network.linux_network_interface_ids
  admin_username          = var.admin_username_linux
  password                = random_password.password.result
  prefix                  = local.prefix
  storage_account_type    = local.vm_size
  public_key              = module.ssh_key_gen.public_key_data
  storage_account_uri     = module.azurerm_storage_account.primary_blob_endpoint
  tags                    = local.tags
  depends_on              = [module.azurerm_resource_group, module.azurerm_storage_account, module.azurerm_virtual_network]
}
