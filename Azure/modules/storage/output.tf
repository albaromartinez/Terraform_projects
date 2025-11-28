output "name" {
  description = "Azure storage account name"
  value       = azurerm_storage_account.azurerm_storage_account.name
}


output "access_key" {
  description = "prymary access key for the storage account"
  sensitive = true
  value       = azurerm_storage_account.azurerm_storage_account.primary_connection_string
}

output "id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.azurerm_storage_account.id
}

output "primary_blob_endpoint" {
  description = "The primary Blob service endpoint"
  value       = azurerm_storage_account.azurerm_storage_account.primary_blob_endpoint
}