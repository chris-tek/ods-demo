/*
resource "aws_iam_role" "test_role" {
  name = "ods_sre_role"

  assume_role_policy = <<-EOF
          {
            "Version": "2012-10-17",
            "Statement": [
              {
                "Action": "sts:AssumeRole",
                "Principal": {
                  "Service": "ec2.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": ""
              }
            ]
          }
      EOF
      
  tags = var.global_tags
}


resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "${aws_iam_role.test_role.name}"
  policy_arn = "${aws_iam_policy.test_policy.arn}"
}
*/