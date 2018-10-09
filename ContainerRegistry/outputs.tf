output "containerRegistryId" {
  value = "${azurerm_container_registry.containerregistry.id}"
}

output "containerRegistryLoginServer" {
  value = "${azurerm_container_registry.containerregistry.login_server}"
}

output "containerRegistryUsername" {
  value = "${azurerm_container_registry.containerregistry.admin_username}"
}

output "containerRegistryPassword" {
  value = "${azurerm_container_registry.containerregistry.admin_password}"
}
