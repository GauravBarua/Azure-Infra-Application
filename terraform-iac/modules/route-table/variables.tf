variable "location" {
  description = "Azure region where the VNet will be created"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the VNet will be created"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the Virtual Network"
  type        = map(string)
  default     = {}
}

variable "route_tables" {
  description = "Map of route tables and their routes(UDR's)"

  type = map(object({
    name                          = string
    bgp_route_propagation_enabled = bool

    routes = map(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = optional(string)
    }))
  }))
}