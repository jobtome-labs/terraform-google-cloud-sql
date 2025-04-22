variable "project" {
  type        = string
  description = "(Optional) The ID of the Project in which the Resource belongs. Defaults to `jobtome-platform`."

  default = "jobtome-platform"
}

variable "region" {
  type        = string
  description = "(Required) The Region the Instance will sit in."
}

variable "zone" {
  type        = string
  description = "(Required) The preferred Zone."
}

variable "secondary_zone" {
  type        = string
  description = "(Optional) The preferred Compute Engine Zone for the Secondary/Failover."

  default = null
}

variable "name" {
  type        = string
  description = "(Required) The Name of the Instance."
}

variable "deletion_protection" {
  type        = string
  description = "(Optional) Wheter to activate or not deletion protection. Must be set to false to allow deletion of a SQL istance."

  default = true
}

variable "database_version" {
  type        = string
  description = "(Required) The MySQL, PostgreSQL or SQL Server Version to use."
}

variable "master_instance_name" {
  type        = string
  description = "(Optional) The Name of the existing Instance that will act as the Master in the Replication Setup. NOTE: This requires the Master to have `binary_log_enabled` set, as well as existing Backups."

  default = null
}

variable "availability_type" {
  type        = string
  description = "(Optional) The Availability Type of the Cloud SQL Instance, High Availability (`REGIONAL`) or Single Zone (`ZONAL`). Defaults to `ZONAL`."

  default = "ZONAL"
}

variable "activation_policy" {
  type        = string
  description = "(Optional) This specifies when the Instance should be active. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`. Defaults to `ALWAYS`."

  default = "ALWAYS"
}

variable "backup_enabled" {
  type        = bool
  description = "(Optional) True if Backup Configuration is enabled."

  default = true
}

variable "backup_binary_log_enabled" {
  type        = bool
  description = "(Optional) True if Binary Logging is Enabled. Can only be used with MySQL. Defaults to `false`."

  default = false
}

variable "backup_start_time" {
  type        = string
  description = "(Optional) `HH:MM` Format Time indicating when Backup Configuration Starts. Defaults to `14:00`."

  default = "14:00"
}

variable "backup_location" {
  type        = string
  description = "(Optional) The Region where the Backup will be stored."

  default = null
}

variable "disk_autoresize" {
  type        = bool
  description = "(Optional) Enables Auto-Resizing of the Storage Size. Defaults to `true`."

  default = true
}

variable "disk_size" {
  type        = number
  description = "(Optional) The Size of Data Disk, in GB. Size of a Running Instance cannot be reduced but can be increased. The Minimum Value is 10GB. Defaults to `10`."

  default = 10
}

variable "disk_type" {
  type        = string
  description = "(Optional) The Type of Data Disk: `PD_SSD` or `PD_HDD`. Defaults to `PD_SSD`."

  default = "PD_SSD"
}

variable "maintenance_window_day" {
  type        = number
  description = "(Optional) Declares a One-Hour Maintenance Window when an Instance can automatically restart to apply Updates. Day of Week (`1-7`)."

  default = null
}

variable "maintenance_window_hour" {
  type        = number
  description = "(Optional) Declares a One-Hour Maintenance Window when an Instance can automatically restart to apply Updates. Hour of Day (`0-23`)."

  default = null
}

variable "tier" {
  type        = string
  description = "(Required) The Machine Type to use."
}

variable "edition" {
  type        = string
  description = "(Optional) The Edition Type to use. Applicable to PostgreSQL instances"

  default = null
}

variable "authorized_networks" {
  type        = list(any)
  description = "(Optional) Authorized Networks."

  default = []
}

variable "database_flags" {
  type = list(
    object({
      name  = string
      value = string
    })
  )
  description = "(Optional) Database Flags."

  default = []
}

variable "user_labels" {
  type        = map(string)
  description = "(Optional) A Set of Key/Value User Label Pairs to assign to the Instance."

  default = {}
}

variable "private_network" {
  type        = string
  description = "(Optional) The VPC Network from which the Cloud SQL Instance is accessible for Private IP."

  default = null
}

variable "insights_config" {
  type = object({
    query_insights_enabled  = bool
    query_string_length     = number
    record_application_tags = bool
    record_client_address   = bool
    query_plans_per_minute  = number
  })
  description = "(Optional) Query Insights (MySQL, PostgreSQL) Configuration."

  default = null
}

variable "databases" {
  type = list(
    object({
      name = string
    })
  )
  description = "(Optional) List of SQL Databases inside the Cloud SQL Instance to be created."

  default = []
}

variable "users" {
  type = list(
    object({
      name = string
    })
  )
  description = "(Optional) List of SQL Database Users inside the Cloud SQL Instance to be created."

  default = []
}
