resource "aws_sns_topic" "my_new_sns_topic" {
  name = "${var.sns_topic_name}"
  tags = var.global_tags
}