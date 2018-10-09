resource "azurerm_resource_group" "k8s" {
  name     = "${var.resource_group_name}"
  location = "${var.region}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "bpc-k8s-${var.environment}"
  location            = "${var.region}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  kubernetes_version  = "${var.kubernetes_version}"
  dns_prefix          = "bpc-k8s-${var.environment}"

  linux_profile {
    admin_username = "k8sadmin"

    ssh_key {
      key_data = "${var.sshkey}"
    }
  }

  agent_pool_profile {
    name    = "${var.environment}"
    count   = "${var.node_count}"
    vm_size = "${var.node_size}"
  }

  service_principal {
    client_id     = "${var.azure_sp_client_id}"
    client_secret = "${var.azure_sp_client_secret}"
  }

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}
