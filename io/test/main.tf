##################################################### IAM ####################################################################
# --- Create iam roles & policies ---
module "iam" {
  source = "./modules/iam"
}

##################################################### Security Groups #######################################################
# --- Create security groups ---
module "security_groups" {
  source = "./modules/security_groups"
  
  vpc_id            = "${var.vpc_id}"
  vpc_cidr_block    = "${var.vpc_cidr_block}"
}

##################################################### S3 ####################################################################
# --- Create s3 objects ---
module "s3" {
  source = "./modules/s3"
  
  bucket_names                                  = "${var.bucket_names}"
  bucket_name                                   = "${var.bucket_name}"
  chris_test_s3_event_notification_queue_arn    = "${module.sqs.chris_test_s3_event_notification_queue_arn}"
  chris_test_s3_event_notification_queue_2_arn  = "${module.sqs.chris_test_s3_event_notification_queue_2_arn}"
}

##################################################### SQS ####################################################################
# --- Create sqs objects ---
module "sqs" {
  source = "./modules/sqs"
  
  chris_test_s3_event_notification_queue_name   = "${var.sqs_queue_name}"
  chris_test_s3_event_notification_queue_2_name = "${var.sqs_queue_2_name}"
  aws_s3_bucket_my_test_bucket_arn              = "${module.s3.my_test_bucket_arn}"
}

##################################################### SNS ####################################################################
# --- Create sns objects ---
module "sns" {
  source = "./modules/sns"
  
  sns_topic_name = "${var.sns_topic_name}"
}

##################################################### Dynamo DB ##############################################################
# --- Create dynamo objects ---
module "dynamo" {
  source = "./modules/dynamo"
  
  dynamodb_name = "${var.dynamodb_name}"
}

##################################################### Lambda #################################################################
# --- Create dynamo objects ---
module "lambda" {
  source = "./modules/lambda"
}

##################################################### Cloudformation #########################################################
# --- Create cft objects ---
module "cloudformation" {
  source = "./modules/cloudformation"
  
  cft_stack_name = "${var.cft_stack_name}"
  chris_test_topic_from_cft = "${var.chris_test_topic_from_cft}"
  chris_account_list_from_cft = "${var.chris_account_list_from_cft}"
}



/*
# terraform import aws_cloudformation_stack.chris_test_stack chris_test_stack
*/