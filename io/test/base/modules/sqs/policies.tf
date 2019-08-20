data "template_file" "ods_sre_s3_event_notification_queue_policy" {
  vars={
    queue_name = "${var.ods_sre_s3_event_notification_queue_name}"
    bucket_arn = "${var.aws_s3_bucket_my_test_bucket_arn}"
  }
  
  template = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:$${queue_name}",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "$${bucket_arn}" }
      }
    }
    ,{
        "Effect": "Allow",
        "Principal": {
            "Service": "s3.amazonaws.com"
            },
        "Action": "SNS:Publish",
        "Resource": "arn:aws:sqs:*:*:$${queue_name}",
        "Condition":{
            "ArnLike":{"aws:SourceArn":"$${bucket_arn}"}
        }
    }
    
  ]
}
EOF

}


data "template_file" "ods_sre_s3_event_notification_queue_2_policy" {
  vars={
    queue_name = "${var.ods_sre_s3_event_notification_queue_2_name}"
    bucket_arn = "${var.aws_s3_bucket_my_test_bucket_arn}"
  }
  
  template = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "arn:aws:sqs:*:*:$${queue_name}",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "$${bucket_arn}" }
      }
    }
    ,{
        "Effect": "Allow",
        "Principal": {
            "Service": "s3.amazonaws.com"
            },
        "Action": "SNS:Publish",
        "Resource": "arn:aws:sqs:*:*:$${queue_name}",
        "Condition":{
            "ArnLike":{"aws:SourceArn":"$${bucket_arn}"}
        }
    }
    
  ]
}
EOF

}