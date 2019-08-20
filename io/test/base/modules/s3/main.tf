
# loop through variables and create s3 buckets
resource "aws_s3_bucket" "create_s3_buckets" {
  for_each = var.bucket_names
  
  bucket = each.value
  acl    = "private"

  tags = {
    Source = "Terraform"
    Name   = "ods_sre_test_bucket_${each.value}"
    Owner  = "ods-sre"
    POC    = "ods-sre"
    System = "ods-sre"
  }

  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket" "my_test_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "private"
  
  tags = {
    Source = "Terraform"
    Name   = "ods_sre_test_terraform"
    Owner  = "ods-sre"
    POC    = "ods-sre"
    System = "ods-sre"
  }
  
  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket" "my_test_bucket2" {
  bucket = "${var.bucket_name}"
  acl    = "private"
  
  tags = {
    Source = "Terraform"
    Name   = "ods_sre_test_terraform"
    Owner  = "ods-sre"
    POC    = "ods-sre"
    System = "ods-sre"
  }
  
  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket_object" "folder_123456789" {
  bucket = "${aws_s3_bucket.my_test_bucket.id}"
  acl    = "private"
  key    = "123456789/"
}

resource "aws_s3_bucket_object" "folder_234567890" {
  bucket = "${aws_s3_bucket.my_test_bucket.id}"
  acl    = "private"
  key    = "234567890/"
}

resource "aws_s3_bucket_object" "folder_345678901" {
  bucket = "${aws_s3_bucket.my_test_bucket.id}"
  acl    = "private"
  key    = "345678901/"
}

resource "aws_s3_bucket_notification" "bucket_notifications_for_my_test_bucket" {
  bucket = "${aws_s3_bucket.my_test_bucket.id}"


  queue {
    id            = "upload_event_for_123456789"
    queue_arn     = "${var.ods_sre_s3_event_notification_queue_arn}"
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = "123456789/"
  }

  queue {
    id            = "upload_event_for_234567890"
    queue_arn     = "${var.ods_sre_s3_event_notification_queue_arn}"
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = "234567890/"
  }

  queue {
    id            = "upload_event_for_345678901"
    queue_arn     = "${var.ods_sre_s3_event_notification_queue_2_arn}"
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = "345678901/"
  }
}