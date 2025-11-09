#==============================================================================
# Proxmox Provider 설정 및 VM 리소스 정의
#==============================================================================
# 이 파일은 Terraform의 메인 설정 파일입니다.
# - Proxmox Provider 인증 및 연결 설정
# - VM 생성을 위한 리소스 블록 정의
# - Cloud-init 이미지 다운로드 및 VM 프로비저닝
# - 실행 흐름: Provider 초기화 → 이미지 다운로드 → VM 생성 → 시작
#==============================================================================

# proxmox provider 인증 설정
provider "proxmox" {
  endpoint  = var.pve_api_url
  api_token = "${var.pve_api_token_id}=${var.pve_api_token_secret}"

  # 자체 서명 인증서 사용 시 TLS 검증 비활성화 (홈랩 환경)
  insecure = true

  # SSH 설정 (파일 업로드 등에 필요)
  ssh {
    agent = true
  }
}

resource "proxmox_virtual_environmnent_vm" "vm" {
  node_name = var.target_node
  vm_id     = var.vm_id
  name      = var.vm_name

  agent {
    enabled = true
  }

  cpu {
    cores = var.cpu_cores
    type  = "host" # host|kvm64|qemu64|custom
  }

  memory {
    dedicated = var.vm_memory # dedicated|floating|ballon
  }

  disk {
    datastore_id = var.storage_id
    size         = var.vm_disk_size
    type         = "scsi" # scsi|sata|virtio
    storage_id   = var.storage_id
    format       = "qcow2" # raw|qcow2
  }

  cdrom {
    datastore = var.iso_storage
    iso_file  = var.iso_file
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

