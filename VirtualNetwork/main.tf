resource "azurerm_resource_group" "vnet" {
  name     = "${var.resource_group_name}"
  location = "${var.region}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.virtual_network_name}"
  resource_group_name = "${azurerm_resource_group.vnet.name}"
  address_space       = "${var.virtual_network_address_space}"
  location            = "${var.region}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_subnet" "gateway" {
  name                 = "${var.subnet_1_name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.vnet.name}"
  address_prefix       = "${var.subnet_1_prefix}"
}

resource "azurerm_subnet" "k8s" {
  name                 = "${var.subnet_2_name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.vnet.name}"
  address_prefix       = "${var.subnet_2_prefix}"
}

resource "azurerm_public_ip" "vnet" {
  name                         = "${var.public_ip_name}"
  resource_group_name          = "${azurerm_resource_group.vnet.name}"
  location                     = "${var.region}"
  public_ip_address_allocation = "${var.public_ip_type}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_virtual_network_gateway" "vnet" {
  name                = "${var.vpn_name}"
  location            = "${var.region}"
  resource_group_name = "${azurerm_resource_group.vnet.name}"
  type                = "Vpn"
  sku                 = "${var.vpn_sku}"

  ip_configuration {
    name                 = "${var.ip_configuration_name}"
    public_ip_address_id = "${azurerm_public_ip.vnet.id}"
    subnet_id            = "${azurerm_subnet.gateway.id}"
  }

  vpn_client_configuration {
    address_space = "${var.vpn_address_space}"
  }

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_local_network_gateway" "vnet" {
  name                = "${var.local_network_name}"
  location            = "${var.region}"
  resource_group_name = "${var.resource_group_name}"
  gateway_address     = "${var.blueport_gateway_address}"
  address_space       = "${var.blueport_address_space}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_virtual_network_gateway_connection" "vnet" {
  name                       = "${var.vpn_name}"
  location                   = "${var.region}"
  resource_group_name        = "${var.resource_group_name}"
  type                       = "IPSec"
  virtual_network_gateway_id = "${azurerm_virtual_network_gateway.vnet.id}"
  local_network_gateway_id   = "${azurerm_local_network_gateway.vnet.id}"
  shared_key                 = "${var.vpn_psk}"

  ipsec_policy {
    dh_group         = "DHGroup14"
    ike_encryption   = "AES256"
    ike_integrity    = "SHA256"
    ipsec_encryption = "AES256"
    ipsec_integrity  = "SHA256"
    pfs_group        = "None"
    sa_lifetime      = "86400"
  }

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}
