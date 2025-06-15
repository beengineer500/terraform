# main.tf

# proxmox provider 설정
provider "proxmox" {
  pm_tls_insecure = true                                    # HTTP 인증서 검증 무시
  pm_api_url      = "https://192.168.35.225:8006/api2/json" # proxmox API URL

  # 사용자 이름, 비밀번호
  pm_user     = "terraform-prov@pve"
  pm_password = var.proxmox_password # varialbes.tf에서 정의할 변수 사용
}

