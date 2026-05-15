# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "location" {
  description = "Azure region"
  default     = "westus"
}

variable "instance_type" {
  description = "Type of Azure VM to provision"
  default     = "Standard_B1s"
}

variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
  default     = "my-ubuntu-vm"

  validation {
    condition     = can(regex("^[a-zA-Z0-9._-]+$", var.instance_name))
    error_message = "VM name must contain only alphanumeric characters, dots, dashes, and underscores."
  }
}


variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "terraform-example-rg"
}

variable "subnet_id" {
  description = "ID of the subnet where the VM will be deployed"
  default     = null
}
