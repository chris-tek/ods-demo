##################################################### global #################################################################
variable "vpc_id" {
  description = "ID of the VPC"
  type    = "string"
  default = "vpc-de99a2b8"
}

variable "owner_id" {
  description = "Owner ID for the acct"
  type    = "list"
  default = ["045627890776"]
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type    = "string"
  default = "10.10.0.0/16"
}

##################################################### S3 #####################################################################
variable "bucket_name" {
  description = "Name for the s3 bucket"
  type    = "string"
  default = "chris-ijames-bucket"
}

variable "bucket_names" {
  description = "A list of bucket names"
  default     = {
    1 = "chris-ijames-bucket-123456789"
    2 = "chris-ijames-bucket-234567890"
    3 = "chris-ijames-bucket-345678901"
  }
}

##################################################### SQS ####################################################################
variable "sqs_queue_name" {
  description = "Name for the SQS queue"
  type    = "string"
  default = "chris_test_s3_event_notification_queue"
}

variable "sqs_queue_2_name" {
  description = "Name for the SQS queue"
  type    = "string"
  default = "chris_test_s3_event_notification_queue_2"
}

##################################################### SNS ####################################################################
variable "sns_topic_name" {
  description = "Name for the SNS topic"
  type    = "string"
  default = "chris_ijames_test_topic"
}

##################################################### Dynamo DB ##############################################################
variable "dynamodb_name" {
  description = "Name for the dynamo table"
  type    = "string"
  default = "chris_ijames_test_dynamodb_table"
}