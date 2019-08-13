/*
resource "aws_iam_role" "test_role" {
  name = "chris_test_role"

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
      
  tags = {
    Source = "Terraform"
    Name   = "chris_ijames_test_terraform"
    Owner  = "Chris Ijames"
    POC    = "Chris Ijames"
    System = "Chris Ijames"
  }
}


resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "${aws_iam_role.test_role.name}"
  policy_arn = "${aws_iam_policy.test_policy.arn}"
}
*/