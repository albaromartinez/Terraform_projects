
resource "azurerm_storage_account" "azurerm_storage_account" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = merge(
    var.tags, {
      Resource : "StorageAccount"
    }
  )
  lifecycle {
    ignore_changes = [
      name
    ]
  }
}
resource "azurerm_storage_container" "container_name" {
  name                  = "states"
  storage_account_id    = azurerm_storage_account.azurerm_storage_account.id
  container_access_type = "private"
}