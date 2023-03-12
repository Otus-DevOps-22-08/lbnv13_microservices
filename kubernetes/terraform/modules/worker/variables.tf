variable "subnet_id" {
  description = "Subnet"
}
variable "count_worker" {
  description = "Worker nodes count"
  default     = 1
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "disk_image" {
  description = "Disk image"
  default     = "ubuntu-18.04"
}
variable "disk_size" {
  description = "size"
  default     = "40"
}
