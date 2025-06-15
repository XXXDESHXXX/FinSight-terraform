provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket  = "gke-finsight-state"
    prefix  = "gke/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }

  required_version = ">= 1.3"
}
