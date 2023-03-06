terraform {
  required_version = "~>1.3.8"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>4.55.0"
    }
  }

  backend "gcs" {}
}

provider "google" {
  project = var.project_id
}

module "cloud_run_service" {
  source          = "../modules/cloud_run"
  project_id      = var.project_id
  region          = var.region
  service_name    = var.service_name
  container_image = var.container_image
}
