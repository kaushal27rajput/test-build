resource "google_storage_bucket" "backup-storage" {
  name          = "${var.project_id}-backup-storage"
  location      = var.region
  storage_class = "NEARLINE"

  versioning {
    enabled = false
  }

  lifecycle_rule {
    condition {
      age = "30"
    }
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
}


resource "google_storage_bucket" "image-storage" {
  name          = "${var.project_id}-image-data"
  location      = var.region
  storage_class = "REGIONAL"
}
