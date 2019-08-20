provider "aws" {
  region = "${var.region}"
}

module "backend" {
  source = "../modules/backend"

  operators      = "${local.operators}"
  bucket         = "${var.bucket}"
  dynamodb_table = "${var.dynamodb_table}"
  key            = "${var.key}"
  program	 	     = "${var.program}"
  environment	   = "${var.environment}"
}