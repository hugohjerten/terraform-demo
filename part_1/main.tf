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

variable "project_id" {
  description = "GCP project ID."
  type        = string
}

provider "google" {
  project = var.project_id
}

resource "google_service_account" "example_service_account" {
  account_id   = "hugos-demo-service-account"
  display_name = "hugos-demo-service-account"
  description  = "DEMO!"
}

