resource "google_kms_key_ring" "key_ring" {
  name     = var.key_ring_name
  project  = var.project_id
  location = var.location
}

resource "google_kms_crypto_key" "crypto_key" {
  name            = var.crypto_key_name
  key_ring        = google_kms_key_ring.key_ring.id
  rotation_period = var.rotation_period

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_crypto_key_iam_member" "crypto_key_members" {
  for_each = toset(var.members)

  crypto_key_id = google_kms_crypto_key.crypto_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = each.key
}
