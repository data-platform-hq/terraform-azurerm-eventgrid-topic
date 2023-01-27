resource "azurerm_eventgrid_topic" "this" {
  name                = "egt-${var.project}-${var.env}-${var.location}-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags
}

data "azurerm_monitor_diagnostic_categories" "this" {
  count       = var.enable_diagnostic_setting ? 1 : 0
  resource_id = azurerm_eventgrid_topic.this.id
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  count                          = var.enable_diagnostic_setting ? 1 : 0
  name                           = "egt-${var.project}-${var.env}-${var.location}-${var.name}"
  target_resource_id             = azurerm_eventgrid_topic.this.id
  log_analytics_workspace_id     = var.analytics_workspace_id
  log_analytics_destination_type = var.analytics_destination_type

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.this[0].log_category_types
    content {
      category = enabled_log.value
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.this[0].metrics
    content {
      category = metric.value
    }
  }
  lifecycle {
    ignore_changes = [log_analytics_destination_type] # TODO remove when issue is fixed: https://github.com/Azure/azure-rest-api-specs/issues/9281
  }
}
