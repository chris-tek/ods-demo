resource "aws_sqs_queue" "ods_sre_s3_event_notification_queue" {
  name = "${var.ods_sre_s3_event_notification_queue_name}"
  policy = "${data.template_file.ods_sre_s3_event_notification_queue_policy.rendered}"
  
  tags = {
    Source = "Terraform"
    Name   = "ods_sre_test_terraform"
    Owner  = "ods-sre"
    POC    = "ods-sre"
    System = "ods-sre"
  }
}

resource "aws_sqs_queue" "ods_sre_s3_event_notification_queue_2" {
  name = "${var.ods_sre_s3_event_notification_queue_2_name}"
  policy = "${data.template_file.ods_sre_s3_event_notification_queue_2_policy.rendered}"

  tags = {
    Source = "Terraform"
    Name   = "ods_sre_test_terraform"
    Owner  = "ods-sre"
    POC    = "ods-sre"
    System = "ods-sre"
  }
}