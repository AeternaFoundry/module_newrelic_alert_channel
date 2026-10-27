output "alert_channels_id" {
  description = "Map of id values across all alert_channels, keyed the same as var.alert_channels"
  value       = { for k, v in newrelic_alert_channel.alert_channels : k => v.id }
}
output "alert_channels_account_id" {
  description = "Map of account_id values across all alert_channels, keyed the same as var.alert_channels"
  value       = { for k, v in newrelic_alert_channel.alert_channels : k => v.account_id }
}
output "alert_channels_config" {
  description = "Map of config values across all alert_channels, keyed the same as var.alert_channels"
  value       = { for k, v in newrelic_alert_channel.alert_channels : k => one(v.config) }
  sensitive   = true
}
output "alert_channels_name" {
  description = "Map of name values across all alert_channels, keyed the same as var.alert_channels"
  value       = { for k, v in newrelic_alert_channel.alert_channels : k => v.name }
}
output "alert_channels_type" {
  description = "Map of type values across all alert_channels, keyed the same as var.alert_channels"
  value       = { for k, v in newrelic_alert_channel.alert_channels : k => v.type }
}

