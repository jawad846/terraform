resource "aws_s3_bucket" "example_website_log" {
  bucket = "prodweb.log.exampleeralbank.co.in"
  acl    = "log-delivery-write"

  tags = {
    Name        = "prodweb.log.exampleeralbank.co.in"
    Environment = "Prod"
    
  }
}
  
resource "aws_s3_bucket_policy" "example_website_bucket_policy" {
  bucket = "${aws_s3_bucket.example_website_log.id}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "AWSConsole-AccessLogs-Policy-1552632736366",
    "Statement": [
        {
            "Sid": "AWSConsoleStmt-1552632736366",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::718504428378:root"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::prodweb.log.exampleeralbank.co.in/*"
        },
        {
            "Sid": "AWSLogDeliveryWrite",
            "Effect": "Allow",
            "Principal": {
                "Service": "delivery.logs.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::prodweb.log.exampleeralbank.co.in/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        },
        {
            "Sid": "AWSLogDeliveryAclCheck",
            "Effect": "Allow",
            "Principal": {
                "Service": "delivery.logs.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::prodweb.log.exampleeralbank.co.in"
        }
    ]
}
POLICY
}