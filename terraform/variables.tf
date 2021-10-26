variable "region" {
  description = "GCP region identifier"
  type        = string
}

variable "zones" {
  description = "GCP zone identifier"
  type        = list(any)
}

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "project_number" {
  description = "Project Number"
  type        = string
}

variable "watchman_token" {
  type = string
}
