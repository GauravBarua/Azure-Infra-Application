variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}


variable "environment" {
  description = "resource environment"
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
  description = "Tags to apply to Azure resources"
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = "Subnet configuration"

  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}