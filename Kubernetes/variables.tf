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

variable "kubernetes_version" {
  type        = "string"
  description = "Kubernetes Cluster Version"
}

variable "sshkey" {
  type        = "string"
  description = "SSH Public Key for Remote Connectivity"
}

variable "node_count" {
  type        = "string"
  description = "Number of Cluster Nodes"
}

variable "node_size" {
  type        = "string"
  description = "VM Size in Azure"
}

variable "azure_sp_client_id" {
  type        = "string"
  description = "Azure Service Principal Client ID"
}

variable "azure_sp_client_secret" {
  type        = "string"
  description = "Azure Service Principal Client Secret"
}
