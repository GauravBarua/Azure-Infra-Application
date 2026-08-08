
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

variable "nsgs" {
  description = "Map of Network Security Groups and their security rules"

  type = map(object({
    name = string

    security_rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}