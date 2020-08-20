# Azure app service module

Create an azure `app service` and `app service plan` with a generic module.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_name | application name | `string` | n/a | yes |
| app\_service\_plan\_id | id of the service plan | `string` | `""` | no |
| app\_settings | Application settings for App Service. | `map(string)` | `{}` | no |
| connection\_strings | Connection strings for App Service | `list(map(string))` | `[]` | no |
| environment | environment | `string` | `"develop"` | no |
| extra\_tags | Extra tags to add | `map(string)` | `{}` | no |
| https\_only | HTTPS restriction for App Service. | `string` | `"true"` | no |
| location | Azure resource location | `string` | n/a | yes |
| reserved | n/a | `bool` | `true` | no |
| resource\_group\_name | Resource group name | `string` | n/a | yes |
| site\_config | Site config for App Service | `any` | `{}` | no |
| sku\_capacity | number of replicas | `number` | `1` | no |
| sku\_size | instance type | `string` | `"B1"` | no |
| sku\_tier | n/a | `string` | `"Basic"` | no |
| system\_variant | OS of the app service | `string` | `"linux"` | no |

## Outputs

| Name | Description |
|------|-------------|
| app\_service\_plan\_id | App service plan reference |
| app\_url | App default hostname |
