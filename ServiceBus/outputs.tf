output "serviceBusConnectionString" {
  value = "${azurerm_servicebus_namespace.servicebus.default_primary_connection_string}"
}

output "serviceBusPrimaryKey" {
    value = "${azurerm_servicebus_namespace.servicebus.default_primary_key}"
}