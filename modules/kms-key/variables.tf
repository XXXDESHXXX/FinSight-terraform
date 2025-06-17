variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "location" {
  description = "GCP region/location for the KMS key ring"
  type        = string
}

variable "key_ring_name" {
  description = "Name of the KMS key ring"
  type        = string
}

variable "crypto_key_name" {
  description = "Name of the KMS crypto key"
  type        = string
}

variable "rotation_period" {
  description = "Rotation period for the key"
  type        = string
  default     = null
}

variable "members" {
  description = "List of IAM members to grant the 'roles/cloudkms.cryptoKeyEncrypterDecrypter' role"
  type        = list(string)
  default     = []
}
