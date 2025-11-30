# Terraform Project — Azure Modular

## Description
Project to deploy infrastructure in Azure using Terraform. It includes provisioning of resource group, storage, virtual network, Linux and Windows virtual machines, and SSH key management, all organized in reusable modules.

## Repository structure
- **main.tf**: Orchestrates all modules.
- **variables.tf**: Global and input variables.
- **outputs.tf**: Global project outputs.
- **providers.tf**: Azure provider configuration.
- **terraform.tfvars.sample**: Example values for variables.
- **modules/**: Reusable modules:
  - `resource_group-az`: Resource group.
  - `storage`: Storage account.
  - `vnetwork`: Virtual network and NICs.
  - `vm_linux`: Linux virtual machine.
  - `windows_server`: Windows virtual machine.
  - `ssh_key_gen`: SSH key generation and management.

## Requirements
- **Terraform** >= 1.0
- **Azure Provider** (`hashicorp/azurerm`)
- Access to an Azure subscription
- Compatible shell (`zsh` recommended)

## Main variables
- `subscription_id`: Azure subscription ID
- `azurerm_resource_group_location`: Region for the resource group
- `admin_username`, `admin_username_linux`: Admin users for VMs
- `sta_name`: Unique name for the resource group

See `variables.tf` and `terraform.tfvars.sample` for more details, you can also modify `locals` to customize the prefix of your resources and more

## Quick start
```bash
cp terraform.tfvars.sample terraform.tfvars # Edit the values according to your environment
terraform init -backend=false
terraform validate
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Main modules and outputs
- **resource_group-az**: Creates and exports name, id, and location of the resource group.
- **storage**: Creates storage account and exports name, id, access key, and blob endpoint.
- **vnetwork**: Virtual network and NICs for VMs.
- **vm_linux**: Creates Linux VM and exports name, public IP, username, and password.
- **windows_server**: (commented by default) Creates Windows VM and exports name, username, and password.
- **ssh_key_gen**: Generates SSH keys and exports public key.

### Global outputs (`outputs.tf`)
- `resource_group_name`, `azurerm_storage_account_name`, `access_key`
- `vm_linux_public_ip`, `vm_linux_name`, `admin_username_linux`, `admin_password_linux`

## Best practices
- Use remote backend for state in production (e.g., Azure Storage).
- Do not upload `.tfstate` files or private keys to public repositories.
- Version providers and modules.
- Use `terraform fmt -recursive` to keep formatting consistent.

## Common troubleshooting
- **Unsupported attribute**: If you see this error when referencing `module.<name>.<attr>`, make sure the module exports that attribute as an `output`.
- **Insufficient permissions**: Make sure your user has permissions in the Azure subscription.
- **Dependency errors**: Use `depends_on` when a resource/module explicitly depends on another.

## Pre-production checklist
- Review the full plan before applying.
- Backup the state and configure locking.
- Test in a staging environment.

## Contact and license
- Author: albaromartinez (https://github.com/albaromartinez)
- License: MIT

