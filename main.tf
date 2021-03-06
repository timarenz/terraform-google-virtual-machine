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
  project      = var.project

  labels = local.all_tags

  tags = var.network_tags

  allow_stopping_for_update = true

  metadata = {
    ssh-keys  = var.ssh_public_key == null ? null : "${var.username}:${var.ssh_public_key}"
    user-data = var.user_data
  }

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  network_interface {
    network            = var.network
    subnetwork         = var.subnet
    subnetwork_project = var.subnet_project
    network_ip         = var.network_ip
    access_config {
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = var.access_scopes
  }
}
