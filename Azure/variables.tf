

# Variables for Providers
variable "subscription_id" {
  description = "subscription id"
  type        = string
}

# Variables for Resource Group
# variable "azurerm_resource_group_name" {
#   description = "Name of the resource group"
#   type        = string

# }
variable "azurerm_resource_group_location" {
  description = "Location where the resource group will be deployed"
  type        = string
}


#variables for storage account
# variable "azurerm_storage_account_name" {
#   description = "Name of the storage account"
#   type        = string
# }


# variable "tags" {
variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}