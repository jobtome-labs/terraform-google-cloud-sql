# Terraform-google-cloud-sql

Terraform Google Cloud SQL

## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 7.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 7.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | ~> 7.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [google_sql_database.databases](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [random_password.users_passwords](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_activation_policy"></a> [activation\_policy](#input\_activation\_policy) | (Optional) This specifies when the Instance should be active. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`. Defaults to `ALWAYS`. | `string` | `"ALWAYS"` | no |
| <a name="input_authorized_networks"></a> [authorized\_networks](#input\_authorized\_networks) | (Optional) Authorized Networks. | `list(any)` | `[]` | no |
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | (Optional) The Availability Type of the Cloud SQL Instance, High Availability (`REGIONAL`) or Single Zone (`ZONAL`). Defaults to `ZONAL`. | `string` | `"ZONAL"` | no |
| <a name="input_backup_binary_log_enabled"></a> [backup\_binary\_log\_enabled](#input\_backup\_binary\_log\_enabled) | (Optional) True if Binary Logging is Enabled. Can only be used with MySQL. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_backup_enabled"></a> [backup\_enabled](#input\_backup\_enabled) | (Optional) True if Backup Configuration is enabled. | `bool` | `true` | no |
| <a name="input_backup_location"></a> [backup\_location](#input\_backup\_location) | (Optional) The Region where the Backup will be stored. | `string` | `null` | no |
| <a name="input_backup_start_time"></a> [backup\_start\_time](#input\_backup\_start\_time) | (Optional) `HH:MM` Format Time indicating when Backup Configuration Starts. Defaults to `14:00`. | `string` | `"14:00"` | no |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags) | (Optional) Database Flags. | <pre>list(<br/>    object({<br/>      name  = string<br/>      value = string<br/>    })<br/>  )</pre> | `[]` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | (Required) The MySQL, PostgreSQL or SQL Server Version to use. | `string` | n/a | yes |
| <a name="input_databases"></a> [databases](#input\_databases) | (Optional) List of SQL Databases inside the Cloud SQL Instance to be created. | <pre>list(<br/>    object({<br/>      name = string<br/>    })<br/>  )</pre> | `[]` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | (Optional) Wheter to activate or not deletion protection. Must be set to false to allow deletion of a SQL istance. | `string` | `true` | no |
| <a name="input_disk_autoresize"></a> [disk\_autoresize](#input\_disk\_autoresize) | (Optional) Enables Auto-Resizing of the Storage Size. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | (Optional) The Size of Data Disk, in GB. Size of a Running Instance cannot be reduced but can be increased. The Minimum Value is 10GB. Defaults to `10`. | `number` | `10` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | (Optional) The Type of Data Disk: `PD_SSD` or `PD_HDD`. Defaults to `PD_SSD`. | `string` | `"PD_SSD"` | no |
| <a name="input_edition"></a> [edition](#input\_edition) | (Optional) The Edition Type to use. Applicable to PostgreSQL instances | `string` | `null` | no |
| <a name="input_insights_config"></a> [insights\_config](#input\_insights\_config) | (Optional) Query Insights (MySQL, PostgreSQL) Configuration. | <pre>object({<br/>    query_insights_enabled  = bool<br/>    query_string_length     = number<br/>    record_application_tags = bool<br/>    record_client_address   = bool<br/>    query_plans_per_minute  = number<br/>  })</pre> | `null` | no |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | (Optional) Declares a One-Hour Maintenance Window when an Instance can automatically restart to apply Updates. Day of Week (`1-7`). | `number` | `null` | no |
| <a name="input_maintenance_window_hour"></a> [maintenance\_window\_hour](#input\_maintenance\_window\_hour) | (Optional) Declares a One-Hour Maintenance Window when an Instance can automatically restart to apply Updates. Hour of Day (`0-23`). | `number` | `null` | no |
| <a name="input_master_instance_name"></a> [master\_instance\_name](#input\_master\_instance\_name) | (Optional) The Name of the existing Instance that will act as the Master in the Replication Setup. NOTE: This requires the Master to have `binary_log_enabled` set, as well as existing Backups. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The Name of the Instance. | `string` | n/a | yes |
| <a name="input_private_network"></a> [private\_network](#input\_private\_network) | (Optional) The VPC Network from which the Cloud SQL Instance is accessible for Private IP. | `string` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | (Optional) The ID of the Project in which the Resource belongs. Defaults to `jobtome-platform`. | `string` | `"jobtome-platform"` | no |
| <a name="input_region"></a> [region](#input\_region) | (Required) The Region the Instance will sit in. | `string` | n/a | yes |
| <a name="input_secondary_zone"></a> [secondary\_zone](#input\_secondary\_zone) | (Optional) The preferred Compute Engine Zone for the Secondary/Failover. | `string` | `null` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | (Required) The Machine Type to use. | `string` | n/a | yes |
| <a name="input_user_labels"></a> [user\_labels](#input\_user\_labels) | (Optional) A Set of Key/Value User Label Pairs to assign to the Instance. | `map(string)` | `{}` | no |
| <a name="input_users"></a> [users](#input\_users) | (Optional) List of SQL Database Users inside the Cloud SQL Instance to be created. | <pre>list(<br/>    object({<br/>      name = string<br/>    })<br/>  )</pre> | `[]` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | (Required) The preferred Zone. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_databases"></a> [databases](#output\_databases) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | n/a |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | n/a |
| <a name="output_users"></a> [users](#output\_users) | n/a |
