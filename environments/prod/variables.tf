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




variable "db_pool_name"     { type = string }
variable "db_node_count"    { type = number }
variable "db_machine_type"  { type = string }
variable "db_disk_size"     { type = number }
variable "db_disk_type"     { type = string }
