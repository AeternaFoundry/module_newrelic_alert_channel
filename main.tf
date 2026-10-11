resource "newrelic_alert_channel" "alert_channels" {
  for_each = var.alert_channels

  name       = each.value.name
  type       = each.value.type
  account_id = each.value.account_id

  dynamic "config" {
    for_each = each.value.config != null ? [each.value.config] : []
    content {
      api_key                 = config.value.api_key
      auth_password           = config.value.auth_password
      auth_type               = config.value.auth_type
      auth_username           = config.value.auth_username
      base_url                = config.value.base_url
      channel                 = config.value.channel
      headers                 = config.value.headers
      headers_string          = config.value.headers_string
      include_json_attachment = config.value.include_json_attachment
      key                     = config.value.key
      payload                 = config.value.payload
      payload_string          = config.value.payload_string
      payload_type            = config.value.payload_type
      recipients              = config.value.recipients
      region                  = config.value.region
      route_key               = config.value.route_key
      service_key             = config.value.service_key
      tags                    = config.value.tags
      teams                   = config.value.teams
      url                     = config.value.url
      user_id                 = config.value.user_id
    }
  }
}

