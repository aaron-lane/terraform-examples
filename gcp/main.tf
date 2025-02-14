resource "google_compute_instance" "standard1" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    auto_delete = true
  }

  network_interface {}
}

resource "google_compute_disk" "standard" {
  name  = "test-disk-standard"
  type  = "pd-standard"
  zone  = "us-central1-a"
  image = "debian-8-jessie-v20170523"
  size = 40
}

provider "google" {
  region      = "us-central1"
  zone        = "us-central1-c"
}
