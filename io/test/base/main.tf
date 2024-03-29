##################################################### IAM ####################################################################
# --- Create iam roles & policies ---
module "iam" {
  source = "./modules/iam"
  
  global_tags = var.global_tags
}

##################################################### Security Groups #######################################################
# --- Create security groups ---
module "security_groups" {
  source = "./modules/security_groups"

  vpc_id         = "${var.vpc_id}"
  vpc_cidr_block = "${var.vpc_cidr_block}"
  
  global_tags = var.global_tags
}

##################################################### S3 ####################################################################
# --- Create s3 objects ---
module "s3" {
  source = "./modules/s3"

  bucket_names                              = "${var.bucket_names}"
  bucket_name                               = "${var.bucket_name}"
  ods_sre_s3_event_notification_queue_arn   = "${module.sqs.ods_sre_s3_event_notification_queue_arn}"
  ods_sre_s3_event_notification_queue_2_arn = "${module.sqs.ods_sre_s3_event_notification_queue_2_arn}"

  global_tags = var.global_tags
}

##################################################### SQS ####################################################################
# --- Create sqs objects ---
module "sqs" {
  source = "./modules/sqs"

  ods_sre_s3_event_notification_queue_name   = "${var.sqs_queue_name}"
  ods_sre_s3_event_notification_queue_2_name = "${var.sqs_queue_2_name}"
  aws_s3_bucket_my_test_bucket_arn           = "${module.s3.my_test_bucket_arn}"
  
  global_tags = var.global_tags
}

##################################################### SNS ####################################################################
# --- Create sns objects ---
module "sns" {
  source = "./modules/sns"

  sns_topic_name = "${var.sns_topic_name}"
  global_tags = var.global_tags
}

##################################################### Dynamo DB ##############################################################
# --- Create dynamo objects ---
module "dynamo" {
  source = "./modules/dynamo"

  dynamodb_name = "${var.dynamodb_name}"
  global_tags = var.global_tags
}

##################################################### Lambda #################################################################
# --- Create dynamo objects ---
module "lambda" {
  source = "./modules/lambda"
  
  global_tags = var.global_tags
}

##################################################### Cloudformation #########################################################
# --- Create cft objects ---
module "cloudformation" {
  source = "./modules/cloudformation"

  cft_stack_name                = "${var.cft_stack_name}"
  ods_sre_topic_from_cft        = "${var.ods_sre_topic_from_cft}"
  ods_sre_account_list_from_cft = "${var.ods_sre_account_list_from_cft}"
  
  global_tags = var.global_tags
}



/*
# terraform import aws_cloudformation_stack.ods_sre_stack ods_sre_stack
*/