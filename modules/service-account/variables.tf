variable "project_id" {
  type = string
}

variable "account_id" {
  type = string
  description = "Service account ID"
}

variable "display_name" {
  type = string
}

variable "roles" {
  type = list(string)
}
