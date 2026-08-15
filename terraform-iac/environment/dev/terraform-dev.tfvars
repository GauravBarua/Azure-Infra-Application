# ========================================
#            Generic Vars
# ========================================
resource_group_name = "az-tf-practice-dev-rg1"
location            = "Central India"
environment         = "dev"
tags = {
  environment = "dev"
  project     = "azure-infra"
  managed_by  = "terraform"
  owner       = "Gaurav.barua.dev@gmail.com"
  cost-centre = "Personal BU 4653H"
}

# ========================================
#            Vnet Vars
# ========================================
address_space = ["10.0.0.0/17"]
dns_servers   = [] # use default dns

# ========================================
#            Subnets Vars
# ========================================
subnets = {
  app = {
    name = "az-tf-practice-app-subnet-dev-01"

    address_prefixes = [
      "10.0.0.0/24"
    ]
  }

  data = {
    name = "az-tf-practice-data-subnet-dev-02"

    address_prefixes = [
      "10.0.1.0/24"
    ]
  }
}

# ========================================
#            NSGs Vars
# ========================================
nsgs = {
  app = {
    name = "az-tf-practice-app-nsg-dev-01"

    security_rules = {

      allow_https = {
        name                       = "AllowHTTPS"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      allow_http = {
        name                       = "AllowHTTP"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

    }
  }

  data = {
    name = "az-tf-practice-data-nsg-dev-02"

    security_rules = {

      allow_postgres = {
        name                       = "AllowPostgreSQL"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5432"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "*"
      }

    }
  }
}
# ========================================
#            Route table/UDRs Vars
# ========================================
route_tables = {
  app = {
    name                          = "az-tf-practice-app-rt-dev-01"
    bgp_route_propagation_enabled = true

    routes = {}
  }

  data = {
    name                          = "az-tf-practice-data-rt-dev-02"
    bgp_route_propagation_enabled = true

    routes = {}
  }
}
# ========================================
#            Virtual Machine - Linux
# ========================================
linux_vm_name = "az-tf-practice-linux-vm-dev-01"

linux_vm_size = "Standard_D4as_v5"

linux_admin_username = "azureadmin"

linux_admin_ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHBbFx0X5YAMVmoWUZikXlitG4dwfLhoJZYNSo6NbBt3 azure-tf-linux-vm"

linux_vm_login_principal_id = "0a712102-a783-4fb1-8daf-8125014fdf81"