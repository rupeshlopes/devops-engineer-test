# Outputs

output "cloud_run_url" {
  value = element(google_cloud_run_service.default.status, 0).url
}

output "load_balancer_ip" {
  value = google_compute_global_address.default.address
}
