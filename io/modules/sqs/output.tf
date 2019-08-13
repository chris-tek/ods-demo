output "chris_test_s3_event_notification_queue_arn" {
  value = "${aws_sqs_queue.chris_test_s3_event_notification_queue.arn}"
}

output "chris_test_s3_event_notification_queue_2_arn" {
  value = "${aws_sqs_queue.chris_test_s3_event_notification_queue_2.arn}"
}