
resource "azurerm_resource_group" "applanrg" {
  name     = var.azurerm_resource_group
  location = var.location
}

resource "azurerm_app_service_plan" "app-plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = azurerm_resource_group.applanrg.name
  kind                = "linux" # Change to "Windows" if needed
  reserved            = true

  sku {
    tier = var.sku
    size = "S1"
  }
}

resource "azurerm_app_service" "webappcloud" {
  name                = var.web_app_name
  location            = azurerm_resource_group.applanrg.location
  resource_group_name = azurerm_resource_group.applanrg.name
  app_service_plan_id = azurerm_app_service_plan.app-plan.id
  site_config {
    always_on = true
  }
  app_settings = {
    "APPLICATIONS_INSTRUMENTATIONKEY" = azurerm_application_insights.insightsapp.instrumentation_key
  }

    # Add additional app settings as needed
}


resource "azurerm_application_insights" "insightsapp" {
  name                = var.app_insights_name
  location            = azurerm_resource_group.applanrg.location
  resource_group_name = azurerm_resource_group.applanrg.name
  application_type    = "web"
  tags = {
    environment = "production"
  }
}


# Use the variable where needed, for example:

