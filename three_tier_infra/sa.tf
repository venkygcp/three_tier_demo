
resource "google_service_account" "runsa" {
  project      = var.project_number
  account_id   = "${var.basename}-run-sa"
  display_name = "Service Account Three Tier App on Cloud Run"
}

resource "google_project_service" "all" {
  for_each           = toset(var.gcp_service_list)
  project            = var.project_number
  service            = each.key
  disable_on_destroy = false
}

resource "google_service_account" "buildsa" {
  project      = var.project_number
  account_id   = "${var.basename}-build-sa"
  display_name = "Service Account Three Tier App on Cloud Run"
}