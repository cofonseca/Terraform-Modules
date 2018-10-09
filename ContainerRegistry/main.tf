resource "azurerm_resource_group" "containerregistry" {
  name     = "${var.resource_group_name}"
  location = "${var.region}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_container_registry" "containerregistry" {
  name                = "${var.container_registry_name}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.region}"
  admin_enabled       = true
  sku                 = "${var.container_registry_sku}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}
