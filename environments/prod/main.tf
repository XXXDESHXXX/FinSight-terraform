provider "google" {
  project = var.project_id
  region  = var.region
}

module "gke_cluster" {
  source       = "../../modules/gke-cluster"
  cluster_name = var.cluster_name
  location     = var.zone
}

module "gcs_backend" {
  source      = "../../modules/gcs-backend"
  bucket_name = "gke-finsight-state"
  location    = var.region
  writer_member = "serviceAccount:${module.terraform_sa.email}"
  depends_on = [module.terraform_sa]
}

module "terraform_sa" {
  source       = "../../modules/service-account"
  project_id   = var.project_id
  account_id   = var.terraform_sa_account_id
  display_name = "Terraform Service Account"
  roles        = [
    "roles/storage.admin",
  ]
}

module "db_node_pool" {
  source       = "../../modules/gke-node-pool"
  name         = var.db_pool_name
  cluster      = module.gke_cluster.cluster_name
  location     = var.zone
  node_count   = var.db_node_count
  machine_type = var.db_machine_type
  disk_size    = var.db_disk_size
  disk_type    = var.db_disk_type
}
