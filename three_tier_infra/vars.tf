variable "basename" {
  type = string
  default = "app-demo"
}

variable "project_number" {
  type = string
  default = "1016525798196"
}

variable "project_id" {
  type = string
  default = "app-project-372116"
}

variable "region" {
  type = string
  default = "us-central1"
}


variable "gcp_service_list" {
  description = "The list of apis necessary for the project"
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "cloudapis.googleapis.com",
    "vpcaccess.googleapis.com",
    "servicenetworking.googleapis.com",
    "cloudbuild.googleapis.com",
    "sql-component.googleapis.com",
    "sqladmin.googleapis.com",
    "storage.googleapis.com",
    "secretmanager.googleapis.com",
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    "redis.googleapis.com"
  ]
}