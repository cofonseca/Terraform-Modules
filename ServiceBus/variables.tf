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

variable "servicebus_namespace_name" {
  type        = "string"
  description = "Service Bus Namespace Name"
}

variable "servicebus_sku" {
  type        = "string"
  description = "Azure SKU"
  default     = "standard"
}

variable "servicebus_queue_name" {
  type        = "map"
  description = "Service Bus Queue Name"
}
