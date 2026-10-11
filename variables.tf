variable "alert_channels" {
  description = <<EOT
Map of alert_channels, attributes below
Required:
    - name
    - type
Optional:
    - account_id
    - config (block):
        - api_key (optional)
        - auth_password (optional)
        - auth_type (optional)
        - auth_username (optional)
        - base_url (optional)
        - channel (optional)
        - headers (optional)
        - headers_string (optional)
        - include_json_attachment (optional)
        - key (optional)
        - payload (optional)
        - payload_string (optional)
        - payload_type (optional)
        - recipients (optional)
        - region (optional)
        - route_key (optional)
        - service_key (optional)
        - tags (optional)
        - teams (optional)
        - url (optional)
        - user_id (optional)
EOT

  type = map(object({
    name       = string
    type       = string
    account_id = optional(number)
    config = optional(object({
      api_key                 = optional(string)
      auth_password           = optional(string)
      auth_type               = optional(string)
      auth_username           = optional(string)
      base_url                = optional(string)
      channel                 = optional(string)
      headers                 = optional(map(string))
      headers_string          = optional(string)
      include_json_attachment = optional(string)
      key                     = optional(string)
      payload                 = optional(map(string))
      payload_string          = optional(string)
      payload_type            = optional(string)
      recipients              = optional(string)
      region                  = optional(string)
      route_key               = optional(string)
      service_key             = optional(string)
      tags                    = optional(string)
      teams                   = optional(string)
      url                     = optional(string)
      user_id                 = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.alert_channels : (
        v.config == null || (v.config.auth_type == null || (contains(["BASIC"], v.config.auth_type)))
      )
    ])
    error_message = "must be one of: \"BASIC\""
  }
  validation {
    condition = alltrue([
      for k, v in var.alert_channels : (
        v.config == null || (v.config.include_json_attachment == null || (contains([for v in ["true", "false", "1", "0"] : lower(v)], lower(v.config.include_json_attachment))))
      )
    ])
    error_message = "must be one of: \"true\", \"false\", \"1\", \"0\""
  }
  validation {
    condition = alltrue([
      for k, v in var.alert_channels : (
        v.config == null || (v.config.payload_type == null || (contains(["application/json", "application/x-www-form-urlencoded"], v.config.payload_type)))
      )
    ])
    error_message = "must be one of: \"application/json\", \"application/x-www-form-urlencoded\""
  }
  validation {
    condition = alltrue([
      for k, v in var.alert_channels : (
        v.config == null || (v.config.region == null || (contains(["US", "EU", "JP"], v.config.region)))
      )
    ])
    error_message = "must be one of: \"US\", \"EU\", \"JP\""
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

