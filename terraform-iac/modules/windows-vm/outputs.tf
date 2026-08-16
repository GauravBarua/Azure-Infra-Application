output "vm_id" {
  description = "Windows VM resource ID"
  value       = azurerm_windows_virtual_machine.this.id
}

output "vm_name" {
  description = "Linux VM name"
  value       = azurerm_windows_virtual_machine.this.name
}

output "private_ip_address" {
  description = "Linux VM private IP address"
  value       = azurerm_network_interface.win_nic.private_ip_address
}
