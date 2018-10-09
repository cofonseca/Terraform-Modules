output "cluster_id" {
  value = "${azurerm_kubernetes_cluster.k8s.id}"
}

output "cluster_fqdn" {
  value = "${azurerm_kubernetes_cluster.k8s.fqdn}"
}

output "ssh_private_key" {
  value = "${azurerm_kubernetes_cluster.k8s.kube_config.0.client_key}"
}

output "ssh_host" {
  value = "${azurerm_kubernetes_cluster.k8s.kube_config.0.host}"
}

output "ssh_username" {
  value = "${azurerm_kubernetes_cluster.k8s.kube_config.0.username}"
}

output "ssh_password" {
  value = "${azurerm_kubernetes_cluster.k8s.kube_config.0.password}"
}
