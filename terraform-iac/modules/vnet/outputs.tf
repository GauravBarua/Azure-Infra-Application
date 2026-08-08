output "vnet_id" {
  description = "Resource ID of the Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.this.name
}

output "vnet_address_space" {
  description = "Address space of the Virtual Network"
  value       = azurerm_virtual_network.this.address_space
}

output "vnet_location" {
  description = "Location of the Virtual Network"
  value       = azurerm_virtual_network.this.location
}