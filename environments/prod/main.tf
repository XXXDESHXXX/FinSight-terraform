terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.38.0"
    }
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
}

module "gke_cluster" {
  source       = "../../modules/gke-cluster"
  cluster_name = var.cluster_name
  location     = var.zone
  project_id = var.project_id
}

module "gcs_backend" {
  source      = "../../modules/gcs-backend"
  bucket_name = "gke-finsight-state"
  location    = var.region
  writer_member = "serviceAccount:${module.terraform_sa.email}"
  writer_role = var.bucket_writer_role
  depends_on = [module.terraform_sa]
}

module "terraform_sa" {
  source       = "../../modules/service-account"
  project_id   = var.project_id
  account_id   = var.terraform_sa_account_id
  display_name = "Terraform Service Account"
  roles        = var.terraform_sa_roles
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

module "kafka_node_pool" {
  source       = "../../modules/gke-node-pool"
  name         = var.kafka_pool_name
  cluster      = module.gke_cluster.cluster_name
  location     = var.zone
  node_count   = var.kafka_node_count
  machine_type = var.kafka_machine_type
  disk_size    = var.kafka_disk_size
  disk_type    = var.kafka_disk_type
  no_external_ip = true
}


module "kms_key" {
  source         = "../../modules/kms-key"
  project_id     = var.project_id
  location       = var.region
  key_ring_name  = var.kms_key_ring_name
  crypto_key_name= var.kms_crypto_key_name
  members        = var.kms_members
}
