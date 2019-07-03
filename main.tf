data "google_compute_zones" "available" {
  project = var.project
  region  = var.region
}

resource "random_shuffle" "compute_zone" {
  input        = data.google_compute_zones.available.names
  result_count = 1
}


locals {
  zone = var.zone == null ? random_shuffle.compute_zone.result[0] : var.zone
  common_tags = {
    environment = var.environment_name
    owner       = var.owner_name
    ttl         = var.ttl
  }
  all_tags = merge(local.common_tags, var.tags == null ? {} : var.tags)

}

resource "google_compute_instance" "main" {
  name         = var.name
  machine_type = var.size
  zone         = local.zone

  labels = local.all_tags

  metadata = {
    ssh-keys = "${var.username}:${var.ssh_public_key}"
  }

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet
    access_config {
    }
  }
}
