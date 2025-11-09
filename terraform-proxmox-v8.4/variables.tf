#==============================================================================
# 입력 변수 정의 (Input Variables)
#==============================================================================
# 이 파일은 Terraform 설정에서 사용할 모든 변수를 정의합니다.
# - 각 변수의 타입, 설명, 기본값, 검증 규칙 포함
# - 실제 값은 terraform.tfvars 파일 또는 환경변수로 전달
# - 민감한 정보(API 토큰 등)는 sensitive = true로 마킹
#==============================================================================

# Proxmox VE API 연결 정보
variable "pve_api_url" {
  description = "Proxmox API endpoint URL"
  type        = string
  sensitive   = true

  validation {
    condition     = can(regex("^https://.*:8006/?$", var.pve_api_url))
    error_message = "API URL must be vaild proxmox endpoint (e.g., https://192.168.0.100:8006)"
  }
}

variable "pve_token_id" {
  description = "Proxmox API token ID"
  type        = string
  sensitive   = true
}

variable "pve_token_secret" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = true
}

variable "pve_username" {
  description = "Proxmox login username"
  type        = string
  sensitive   = true
}

variable "pve_password" {
  description = "Proxmox login password"
  type        = string
  sensitive   = true
}

# proxmox 노드 설정
variable "target_node" {
  description = "Target proxmox node name"
  type        = string
  default     = "home-server"
}

# VM 배포 대상 설정
variable "vm_id" {
  description = "VM ID number"
  type        = number
}

variable "vm_name" {
  description = "VM NAME"
  type        = string
}

# VM OS 설정
variable "iso_storage" {
  description = "Proxmox Storage stored ISO images"
  type        = number
  default     = "local-hdd-1TB"
}

variable "iso_file" {
  description = "ISO image file name to use"
  type        = string
  default     = "Rocky-9.4-latest-x86_64-dvd.iso"
}

# VM 리소스 설정
variable "vm_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 4
}

variable "vm_memory" {
  description = "Memory size in MB"
  type        = number
  default     = 4096
}

# 스토리지 설정
variable "vm_disk_size" {
  description = "Disk size (e.g. 20G)"
  type        = string
  default     = "50G"
}

variable "storage_id" {
  description = "Stroage ID for disk allocation"
  type        = strint
  default     = "local-lvm"
}

# variable "proxmox_password" {
#   description = "Password for the Proxmox API User"
#   type        = string
#   sensitive   = true # 해당 변수가 민감한 정보임을 terraform에게 알린다. (plan, apply 출력에서 마스킹된다.)
# }
