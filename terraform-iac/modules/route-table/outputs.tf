output "route_table_ids" {
  description = "Map of route table keys to route table IDs"
  value = {
    for key, route_table in azurerm_route_table.this : key => route_table.id
  }
}

output "route_table_names" {
  description = "Map of route table keys to route table names"
  value = {
    for key, route_table in azurerm_route_table.this : key => route_table.name
  }
}