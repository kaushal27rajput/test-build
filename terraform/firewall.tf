resource "google_compute_firewall" "default" {
  name    = "bastion-access"
  network = google_compute_network.vpc.name
  project = "mgcp-1180845-svpc"
  allow {
    protocol = "ssh"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  direction = "ingress"
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["Bastion_instance"]
}

resource "google_compute_network" "vpc" {
  name = "crocus-net01"
}
