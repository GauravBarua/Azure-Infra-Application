variable "vm_name" {
  description = "Name of the Windows virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Windows virtual machine"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the VM"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the VM NIC will be created"
  type        = string
}

variable "admin_username" {
  description = "Windows administrator username"
  type        = string
}

variable "admin_password" {
  description = "Windows administrator password"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to the VM and NIC"
  type        = map(string)
  default     = {}
}
