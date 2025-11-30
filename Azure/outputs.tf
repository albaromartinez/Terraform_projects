output "resource_group_name" {
  description = "Azure Resource Group name"
  value       = module.azurerm_resource_group.name
}

output "azurerm_storage_account_name" {
  description = "Azure Storage account name"
  value       = module.azurerm_storage_account.name
}

output "access_key" {
  description = "prymary access key for the storage account"
  sensitive   = true
  value       = module.azurerm_storage_account.access_key
}


# output "vm_name" {
#   description = "windows server 2016 vm name"
#   value = module.azurerm_windows_virtual_machine.vm_name
# }

# output "vm_username" {
#   description = "admin user to vm"
#   value = module.azurerm_windows_virtual_machine.admin_username
# }

# output "vm_password" {
#   description = "admin password to vm"
#   sensitive   = true
#   value = module.azurerm_windows_virtual_machine.admin_password

# }

output "vm_linux_public_ip" {
  value = module.azurerm_linux_virtual_machine.vm_linux_public_ip
}
output "vm_linux_name" {
  value = module.azurerm_linux_virtual_machine.vm_linux_name
}

# output "vm_linux_os_disk_id" {
#   value = module.azurerm_linux_virtual_machine.vm_linux_os_disk_id
# }

output "admin_username_linux" {
  value = module.azurerm_linux_virtual_machine.admin_username_linux
}
output "admin_password_linux" {
  value     = module.azurerm_linux_virtual_machine.admin_password_linux
  sensitive = true
}

# output "public_key_data" {
#   value = module.ssh_key_gen.public_key_data
# }

# output "private_key_data" {
#   value     = module.ssh_key_gen.private_key_data
#   sensitive = true
# }