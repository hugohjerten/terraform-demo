resource "google_service_account" "example_service_account" {
  account_id   = "${var.service_name}-service-account"
  display_name = "${var.service_name}-service-account"
  description  = "DEMO!"
}

resource "google_cloud_run_service" "example_cloud_run" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      service_account_name = google_service_account.example_service_account.email
      containers {
        image = var.container_image
      }
    }
  }
}
