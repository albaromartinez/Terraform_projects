


# Create storage account for boot diagnostics
# resource "azurerm_storage_account" "my_storage_account" {
#   name                     = "diag${random_id.random_id.hex}"
#   location                 = var.resource_group_location
#   resource_group_name      = var.resource_group_name
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }


# Create virtual machine
resource "azurerm_windows_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  computer_name       = "ajmcvmwserver"
  admin_username        = var.admin_username
  admin_password        = var.random_password
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.network_interface_ids]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"

  }


  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  tags = merge(
    var.tags, {
      Resource : "WindowsVirtualMachine"
    }
  )
}

# Install IIS web server to the virtual machine
# resource "azurerm_virtual_machine_extension" "web_server_install" {
#   name                       = "${var.vm_random_name}-wsi"
#   virtual_machine_id         = azurerm_windows_virtual_machine.main.id
#   publisher                  = "Microsoft.Compute"
#   type                       = "CustomScriptExtension"
#   type_handler_version       = "1.8"
#   auto_upgrade_minor_version = true

#   settings = <<SETTINGS
#     {
#       "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
#     }
#   SETTINGS
# }

