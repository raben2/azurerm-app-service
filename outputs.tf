output "app_url" {
  value       = azurerm_app_service.app.default_site_hostname
  description = "App default hostname"
}

output "app_service_plan_id" {
  value       = azurerm_app_service_plan.app_plan.id
  description = "App service plan reference"
}

