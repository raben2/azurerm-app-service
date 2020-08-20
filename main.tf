locals {
  tags = {
    env = var.environment
  }
  default_site_config = {
    always_on = "true"
  }
}

resource "azurerm_app_service_plan" "app_plan" {
  name                = "${var.app_name}-serviceplan-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.system_variant
  reserved            = var.reserved

  sku {
    tier     = var.sku_tier
    size     = var.sku_size
    capacity = var.sku_capacity
  }

  tags = merge(local.tags, var.extra_tags)
}

resource "azurerm_app_service" "app" {
  name                = "${var.app_name}-app-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_plan.id
  https_only          = var.https_only

  app_settings = var.app_settings

  dynamic "site_config" {
    for_each = [merge(local.default_site_config, var.site_config)]

    content {
      always_on                 = lookup(site_config.value, "always_on", true)
      app_command_line          = lookup(site_config.value, "app_command_line", null)
      default_documents         = lookup(site_config.value, "default_documents", null)
      dotnet_framework_version  = lookup(site_config.value, "dotnet_framework_version", null)
      ftps_state                = lookup(site_config.value, "ftps_state", "Disabled")
      http2_enabled             = lookup(site_config.value, "http2_enabled", true)
      java_container            = lookup(site_config.value, "java_container", null)
      java_container_version    = lookup(site_config.value, "java_container_version", null)
      java_version              = lookup(site_config.value, "java_version", null)
      linux_fx_version          = lookup(site_config.value, "linux_fx_version", null)
      local_mysql_enabled       = lookup(site_config.value, "local_mysql_enabled", false)
      managed_pipeline_mode     = lookup(site_config.value, "managed_pipeline_mode", null)
      min_tls_version           = lookup(site_config.value, "min_tls_version", null)
      php_version               = lookup(site_config.value, "php_version", null)
      python_version            = lookup(site_config.value, "python_version", null)
      remote_debugging_enabled  = lookup(site_config.value, "remote_debugging_enabled", null)
      remote_debugging_version  = lookup(site_config.value, "remote_debugging_version", null)
      scm_type                  = lookup(site_config.value, "scm_type", "None")
      use_32_bit_worker_process = lookup(site_config.value, "use_32_bit_worker_process", null)
      websockets_enabled        = lookup(site_config.value, "websockets_enabled", false)
      windows_fx_version        = lookup(site_config.value, "windows_fx_version", null)

      // dynamic "cors" {
      //   for_each = lookup(site_config.value, "cors", [])
      //   content {
      //     allowed_origins     = cors.value.allowed_origins
      //   }
      // }
    }
  }

  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = lookup(connection_string.value, "name", null)
      type  = lookup(connection_string.value, "type", null)
      value = lookup(connection_string.value, "value", null)
    }
  }
  tags = merge(local.tags, var.extra_tags)
}
