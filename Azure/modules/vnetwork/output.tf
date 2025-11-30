# output "win_network_interface_ids" {
#   description = "NIC IDs for Windows VM"
#   value = azurerm_network_interface.windows_nic.id
# }
output "linux_network_interface_ids" {
  description = "NIC IDs for Linux VM"
  value = azurerm_network_interface.linux_nic.id
  
}