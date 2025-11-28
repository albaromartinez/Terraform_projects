# Create virtual network
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = "${var.random_name}-vnet"
  address_space       = ["10.0.0.0/24"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

# Create subnet
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = "${var.random_name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.my_terraform_network.name
  address_prefixes     = ["10.0.0.0/27"]
}

# Create public IPs
resource "azurerm_public_ip" "my_terraform_public_ip" {
  name                = "${var.random_name}-public-ip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku = "Standard"
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "my_terraform_nsg" {
  name                = "${var.random_name}-nsg"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "web"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = "${var.random_name}-nic"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "my_nic_configuration"
    subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.my_terraform_public_ip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.my_terraform_nic.id
  network_security_group_id = azurerm_network_security_group.my_terraform_nsg.id
}
