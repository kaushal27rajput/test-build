resource "google_storage_bucket" "prod-storage" {
  name          = "${var.project_id}-prod-storage"
  location      = var.region
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = "365"
    }
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }
}


resource "google_storage_bucket" "backup-storage" {
  name          = "${var.project_id}-backup-data"
  location      = var.region
  storage_class = "NEARLINE"
}
