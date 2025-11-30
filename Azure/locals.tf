locals {
  #   prefix = random_pet.prefix.id
  prefix = "${local.tags.Project}-${local.env}"
  env    = terraform.workspace

  tags = {
    Project = "azuretf"
    Owner   = "ajmc"
    Env     = local.env
  }
  vm_size = local.env == "dev" ? "Standard_LRS" : "StandardSSD_LRS"
  #   rdp_port = var.enable_custom_port ? 6516 : 3389
}
