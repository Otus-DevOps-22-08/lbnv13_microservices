
variable "subnet_id" {
  description = "Subnet"
}
variable "public_key_path" {
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
