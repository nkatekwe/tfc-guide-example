# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "vm_image_id" {
  value = azurerm_linux_virtual_machine.ubuntu.source_image_reference.version
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.ubuntu.id
}

# Additional useful Azure outputs:

output "vm_private_ip_address" {
  value = azurerm_linux_virtual_machine.ubuntu.private_ip_address
}

output "vm_public_ip_address" {
  value = azurerm_linux_virtual_machine.ubuntu.public_ip_address
}

output "vm_resource_id" {
  value = azurerm_linux_virtual_machine.ubuntu.virtual_machine_id
}
