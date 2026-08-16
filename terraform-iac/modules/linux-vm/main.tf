resource "azurerm_public_ip" "this" {
  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}
resource "azurerm_network_interface" "linux" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "this" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  admin_username      = var.admin_username

  disable_password_authentication = true

  admin_ssh_key {
  username   = var.admin_username
  public_key = var.admin_ssh_public_key
}

  network_interface_ids = [
    azurerm_network_interface.linux.id,
  ]

  identity {
    type = "SystemAssigned"
  }


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  connection {
    type        = "ssh"
    host        = azurerm_public_ip.this.ip_address
    user        = var.admin_username
    private_key = file(var.admin_ssh_private_key_path)
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Starting DevOps tool installation...'",

      "sudo apt-get update -y",

      "sudo apt-get install -y jq curl ca-certificates apt-transport-https gnupg",

      "curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash",

      "az aks install-cli",

      "curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash",

      "echo 'Verifying installations...'",

      "az version",

      "kubectl version --client",

      "helm version",

      "jq --version"
    ]
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "aad_login" {
  name                 = "AADSSHLoginForLinux"
  virtual_machine_id   = azurerm_linux_virtual_machine.this.id
  publisher            = "Microsoft.Azure.ActiveDirectory"
  type                 = "AADSSHLoginForLinux"
  type_handler_version = "1.0"

  auto_upgrade_minor_version = true
}
