output "ods_sre_s3_event_notification_queue_arn" {
  value = "${aws_sqs_queue.ods_sre_s3_event_notification_queue.arn}"
}

output "ods_sre_s3_event_notification_queue_2_arn" {
  value = "${aws_sqs_queue.ods_sre_s3_event_notification_queue_2.arn}"
}