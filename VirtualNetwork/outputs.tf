// Public IP Outputs //
output "public_ip" {
  value = "${azurerm_public_ip.vnet.ip_address}"
}

// Gateway Connection Outputs //
output "psk" {
  value = "${azurerm_virtual_network_gateway_connection.vnet.shared_key}"
}
