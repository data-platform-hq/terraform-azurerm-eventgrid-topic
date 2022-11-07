output "id" {
  value       = azurerm_eventgrid_topic.this.id
  description = "The ID of the Event Grid Topic."
}

output "endpoint" {
  value       = azurerm_eventgrid_topic.this.endpoint
  description = "The endpoint of the Event Grid Topic."
}

output "primary_access_key" {
  value       = azurerm_eventgrid_topic.this.primary_access_key
  description = "The primary access key of the Event Grid Topic."
}
