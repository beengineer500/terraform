# 파일 구조 및 모듈화
```text
terraform-proxmox-v8.4/
├── main.tf              # 메인 설정 파일 및 Provider 정의
├── variables.tf         # 입력 변수 정의
├── outputs.tf           # 출력 값 정의
├── terraform.tfvars     # 변수 값 (민감정보, Git 제외)
├── versions.tf          # Terraform 및 Provider 버전 지정
└── modules/
    └── vm/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf

```



