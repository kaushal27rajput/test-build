provider "google" {
  project = var.project_id
  region  = var.region
  version = "3.58"
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  version = "3.58"
}

terraform {
  required_version = "0.13.5"

  backend "gcs" {
    bucket = "1192365-tfstate"
    prefix = "de-kaushal-kumar"
  }
}
