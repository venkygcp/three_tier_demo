resource "google_sql_database_instance" "main" {
  name             = "${var.basename}-db-${var.project_number}"
  database_version = "MYSQL_8_0"
  region           = var.region
  project          = var.project_id
  settings {
    tier                  = "db-g1-small"
    disk_autoresize       = true
    disk_autoresize_limit = 0
    disk_size             = 10
    disk_type             = "PD_SSD"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.main.id
    }
    location_preference {
        zone = "${var.region}-a"
    }
  }
  deletion_protection = false
  depends_on = [
    google_project_service.all,
    google_service_networking_connection.main
  ]

#   provisioner "local-exec" {
#     working_dir = "${path.module}/db_script.sh"
#     command     = "./load_schema.sh ${var.project_id} ${google_sql_database_instance.main.name}"
#   }
}

resource "google_secret_manager_secret" "db_password" {
  project = var.project_number
  replication {
    automatic = true
  }
  secret_id  = "db_password"
  depends_on = [google_project_service.all]
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "google_secret_manager_secret_version" "db_password" {
  enabled     = true
  secret      = "projects/${var.project_number}/secrets/db_password"
  secret_data = random_password.password.result
  depends_on  = [google_project_service.all, google_sql_database_instance.main, google_secret_manager_secret.db_password]
}