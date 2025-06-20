resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.location

  enable_autopilot = true

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {}
}
