output "subnet_names" {
  description = "Map of subnet keys to subnet names"

  value = {
    for key, subnet in azurerm_subnet.this :
    key => subnet.name
  }
}

output "subnet_ids" {
  description = "Map of subnet keys to subnet IDs"

  value = {
    for key, subnet in azurerm_subnet.this :
    key => subnet.id
  }
}