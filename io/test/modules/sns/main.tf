resource "aws_sns_topic" "my_new_sns_topic" {
  name = "${var.sns_topic_name}"

  tags = {
    Source = "Terraform"
    Name   = "chris_ijames_test_terraform"
    Owner  = "Chris Ijames"
    POC    = "Chris Ijames"
    System = "Chris Ijames"
  }
}