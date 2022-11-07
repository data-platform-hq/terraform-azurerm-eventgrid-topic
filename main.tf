resource "azurerm_eventgrid_topic" "this" {
  name                = "egt-${var.project}-${var.env}-${var.location}-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group
  tags                = var.tags
}
