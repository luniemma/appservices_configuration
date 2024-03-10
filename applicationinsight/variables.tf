
variable "azurerm_resource_group" {
    description = "resource group for appservice"
    default = "Dev-bicep-env1"
}
variable "location" {
    default = "west us 2"
  
}
variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  default     = "app-service-plan"
}

variable "sku" {
  description = "The SKU (pricing tier) of the App Service Plan."
  default     = "S1" # Free tier, change as needed
}

variable "web_app_name" {
  description = "The name of the Web App."
  default     = "webapp2cloud"
}
variable "app_insights_name" {
  description = "The name of the Application Insights instance."
  default     = "cloud-app-insights"
}