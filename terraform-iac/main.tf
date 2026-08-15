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

module "nsg" {
  source = "./modules/nsg"

  nsgs = var.nsgs

  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = var.nsgs

  subnet_id                 = module.subnet.subnet_ids[each.key]
  network_security_group_id = module.nsg.nsg_ids[each.key]
}

module "route_table" {
  source = "./modules/route-table"

  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
  route_tables        = var.route_tables
  tags                = var.tags
}

resource "azurerm_subnet_route_table_association" "this" {
  for_each       = var.route_tables
  subnet_id      = module.subnet.subnet_ids[each.key]
  route_table_id = module.route_table.route_table_ids[each.key]
}

module "linux_vm" {
  source = "./modules/linux-vm"

  vm_name             = var.linux_vm_name
  vm_size             = var.linux_vm_size
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name

  subnet_id = module.subnet.subnet_ids["app"]

  admin_username = var.linux_admin_username
  admin_ssh_public_key = var.linux_admin_ssh_public_key

  tags = var.tags
}

resource "azurerm_role_assignment" "linux_vm_admin_login" {
  scope                = module.linux_vm.vm_id
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = var.linux_vm_login_principal_id
}