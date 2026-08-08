resource "azurerm_resource_group" "my_rg" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  environment         = var.environment
  resource_group_name = azurerm_resource_group.my_rg.name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}

module "subnet" {
  source = "./modules/subnet"

  resource_group_name  = azurerm_resource_group.my_rg.name
  virtual_network_name = module.vnet.vnet_name

  subnets = var.subnets
}