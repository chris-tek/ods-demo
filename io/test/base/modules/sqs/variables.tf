variable "ods_sre_s3_event_notification_queue_name" {
  description = "Name for the s3 event queue"
  type    = "string"
  default = ""
}

variable "ods_sre_s3_event_notification_queue_2_name" {
  description = "Name for the s3 event queue"
  type    = "string"
  default = ""
}

variable "aws_s3_bucket_my_test_bucket_arn" {
  description = "Name for the s3 event queue"
  type    = "string"
  default = ""
}

variable "global_tags"{
  description = "List of global tags"
  type        = map(string)
}