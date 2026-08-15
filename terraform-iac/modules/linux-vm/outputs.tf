output "vm_id" {
  description = "Linux VM resource ID"
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  description = "Linux VM name"
  value       = azurerm_linux_virtual_machine.this.name
}

output "private_ip_address" {
  description = "Linux VM private IP address"
  value       = azurerm_network_interface.linux.private_ip_address
}

output "principal_id" {
  description = "Principal ID of the Linux VM system-assigned managed identity"
  value       = azurerm_linux_virtual_machine.this.identity[0].principal_id
}