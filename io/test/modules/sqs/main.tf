resource "aws_sqs_queue" "chris_test_s3_event_notification_queue" {
  name = "${var.chris_test_s3_event_notification_queue_name}"
  policy = "${data.template_file.chris_test_s3_event_notification_queue_policy.rendered}"
  
  tags = {
    Source = "Terraform"
    Name   = "chris_ijames_test_terraform"
    Owner  = "Chris Ijames"
    POC    = "Chris Ijames"
    System = "Chris Ijames"
  }
}

resource "aws_sqs_queue" "chris_test_s3_event_notification_queue_2" {
  name = "${var.chris_test_s3_event_notification_queue_2_name}"
  policy = "${data.template_file.chris_test_s3_event_notification_queue_2_policy.rendered}"

  tags = {
    Source = "Terraform"
    Name   = "chris_ijames_test_terraform"
    Owner  = "Chris Ijames"
    POC    = "Chris Ijames"
    System = "Chris Ijames"
  }
}