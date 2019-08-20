resource "aws_sns_topic" "my_new_sns_topic" {
  name = "${var.sns_topic_name}"

  tags = {
    Source = "Terraform"
    Name   = "ods_sre_test_terraform"
    Owner  = "ods-sre"
    POC    = "ods-sre"
    System = "ods-sre"
  }
}