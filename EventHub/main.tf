resource "azurerm_resource_group" "eventhub" {
  name     = "${var.resource_group_name}"
  location = "${var.region}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_eventhub_namespace" "eventhub" {
  name                = "${var.eventhub_namespace_name}"
  location            = "${azurerm_resource_group.eventhub.location}"
  resource_group_name = "${azurerm_resource_group.eventhub.name}"
  sku                 = "${var.eventhub_namespace_sku}"
  capacity            = "${var.eventhub_namespace_capacity}"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_eventhub" "eventhub" {
  name                = "${var.eventhub_name}"
  namespace_name      = "${azurerm_eventhub_namespace.eventhub.name}"
  resource_group_name = "${azurerm_resource_group.eventhub.name}"
  partition_count     = "${var.eventhub_partition_count}"
  message_retention   = "${var.eventhub_message_retention}"

  capture_description {
    enabled  = 1
    encoding = "Avro"

    destination {
      name                = "EventHubArchive.AzureBlockBlob"
      storage_account_id  = "${azurerm_storage_account.eventhub.id}"
      blob_container_name = "${azurerm_storage_container.eventhub.name}"
      archive_name_format = "{Namespace}/{EventHub}/{PartitionId}/{Year}/{Month}/{Day}/{Hour}/{Minute}/{Second}"
    }
  }
}

resource "azurerm_storage_account" "eventhub" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = "${azurerm_resource_group.eventhub.name}"
  location                 = "${var.region}"
  account_kind             = "Storage"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags {
    Terraform   = "True"
    Environment = "${var.environment}"
  }
}

resource "azurerm_storage_container" "eventhub" {
  name                  = "${var.storage_container_name}"
  resource_group_name   = "${azurerm_resource_group.eventhub.name}"
  storage_account_name  = "${azurerm_storage_account.eventhub.name}"
  container_access_type = "blob"
}
