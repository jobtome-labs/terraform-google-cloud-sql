resource "random_password" "users_passwords" {
  count = length(var.users)

  length = 64

  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "google_sql_user" "users" {
  count = length(var.users)

  instance = google_sql_database_instance.database.name

  name     = var.users[count.index].name
  password = random_password.users_passwords[count.index].result

  lifecycle {
    ignore_changes = [
      password
    ]
  }
}
