# resource "random_string" "random_name" {
#   length           = 8
#   special          = true
#   upper            = false
#   override_special = false
# }

# Generate random text for a unique storage account name
# resource "random_id" "random_id" {
#   keepers = {
#     # Generate a new ID only when a new resource group is defined
#     resource_group = module.azurerm_resource_group.name
#   }

#   byte_length = 8
# }

resource "random_password" "password" {
  length      = 20
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}

# resource "random_pet" "prefix" {
#   prefix = var.prefix_vm
#   length = 1
# }