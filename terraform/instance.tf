resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "g1-small"
  zone         = "europe-west1"

  tags = ["bastion"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.default.name

  }

}
