locals {
  operators = [
    "Molly.L.Stewart.ctr@nga.mil",
    "Corey.A.Rodriquez.ctr@nga.mil",
    "mark.liller@gdit.com",
    "cijames@teknoluxion.com"
  ]
}

variable "bucket" {
  description = "AWS S3 Bucket name for Terraform state"
  default = "ods.terraform.backend.sre.base"
}

variable "dynamodb_table" {
  description = "AWS DynamoDB table for state locking"
  default = "TerraformStatelock_sre_base"
}

variable "key" {
  description = "Key for Terraform state at S3 bucket"
  default = "terraform.tfstate"
}

variable "region" {
  description = "AWS Region"
  default = "us-east-1"
}

variable "program" {
  description = "Program Name for tagging"
  default = "sre"
}

variable "environment" {
  description = "Environment for tagging"
  default = "test"
}