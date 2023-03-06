output "cloud_run_url" {
  value       = google_cloud_run_service.example_cloud_run.status[0].url
  description = "The url from which to access the Cloud Run instance."
}
