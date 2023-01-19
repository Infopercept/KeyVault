data "azurerm_client_config" "client_config" {}

resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.client_config.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  enabled_for_template_deployment = var.enabled_for_template_deployment
  sku_name                    = var.sku_name

# network_acls {  
#  default_action = "Deny"
#  bypass         = "AzureServices"
#  ip_rules       = ["110.227.254.84"]
# }

  access_policy {
    tenant_id = data.azurerm_client_config.client_config.tenant_id
    object_id = data.azurerm_client_config.client_config.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.key_vault_pe_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = var.private_dns_zone_id
  }
  
  private_service_connection {
    name                              = var.key_vault_private_sc_name
    private_connection_resource_id    = azurerm_key_vault.key_vault.id
    is_manual_connection              = var.is_manual_connection
    subresource_names                 = var.subresource_names
  }

  depends_on = [
    azurerm_key_vault.key_vault
  ]
}