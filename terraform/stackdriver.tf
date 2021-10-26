module "rs_sd_policy" {
  source = "github.com/rackspace-infrastructure-automation/mgcp-terraform-modules//rs-sd-policy/?ref=master"

  watchman_token = var.watchman_token
  enabled        = true
  project_id     = var.project_id

  rhel_disk_usage = {
    enabled              = true
    blk_dev_name         = "sda1"
    disk_threshold_bytes = 10737418240
  }

  debian_disk_usage = {
    enabled              = true
    blk_dev_name         = "root"
    disk_threshold_bytes = 10737418240
  }

  windows_disk_usage = {
    enabled                   = true
    blk_dev_name              = "C:"
    disk_threshold_percentage = 90
  }

  memory_usage = {
    enabled       = true
    mem_threshold = 100
  }

  uptime_check = {
    enabled = true
  }

}