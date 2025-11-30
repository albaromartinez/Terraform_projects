output "vm_linux_public_ip" {
  value = azurerm_linux_virtual_machine.myLinuxVM.public_ip_address
}
output "vm_linux_name" {
  value = azurerm_linux_virtual_machine.myLinuxVM.name
}   

# output "vm_linux_os_disk_id" {
#   value = azurerm_linux_virtual_machine.myLinuxVM.os_disk_id
# }

output "admin_username_linux" {
  value = azurerm_linux_virtual_machine.myLinuxVM.admin_username
}
output "admin_password_linux" {
  value = azurerm_linux_virtual_machine.myLinuxVM.admin_password
}

