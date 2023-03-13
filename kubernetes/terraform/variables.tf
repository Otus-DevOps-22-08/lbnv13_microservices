variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  description = "key .json"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}
variable "count_worker" {
  description = "Worker nodes count"
  default     = 1
}
variable "disk_image" {
  description = "Disk image"
  default     = "ubuntu-18.04"
}
variable "disk_size" {
  description = "size"
  default     = "40"
}
