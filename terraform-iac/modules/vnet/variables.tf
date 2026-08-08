variable "environment" {
  description = "Environment name such as dev, qa, ppe or prod"
  type        = string
}

variable "location" {
  description = "Azure region where the VNet will be created"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the VNet will be created"
  type        = string
}

variable "address_space" {
  description = "Address space of the Virtual Network"
  type        = list(string)
}

variable "dns_servers" {
  description = "List of custom DNS server IP addresses"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to assign to the Virtual Network"
  type        = map(string)
  default     = {}
}