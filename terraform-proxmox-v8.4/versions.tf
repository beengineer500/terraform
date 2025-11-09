#==============================================================================
# Terraform 및 Provider 버전 요구사항 정의
#==============================================================================
# 이 파일은 Terraform 코어 및 사용할 Provider의 버전을 명시합니다.
# - Terraform 최소 버전을 강제하여 팀 간 일관성 유지
# - Provider 버전 범위를 지정하여 예기치 않은 Breaking Changes 방지
# - 'terraform init' 실행 시 이 파일을 기반으로 Provider 다운로드
#==============================================================================

terraform {
  required_version = ">= 1.5.0" # terraform CLI의 최소 버전

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.82.0" # 0.82.x 버전 사용
    }
  }
}