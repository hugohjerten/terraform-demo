output "cloud_run_url" {
  value       = module.cloud_run_service.cloud_run_url
  description = "The url from which to access the Cloud Run instance."
}
