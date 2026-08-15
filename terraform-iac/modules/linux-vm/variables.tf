variable "vm_name" {
  description = "Name of the Linux virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the Linux virtual machine"
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
  description = "Linux administrator username"
  type        = string
}

variable "admin_ssh_public_key" {
  description = "SSH public key used for initial Linux VM provisioning"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the VM and NIC"
  type        = map(string)
  default     = {}
}