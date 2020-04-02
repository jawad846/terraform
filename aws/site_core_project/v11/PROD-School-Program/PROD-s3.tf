resource "aws_s3_bucket" "s3_scp_data" {
  bucket = "${var.s3_bucket_name}"
  acl    = "private"

  tags  {
    Name                    = "${var.s3_bucket_name}"
   
  }
}

####

resource "aws_s3_bucket_policy" "s3_scp_data_policy" {
  bucket = "${aws_s3_bucket.s3_scp_data.id}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "Policy1578480385706",
    "Statement": [
        {
            "Sid": "Stmt1578480384390",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:Get*",
                "s3:Put*",
                "s3:List*"
            ],
            "Resource": "${aws_s3_bucket.s3_scp_data.arn}/*"
        }
    ]
}
POLICY
}