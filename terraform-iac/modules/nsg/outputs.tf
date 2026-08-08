output "nsg_ids" {
  description = "Map of NSG keys to NSG IDs"
  value       = { for key, nsg in azurerm_network_security_group.example : key => nsg.id }
}