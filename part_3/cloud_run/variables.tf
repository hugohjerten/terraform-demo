variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region to deploy cloud run."
  type        = string
  default     = "europe-west4"
}

variable "service_name" {
  description = "Name of the cloud run service"
  type        = string
  default     = "hugos-demo"
}

variable "container_image" {
  description = "The docker image to be used in the Cloud Run service."
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
}
