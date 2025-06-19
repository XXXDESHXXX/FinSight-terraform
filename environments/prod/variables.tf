variable "project_id" {
  type = string
}
variable "region" {
  type = string
}
variable "zone" {
  type = string
}
variable "cluster_name" {
  type = string
}

variable "terraform_sa_account_id" {
  type = string
}

variable "terraform_sa_roles" {
  type        = list(string)
  description = "IAM roles to assign to the Terraform service account"
}

variable "bucket_writer_role" {
  type        = string
  description = "IAM role for bucket access"
  default     = "roles/storage.objectAdmin"
}


variable "kms_key_ring_name" {
  description = "Name of the KMS key ring"
  type        = string
}

variable "kms_crypto_key_name" {
  description = "Name of the KMS crypto key"
  type        = string
}

variable "kms_members" {
  description = "List of IAM members allowed to encrypt/decrypt with this key"
  type        = list(string)
}

variable "db_pool_name"     { type = string }
variable "db_node_count"    { type = number }
variable "db_machine_type"  { type = string }
variable "db_disk_size"     { type = number }
variable "db_disk_type"     { type = string }

variable "kafka_pool_name" { type = string}
variable "kafka_node_count" { type = number}
variable "kafka_machine_type"  { type = string}
variable "kafka_disk_size" { type = number}
variable "kafka_disk_type" { type = string}
