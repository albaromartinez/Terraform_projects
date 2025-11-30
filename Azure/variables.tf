#######################Globals variables #######################
# variable "tags" {
#   description = "Tags to be applied to resources"
#   type        = map(string)
# }



#######################variables for Providers #######################
variable "subscription_id" {
  description = "subscription id"
  type        = string
}

#######################Variables for Resource Group #######################

variable "azurerm_resource_group_location" {
  description = "Location where the resource group will be deployed"
  type        = string
}


#######################variables for storage account #######################
variable "sta_name" {
  description = "storage account name"
  type = string
}


#######################variables for virtual network #######################



#######################variables for virtual machine#######################
# variable "prefix_vm" {
#   type        = string
#   description = "Prefix of the resource name"
# }
variable "admin_username_win" {
  type        = string
  description = "user to admin the vm"
}

#######################variables for linux vm#########################
variable "admin_username_linux" {
  type        = string
  description = "user to admin the linux vm"
}

variable "public_key" {
  description = "SSH public key for Linux VM"
  type        = string
}