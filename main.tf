resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone

  initial_node_count       = 1
  remove_default_node_pool = true

  networking_mode          = "VPC_NATIVE"

  ip_allocation_policy {}
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-nodes"
  cluster    = google_container_cluster.primary.name
  location   = var.zone

  node_count = var.node_count

  node_config {
    machine_type = var.node_machine_type
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
