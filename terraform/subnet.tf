resource "google_compute_network" "vpc" {
  name = "crocus-net01"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "GKE-Cluster-Services" {
  name          = "sma-subnet-services"
  ip_cidr_range = "10.128.0.0/18"
  region        = "europe-west2"
  network       = google_compute_network.vpc.name
}

resource "google_compute_subnetwork" "GKE-Cluster-Nodes" {
  name          = "sma-subnet-nodes"
  ip_cidr_range = "10.128.64.0/18"
  region        = "europe-west2"
  network       = google_compute_network.vpc.name
}

resource "google_compute_subnetwork" "GKE-Cluster-Pods" {
  name          = "sma-subnet-pods"
  ip_cidr_range = "10.128.128.0/17"
  region        = "europe-west2"
  network       = google_compute_network.vpc.name
}

resource "google_compute_subnetwork" "Other-services" {
  name          = "sma-subnet-misc"
  ip_cidr_range = "10.129.0.0/16"
  region        = "europe-west2"
  network       = google_compute_network.vpc.name

}

