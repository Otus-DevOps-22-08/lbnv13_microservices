resource "yandex_compute_instance" "worker" {
  name = "worker-node${count.index+1}"

  labels = {
    tags = "worker-node"
  }
  count = var.count_worker

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.disk_image
      size = var.disk_size
      type = "network-ssd"
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}