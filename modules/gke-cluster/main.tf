resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.location

  initial_node_count       = 1
  remove_default_node_pool = true

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {}
}
