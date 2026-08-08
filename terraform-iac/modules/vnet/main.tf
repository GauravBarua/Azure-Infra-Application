resource "azurerm_virtual_network" "this" {
  name                = "az-tf-practice-vnet-${var.environment}-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  encryption {
    enforcement = "AllowUnencrypted"
  }
  tags = var.tags
}