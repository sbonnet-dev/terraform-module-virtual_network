resource "azurerm_virtual_network" "virtual_network" {
  name = lower(format("%s%s%s", var.rg_type, var.environment, var.name))

  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
    //security_group = azurerm_network_security_group.example.id

  } //1-N


  tags = {
    project     = var.project
    environment = var.environment
    owner       = var.owner
  }
}