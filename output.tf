output "id" {
  value = google_sql_database_instance.database.id
}

output "name" {
  value = google_sql_database_instance.database.name
}

output "ip_address" {
  value = google_sql_database_instance.database.ip_address
}

output "private_ip_address" {
  value = google_sql_database_instance.database.private_ip_address
}

output "public_ip_address" {
  value = google_sql_database_instance.database.public_ip_address
}

output "databases" {
  value = google_sql_database.databases.*.name
}

output "users" {
  value = google_sql_user.users.*.name
}
