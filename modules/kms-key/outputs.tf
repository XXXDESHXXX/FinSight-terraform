output "key_ring_id" {
  description = "ID of the KMS key ring"
  value       = google_kms_key_ring.key_ring.id
}

output "crypto_key_id" {
  description = "ID of the KMS crypto key"
  value       = google_kms_crypto_key.crypto_key.id
}

output "crypto_key_name" {
  description = "Name of the crypto key"
  value       = google_kms_crypto_key.crypto_key.name
}
