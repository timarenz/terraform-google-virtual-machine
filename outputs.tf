output "id" {
  value = google_compute_instance.main.instance_id
}

output "private_ip" {
  value = google_compute_instance.main.network_interface.0.network_ip
}

output "public_ip" {
  value = google_compute_instance.main.network_interface.0.access_config.0.nat_ip
}

output "self_link" {
  value = google_compute_instance.main.self_link
}
