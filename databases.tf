resource "google_sql_database" "databases" {
  count = length(var.databases)

  instance = google_sql_database_instance.database.name

  name = var.databases[count.index].name
}
