terraform {
  required_version = ">=0.12.0"
  
  backend "s3" {
    bucket         = "ods.terraform.backend.sre.base"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "TerraformStatelock_sre_base"
    encrypt        = true
  }
}
