resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "g1-small"
  zone         = "europe-west2-a"

  tags = ["bastion"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
 subnetwork = google_compute_subnetwork.Other-services.name
  }

}
