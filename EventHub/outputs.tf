output "eventHubPrimaryConnectionString" {
  value = "${azurerm_eventhub_namespace.eventhub.default_primary_connection_string}"
}

output "eventHubSecondaryConnectionString" {
  value = "${azurerm_eventhub_namespace.eventhub.default_secondary_connection_string}"
}

output "eventHubName" {
  value = "${azurerm_eventhub.eventhub.name}"
}
