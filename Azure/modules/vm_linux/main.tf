

resource "azurerm_linux_virtual_machine" "myLinuxVM" {
  name                  = "linuxvm-${var.prefix}"
  computer_name         = "linuxvm-${var.prefix}"
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  size                  = "Standard_F2"
  admin_username        = var.admin_username
  network_interface_ids = [var.network_interface_ids]
  admin_password        = var.password

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  tags = merge(
    var.tags,
    {
      Resource : "LinuxVirtualMachine"
    }
  )
}


