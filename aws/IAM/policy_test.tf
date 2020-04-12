resource "aws_iam_policy" "sts_assumerole" {
    provider   = "aws.expotest"
    name        = "sts_AssumeRole"
    description = "Policy For STS Assume Role"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::*:role/*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "iam:DeleteVirtualMFADevice",
                "iam:CreateVirtualMFADevice",
                "iam:ChangePassword"
            ],
            "Resource": [
                "arn:aws:iam::*:user/*",
                "arn:aws:iam::*:sms-mfa/*",
                "arn:aws:iam::*:mfa/*/*"
            ]
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": "iam:ListVirtualMFADevices",
            "Resource": "*"
        }
    ]
}
EOF
}

##############################################################

# Read Only Policy
resource "aws_iam_policy" "limited_readonly_test" {
    provider   = "aws.expotest"
    name        = "res_readonly"
    description = "Policy For Restricted Read only for Role"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "rds:Describe*",
                "ec2:Get*",
                "lambda:GetFunctionConfiguration",
                "rds:DownloadDBLogFilePortion",
                "ec2:Describe*",
                "ec2:Get*",
                "ec2:List*",
                "lambda:List*",
                "lambda:GetAlias",
                "lambda:GetEventSourceMapping",
                "ec2:ExportClientVpnClientCertificateRevocationList",
                "rds:List*",
                "ec2:ExportClientVpnClientConfiguration",
                "ec2:Search*",
                "cloudwatch:List*",
                "cloudwatch:Get*",
                "cloudwatch:Describe*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
EOF
}