resource "aws_iam_user" "s3_user" {
  name = "s3-scp-user"
  path = "/"

  tags = {
    Name             = "s3-scp-user"
    
  }
}

resource "aws_iam_policy" "s3_scp_policy" {
  name = "s3-scp-policy"
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
            "Resource": [
                "arn:aws:s3:::test-scp-copy-file/*",
                "arn:aws:s3:::test-uat-scp-data/*",
                "arn:aws:s3:::test-prd-scp-data/*",
                "arn:aws:s3:::test-dev-scp-data/*",
                "arn:aws:s3:::test-dev-scp-data",
                "arn:aws:s3:::test-prd-scp-data",
                "arn:aws:s3:::test-uat-scp-data",
                "arn:aws:s3:::test-scp-copy-file"
            ]
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

resource "aws_iam_user_policy_attachment" "s3_scp_policy" {
  user       = aws_iam_user.s3_user.name
  policy_arn = aws_iam_policy.s3_scp_policy.arn
}

