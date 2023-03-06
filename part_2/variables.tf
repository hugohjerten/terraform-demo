variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy cloud run."
  type        = string
}

variable "cloud_run_name" {
  description = "Name of the cloud run deployment"
  type        = string
  default     = "hugos-demo-cloud-run"
}
