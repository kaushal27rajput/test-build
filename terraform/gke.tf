resource "google_container_cluster" "testbuild" {
name = "gke-cluster-sma"
location = var.region
initial_node_count = 1
remove_default_node_pool = false
network    = google_compute_network.vpc.name
subnetwork = google_compute_subnetwork.GKE-Cluster-Nodes.name
 
#private_cluster_config {
#    enable_private_endpoint = true
#    enable_private_nodes = true
#    master_ipv4_cidr_block = google_compute_subnetwork.GKE-Cluster-Nodes.ip_cidr_range
#  }

node_config {
machine_type = "n1-standard-4"
preemptible="false"
disk_size_gb= "20"
tags=["gke"]
}
addons_config {
    horizontal_pod_autoscaling {
      disabled = "false"
    }

 http_load_balancing {
      disabled = "false"
    }
  }
  
cluster_autoscaling {
    enabled = "true"
    resource_limits {
      resource_type = "memory"
      minimum       = 10
      maximum       = 100

    }
    resource_limits {
      resource_type = "cpu"
      minimum       = 1
      maximum       = 10
    }
  }
}
