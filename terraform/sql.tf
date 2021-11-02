resource "google_sql_database_instance" "testbuild" {
name="mysql"
database_version="MYSQL_5_7"
region=var.region
project=var.project_id

settings {
tier = "db-n1-standard-4"
availability_type = "REGIONAL"
disk_size = "50"
disk_type = "PD_SSD"
   backup_configuration {
      binary_log_enabled             = "true"
      enabled                        = "true"
      start_time                     = "04:00"
      point_in_time_recovery_enabled = "false"
    }
    maintenance_window {
      day          = "6"
      hour         = "2"
      update_track = "stable"
    }
  }
}

