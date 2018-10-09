resource "azurerm_resource_group" "servicebus" {
  name     = "${var.resource_group_name}"
  location = "${var.region}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_servicebus_namespace" "servicebus" {
  name                = "${var.servicebus_namespace_name}"
  location            = "${var.region}"
  resource_group_name = "${azurerm_resource_group.servicebus.name}"
  sku                 = "${var.servicebus_sku}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_servicebus_queue" "servicebus" {
  name                = "${var.servicebus_queue_name[count.index]}-${var.environment}"
  resource_group_name = "${azurerm_resource_group.servicebus.name}"
  namespace_name      = "${azurerm_servicebus_namespace.servicebus.name}"
  default_message_ttl = "P14D"
  lock_duration       = "PT5M"
  enable_partitioning = true
  count               = "${length(var.servicebus_queue_name)}"
}
