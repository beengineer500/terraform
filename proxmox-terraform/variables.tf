# variables.tf
# 민감한 정보나, 자주 변경될 수 있는 값들을 변수로 정의한다.

variable "proxmox_password" {
  description = "Password for the Proxmox API User"
  type        = string
  sensitive   = true # 해당 변수가 민감한 정보임을 terraform에게 알린다. (plan, apply 출력에서 마스킹된다.)
}
