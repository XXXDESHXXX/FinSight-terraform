resource "google_container_node_pool" "node_pool" {
  name     = var.name
  cluster  = var.cluster
  location = var.location

  node_count = var.node_count

  node_config {
    machine_type   = var.machine_type
    disk_size_gb   = var.disk_size
    disk_type      = var.disk_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }


  }

  network_config {
      create_with_no_public_ip = var.no_external_ip
    }
  lifecycle {
    ignore_changes = [node_count]
  }
}
