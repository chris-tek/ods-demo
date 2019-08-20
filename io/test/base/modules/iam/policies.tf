resource "aws_iam_policy" "test_policy" {
  name = "ods_sre_dev_policy"

  policy = <<-EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": [
                    "autoscaling:*",
                    "cloudwatch:*",
                    "cloudformation:CreateUploadBucket",
                    "cloudformation:ValidateTemplate",
                    "dynamodb:*",
                    "ec2:AllocateAddress",
                    "ec2:AssignPrivateIpAddresses",
                    "ec2:AssociateAddress",
                    "ec2:AttachNetworkInterface",
                    "ec2:AttachVolume",
                    "ec2:BundleInstance",
                    "ec2:CancelBundleTask",
                    "ec2:CancelExportTask",
                    "ec2:CreateInstanceExportTask",
                    "ec2:CreateKeyPair",
                    "ec2:CreateNetworkInterface",
                    "ec2:CreatePlacementGroup",
                    "ec2:CreateVolume",
                    "ec2:DeleteKeyPair",
                    "ec2:DeleteNetworkInterface",
                    "ec2:DeletePlacementGroup",
                    "ec2:DeleteVolume",
                    "ec2:DetachNetworkInterface",
                    "ec2:DetachVolume",
                    "ec2:DisassociateAddress",
                    "ec2:EnableVolumeIO",
                    "ec2:ImportKeyPair",
                    "ec2:ModifyVolume",
                    "ec2:ModifyVolumeAttribute",
                    "ec2:MonitorInstances",
                    "ec2:ReleaseAddress",
                    "ec2:ReportInstanceStatus",
                    "ec2:UnassignPrivateIpAddresses",
                    "ec2:UnmonitorInstances",
                    "ec2:AttachNetworkInterface",
                    "ec2:ModifyNetworkInterfaceAttribute",
                    "ec2:ModifyInstanceAttribute",
                    "ec2:ResetInstanceAttribute",
                    "ec2:ResetNetworkInterfaceAttribute",
                    "elasticache:*",
                    "elasticloadbalancing:*",
                    "iam:DeleteServerCertificate",
                    "iam:UpdateServerCertificate",
                    "iam:UploadServerCertificate",
                    "kms:ReEncrypt*",
                    "kms:Decrypt",
                    "kms:Encrypt",
                    "sns:*",
                    "sqs:*"
                ],
                "Resource": "*",
                "Effect": "Allow"
            },
            {
                "Action": "ec2:RunInstances",
                "Resource": [
                    "arn:aws:ec2:*::image/*",
                    "arn:aws:ec2:*:*:subnet/*",
                    "arn:aws:ec2:*:*:key-pair/*",
                    "arn:aws:ec2:*:*:instance/*",
                    "arn:aws:ec2:*:*:volume/*",
                    "arn:aws:ec2:*:*:security-group/*",
                    "arn:aws:ec2:*:*:network-interface/*"
                ],
                "Effect": "Allow"
            },
            {
                "Action": "ec2:CreateTags",
                "Resource": [
                    "arn:aws:ec2:*:*:instance/*"
                ],
                "Effect": "Allow",
                "Condition": {
                    "StringLike": {
                        "ec2:CreateAction": "RunInstances"
                    }
                }
            },
            {
                "Action": "ec2:CreateTags",
                "Resource": [
                    "arn:aws:ec2:*:*:volume/*",
                    "arn:aws:ec2:*::snapshot/*"
                ],
                "Effect": "Allow"
            },
            {
                "Action": "s3:*",
                "Resource": "arn:aws:s3:::cf-templates-*/*",
                "Effect": "Allow"
            },
            {
                "Action": [
                    "s3:PutBucketPolicy",
                    "s3:DeleteBucketPolicy"
                ],
                "Resource": "*",
                "Effect": "Deny"
            }
        ]
    }
    EOF
}