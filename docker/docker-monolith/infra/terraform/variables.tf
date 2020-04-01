variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}
variable conn_pk {
  description = "connection private key"
}
variable zone_conn {
  description = "zone connection"
  default     = "europe-west1-b"
}
variable count_vms {
  description = "count_vms"
  default     = "3"
}
