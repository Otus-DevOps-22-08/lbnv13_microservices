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
variable "count_apps" {
  description = "Apps count"
  default     = 1
}
variable "docker_disk_image" {
  description = "Disk image for docker host"
  default     = "docker-host"
}

