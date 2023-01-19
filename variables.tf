variable "resource_group_name" {
  description = "The name of your Azure Resource Group."
  type = string  
}

variable "location" {
  description = "The region where the keyvolt is created."
  type = string
}

variable "key_vault_name" {
  description = "The region where the keyvolt is created."
  type = string
}

variable "enabled_for_disk_encryption" {
  description = "id of the subnet"
  type = string
  default = true
}

variable "soft_delete_retention_days" {
  description = "id of the subnet"
  type = string
  default = "30"
}

variable "enabled_for_template_deployment" {
  description = "id of the subnet"
  type = string
  default = true
}

variable "sku_name" {
  description = "id of the subnet"
  type = string
  default = "standard"
}

variable "key_vault_pe_name" {
  description = "id of the subnet"
  nullable = false
}

variable "subnet_id" {
  description = "id of the subnet"
  type = string
}

variable "private_dns_zone_name" {
  description = "The storage account container access type."
  type = list(string)  
  default = [ "default" ]
}

variable "private_dns_zone_id" {
  description = "The storage account container access type."
  type = list(string)  
  nullable = false
}

variable "key_vault_private_sc_name" {
  description = "id of the subnet"
  type = string
}

variable "is_manual_connection" {
  description = "id of the subnet"
  type = string
  default = false
}

variable "subresource_names" {
  description = "id of the subnet"
  type = list(string)
  default = ["vault"]
}

