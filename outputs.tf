output "alert_channels_id" {
  description = "Map of id values across all alert_channels, keyed the same as var.alert_channels except keys with no id are omitted"
  value       = { for k, v in newrelic_alert_channel.alert_channels : k => v.id if v.id != null && length(v.id) > 0 }
}
output "alert_channels_account_id" {
  description = "Map of account_id values across all alert_channels, keyed the same as var.alert_channels except keys with no account_id are omitted"
  value       = { for k, v in newrelic_alert_channel.alert_channels : k => v.account_id if v.account_id != null }
}
output "alert_channels_config" {
  description = "Map of config values across all alert_channels, keyed the same as var.alert_channels except keys with no config are omitted"
  value       = { for k, v in newrelic_alert_channel.alert_channels : k => one(v.config) if v.config != null && length(v.config) > 0 }
  sensitive   = true
}
output "alert_channels_name" {
  description = "Map of name values across all alert_channels, keyed the same as var.alert_channels except keys with no name are omitted"
  value       = { for k, v in newrelic_alert_channel.alert_channels : k => v.name if v.name != null && length(v.name) > 0 }
}
output "alert_channels_type" {
  description = "Map of type values across all alert_channels, keyed the same as var.alert_channels except keys with no type are omitted"
  value       = { for k, v in newrelic_alert_channel.alert_channels : k => v.type if v.type != null && length(v.type) > 0 }
}

