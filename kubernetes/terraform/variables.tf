variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default = "ru-central1-a"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "network_id" {
  description = "network id"
}
variable "subnet_id" {
  description = "subnet id"
}
variable "service_account_key_file" {
  description = "service account key file"
}
variable "service_account_id" {
  description = "service account key id"
}
