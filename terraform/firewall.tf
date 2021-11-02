resource "google_compute_firewall" "default" {
  name    = "bastion-access"
  network = google_compute_network.vpc.name
  project = var.project_id
  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["bastion"]
}

