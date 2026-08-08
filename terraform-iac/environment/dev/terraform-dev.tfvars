resource_group_name = "az-tf-practice-dev-rg1"
location            = "Central India"
environment         = "dev"

# ========================================
#            Vnet Vars
# ========================================
address_space = ["10.0.0.0/17"]
dns_servers   = ["10.0.0.4", "10.0.0.5"]
tags = {
  environment = "dev"
  project     = "azure-infra"
  managed_by  = "terraform"
  owner       = "Gaurav.Barua@lseg.com"
  cost-centre = "Personal BU 4653H"
}

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