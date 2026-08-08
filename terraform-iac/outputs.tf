output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.my_rg.name
}

output "resource_group_id" {
  description = "Resource ID of the Resource Group"
  value       = azurerm_resource_group.my_rg.id
}

output "resource_group_location" {
  description = "Location of the Resource Group"
  value       = azurerm_resource_group.my_rg.location
}

output "vnet_id" {
  description = "Resource ID of the Virtual Network"
  value       = module.vnet.vnet_id
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = module.vnet.vnet_name
}

output "vnet_address_space" {
  description = "Address space of the Virtual Network"
  value       = module.vnet.vnet_address_space
}

output "subnet_ids" {
  description = "Map of subnet keys to subnet IDs"
  value       = module.subnet.subnet_ids
}

output "subnet_names" {
  description = "Map of subnet keys to subnet names"
  value       = module.subnet.subnet_names
}
