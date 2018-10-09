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

variable "virtual_network_name" {
  type        = "string"
  description = "Virtual Network Name"
}

variable "virtual_network_address_space" {
  type        = "list"
  description = "Virtual Network Address Space"
}

variable "subnet_1_name" {
  type        = "string"
  description = "Subnet Name"
}

variable "subnet_1_prefix" {
  type        = "string"
  description = "CIDR of Subnet"
}

variable "subnet_2_name" {
  type        = "string"
  description = "Subnet Name"
}

variable "subnet_2_prefix" {
  type        = "string"
  description = "CIDR of Subnet"
}

variable "public_ip_name" {
  type        = "string"
  description = "Public IP Name"
}

variable "public_ip_type" {
  type        = "string"
  description = "Static or Dynamic"
}

variable "vpn_name" {
  type        = "string"
  description = "VPN Gateway Name"
}

variable "vpn_sku" {
  type        = "string"
  description = "Azure VPN Gateway SKU"
}

variable "ip_configuration_name" {
  type        = "string"
  description = "IP Configuration Name"
}

variable "vpn_address_space" {
  type        = "list"
  description = "VPN Gateway Address Spacee"
}

variable "local_network_name" {
  type        = "string"
  description = "Description of Local Network"
}

variable "blueport_gateway_address" {
  type        = "string"
  description = "Blueport External IP Address"
}

variable "blueport_address_space" {
  type        = "list"
  description = "CIDR of Subnet"
}

variable "vpn_psk" {
  type        = "string"
  description = "Pre-Shared Key"
}
