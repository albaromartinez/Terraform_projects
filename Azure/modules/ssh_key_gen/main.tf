
resource "random_pet" "ssh_key_name" {
  prefix    = "ssh"
  separator = ""
}

resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = random_pet.ssh_key_name.id
  location  = var.resource_group_location
  parent_id = var.resource_group_id
}
resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key.id
  action      = "generateKeyPair"
  method      = "POST"

  response_export_values = ["publicKey", "privateKey"]
}



resource "local_file" "private_key_file" {
  content  = azapi_resource_action.ssh_public_key_gen.output.privateKey
  filename = "key_private.pem"
  file_permission   = "0600"
}

resource "local_file" "public_key_file" {
  content  = azapi_resource_action.ssh_public_key_gen.output.publicKey
  filename = "key_public.pub"
}