resource "aws_iam_policy" "limited_readonly_shared" {
    provider   = "aws.exposhared"
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