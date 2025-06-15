# versions.tf

terraform {
  required_version = ">= 1.0.0" # terraform CLI의 최소 버전
  required_providers {
    proxmox = {
      source  = "telmate/proxmox" # proxmox provider source
      version = "~> 2.9"
    }
  }
}
