resource "random_id" "platform" {
  byte_length = 2
}

resource "google_compute_instance" "main" {
  name         =  "workbench-${random_id.platform.hex}"
  machine_type =  "${var.machine_type}"
  zone         =  "${var.zone}"

  allow_stopping_for_update = true

  tags = ["http-server", "https-server"]

  network_interface {
    network = "default"

    access_config {
    }
  }

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }
}
