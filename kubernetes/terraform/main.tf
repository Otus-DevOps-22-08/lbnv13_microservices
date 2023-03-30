provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_kubernetes_cluster" "test-cluster" {
  name        = "test-cluster"
  network_id  = var.network_id

  master {
    version = "1.21"
    zonal {
      zone      = var.zone
      subnet_id = var.subnet_id
    }
    public_ip = true
  }

  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id

  release_channel = "RAPID"
  network_policy_provider = "CALICO"
}

resource "yandex_kubernetes_node_group" "test-group" {
  cluster_id = yandex_kubernetes_cluster.test-cluster.id
  name       = "test-group"
  version    = "1.21"

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat        = true
      subnet_ids = [var.subnet_id]
    }

    resources {
      cores         = 4
      memory        = 8
      core_fraction = 50
    }

    boot_disk {
      type = "network-ssd"
      size = 64
    }

    container_runtime {
      type = "containerd"
    }

    metadata = {
      ssh-keys = "ubuntu:${file(var.public_key_path)}"
    }
  }
  scale_policy {
    fixed_scale {
      size = 2
    }
  }
}
