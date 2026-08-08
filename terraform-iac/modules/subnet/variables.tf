variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations"

  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}