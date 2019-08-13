variable "bucket_names" {
  description = "A list of bucket names to be created"
  default     = {}
}

variable "bucket_name" {
  description = "Name for the s3 bucket"
  type    = "string"
  default = ""
}

variable "chris_test_s3_event_notification_queue_arn" {
  description = "Name of the sqs queue for the s3 bucket"
  type    = "string"
  default = ""
}

variable "chris_test_s3_event_notification_queue_2_arn" {
  description = "Name of the sqs queue for the s3 bucket"
  type    = "string"
  default = ""
}