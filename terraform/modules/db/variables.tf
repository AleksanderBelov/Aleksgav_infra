variable zone {
  description = "Zone for instance"
  default     = "europe-west1-b"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable db_disk_image {
  description = "Disk image for reddit db"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}