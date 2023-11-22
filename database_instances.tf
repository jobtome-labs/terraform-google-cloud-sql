# tfsec:ignore:google-sql-no-public-access tfsec:ignore:google-sql-encrypt-in-transit-data tfsec:ignore:google-sql-enable-pg-temp-file-logging tfsec:ignore:google-sql-pg-log-connections tfsec:ignore:google-sql-pg-log-checkpoints tfsec:ignore:google-sql-pg-log-lock-waits tfsec:ignore:google-sql-pg-log-disconnections
resource "google_sql_database_instance" "database" {
  provider = google

  project = var.project
  region  = var.region

  name = var.name

  database_version = var.database_version

  master_instance_name = var.master_instance_name

  settings {

    activation_policy = var.activation_policy
    availability_type = var.availability_type

    backup_configuration {
      enabled            = var.backup_enabled
      start_time         = var.backup_start_time
      location           = var.backup_location
      binary_log_enabled = var.backup_binary_log_enabled
    }

    disk_size       = var.disk_size
    disk_type       = var.disk_type
    disk_autoresize = var.disk_autoresize

    location_preference {
      zone           = "${var.region}-${var.zone}"
      secondary_zone = var.secondary_zone != null ? "${var.region}-${var.secondary_zone}" : null
    }

    dynamic "maintenance_window" {
      for_each = (var.maintenance_window_day != null) || (var.maintenance_window_hour != null) ? [1] : []

      content {
        day  = var.maintenance_window_day
        hour = var.maintenance_window_hour
      }
    }

    dynamic "database_flags" {
      for_each = var.database_flags

      content {
        name  = database_flags.value.name
        value = database_flags.value.value
      }
    }

    dynamic "insights_config" {
      for_each = var.insights_config != null ? [1] : []

      content {
        query_insights_enabled  = var.insights_config.query_insights_enabled
        query_string_length     = var.insights_config.query_string_length
        record_application_tags = var.insights_config.record_application_tags
        record_client_address   = var.insights_config.record_client_address
        query_plans_per_minute  = var.insights_config.query_plans_per_minute
      }
    }

    tier = var.tier

    pricing_plan = "PER_USE"

    user_labels = var.user_labels

    ip_configuration {

      ipv4_enabled    = true
      private_network = var.private_network
      require_ssl     = false

      dynamic "authorized_networks" {
        for_each = var.authorized_networks

        content {
          name  = authorized_networks.value.display_name
          value = authorized_networks.value.cidr_block
        }
      }

    }

  }
}
