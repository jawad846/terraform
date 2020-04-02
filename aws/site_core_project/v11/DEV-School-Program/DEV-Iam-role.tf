resource "aws_iam_instance_profile" "ec2_profile_role" {
  name = "DEV-School-Program-Instance-Profile-Role"
  role = aws_iam_role.ec2_instance_role.name
}

resource "aws_iam_role" "ec2_instance_role" {
  name = "dev-school-program-instance-role"
  path = "/"

  assume_role_policy = <<EOF
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

}

resource "aws_iam_policy" "s3_scp_ec2_profile_policy" {
  name = "s3_scp_ec2_profile_policy"
  path = "/"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:ReplicateObject",
                "s3:PutObject",
                "s3:GetObject",
                "s3:RestoreObject",
                "s3:ListBucket",
                "s3:DeleteObject",
                "s3:ReplicateDelete"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets",
                "s3:HeadBucket"
            ],
            "Resource": "*"
        }
    ]
}
EOF

}

resource "aws_iam_policy" "describe-instance" {
  name        = "ec2-describe-instance"
  path        = "/"
  description = "ec2-describe-instance"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
              "ec2:Describe*",
              "kms:EnableKey",
              "kms:Get*",
              "kms:Import*",
              "kms:Decrypt",
              "kms:Generate*",
              "kms:Verify",
              "kms:List*",
              "kms:Describe*",
              "kms:Encrypt",
              "kms:Connect*",
              "kms:Sign",
              "kms:Re*"
            ],
            "Resource": "*"
        }
    ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "ec2readonlyaccess" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "ssmec2" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_role_policy_attachment" "describe-instance" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = aws_iam_policy.describe-instance.arn
}

####
#S3 policy
resource "aws_iam_role_policy_attachment" "s3_access" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = aws_iam_policy.s3_scp_ec2_profile_policy.arn
}

