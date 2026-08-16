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

variable "nsgs" {
  description = "Network Security Groups configuration"

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

variable "route_tables" {
  description = "Route tables to create for each environment"

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

variable "linux_vm_name" {
  description = "Linux VM name"
  type        = string
}

variable "linux_vm_size" {
  description = "Linux VM size"
  type        = string
}

variable "linux_admin_username" {
  description = "Linux VM administrator username"
  type        = string
}

variable "linux_admin_ssh_public_key" {
  description = "SSH public key for Linux VM provisioning"
  type        = string
}
variable "linux_vm_login_principal_id" {
  description = "Object ID of the Microsoft Entra user or group that should be allowed to log in to the Linux VM"
  type        = string
}

variable "admin_ssh_private_key_path" {
  description = "Path to the SSH private key used for VM provisioning"
  type        = string
}

variable "windows_vm_name" {
  description = "Windows VM name"
  type        = string
}

variable "windows_vm_size" {
  description = "Windows VM size"
  type        = string
}

variable "windows_admin_username" {
  description = "Windows VM administrator username"
  type        = string
}

variable "windows_admin_password" {
  description = "Windows VM administrator password"
  type        = string
}
