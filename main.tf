# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "azurerm" {
  features {}
  # Optional: specify subscription_id if needed
  # subscription_id = var.subscription_id
}

data "azurerm_platform_image" "ubuntu" {
  location  = var.location
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-focal"
  sku       = "20_04-lts"
}

resource "azurerm_linux_virtual_machine" "ubuntu" {
  name                = var.instance_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.instance_type

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.ubuntu.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = data.azurerm_platform_image.ubuntu.publisher
    offer     = data.azurerm_platform_image.ubuntu.offer
    sku       = data.azurerm_platform_image.ubuntu.sku
    version   = data.azurerm_platform_image.ubuntu.version
  }

  tags = {
    Name = var.instance_name
  }
}

# Required: Network interface for the VM
resource "azurerm_network_interface" "ubuntu" {
  name                = "${var.instance_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
