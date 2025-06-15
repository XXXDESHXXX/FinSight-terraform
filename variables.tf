variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the node pool"
  type        = number
  default     = 2
}

variable "disk_type" {
  description = "Disk type of nodes"
  type        = string
}

variable "node_machine_type" {
  description = "Type of machine to use for nodes"
  type        = string
  default     = "e2-medium"
}
