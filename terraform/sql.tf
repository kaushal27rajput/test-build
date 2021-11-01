resource "google_sql_database_instance" {
name="mysql"
database_version="mysql5.7"
region=var.region
project=var.project

    disk_size         = "50"
    disk_type         = "PD_SSD"

settings {
tier = "db-n1-standard-4"
availability_type = "Regional"

   backup_configuration {
      binary_log_enabled             = "true"
      enabled                        = "true"
      start_time                     = "04:00"
      point_in_time_recovery_enabled = "true"
    }
}
    maintenance_window {
      day          = "6"
      hour         = "2"
      update_track = "stable"
    }

}

