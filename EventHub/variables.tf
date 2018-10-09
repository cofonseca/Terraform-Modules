variable "region" {
  type        = "string"
  description = "Desired Azure Region"
}

variable "environment" {
  type        = "string"
  description = "Environment"
}

variable "resource_group_name" {
  type        = "string"
  description = "Resource Group Name"
}

variable "eventhub_namespace_name" {
  type        = "string"
  description = "Event Hub Namespace Name"
}

variable "eventhub_namespace_sku" {
  type        = "string"
  description = "Azure SKU"
}

variable "eventhub_namespace_capacity" {
  type        = "string"
  description = "Event Hub Namespace Capacity"
}

variable "eventhub_name" {
  type        = "string"
  description = "Event Hub Name"
}

variable "eventhub_partition_count" {
  type        = "string"
  description = "Event Hub Partition Count"
}

variable "eventhub_message_retention" {
  type        = "string"
  description = "Event Hub Message Retention Period"
}

variable "storage_account_name" {
  type        = "string"
  description = "Storage Account Name"
}

variable "storage_container_name" {
  type        = "string"
  description = "Storage Container Name"
}
