provider "google" {
  project = var.project_id
  region  = var.region
  version = "3.58"
  credentials = file("/Users/kaus1553/Downloads/de-kaushal-kumar-c575754590dd.json")
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  version = "3.58"
}

terraform {
  required_version = "0.13.5"

  backend "gcs" {
    bucket = "test-build12"
    prefix = "de-kaushal-kumar"
  }
}
