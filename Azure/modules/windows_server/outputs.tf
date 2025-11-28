output "vm_name" {
  description = "The name of the Windows Virtual Machine"
  value       = azurerm_windows_virtual_machine.main.name
}
output "admin_username" {
  description = "The admin username of the Windows Virtual Machine"
  value       = azurerm_windows_virtual_machine.main.admin_username

}
output "admin_password" {
  description = "The admin password of the Windows Virtual Machine"
  value       = azurerm_windows_virtual_machine.main.admin_password
}
