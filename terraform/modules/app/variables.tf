variable zone {
  description = "Zone for instance"
  default     = "europe-west1-b"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable app_disk_image {
  description = "Disk image"
}

variable instances_quantity {
  description = "Quantity of instances"
  default     = 1
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable reddit_db_addr {
  description = "Internal DB IP"
}
