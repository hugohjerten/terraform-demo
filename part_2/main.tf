terraform {
  required_version = "~>1.3.8"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>4.55.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "google" {
  project = var.project_id
}

resource "google_service_account" "example_service_account" {
  account_id   = "hugos-demo-service-account"
  display_name = "hugos-demo-service-account"
  description  = "DEMO!"
}

resource "google_cloud_run_service" "example_cloud_run" {
  name     = var.cloud_run_name
  location = var.region

  template {
    spec {
      service_account_name = google_service_account.example_service_account.email
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }
}
