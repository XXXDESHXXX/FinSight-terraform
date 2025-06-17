variable "bucket_name" {
  type = string
}

variable "location" {
  type = string
  default = "europe-central2"
}

variable "writer_member" {
  type = string
}

variable "writer_sa_depends_on" {
  description = "Resource or a list of resources on which IAM Binding depends"
  type        = list(any)
  default     = []
}
