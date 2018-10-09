variable "region" {
  type        = "string"
  description = "Azure Region"
}

variable "environment" {
  type        = "string"
  description = "Environment"
}

variable "resource_group_name" {
  type        = "string"
  description = "Resource Group Name"
}

variable "container_registry_name" {
  type        = "string"
  description = "Container Registry Name"
}

variable "container_registry_sku" {
  type        = "string"
  description = "Azure SKU"
}
