resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
  acl    = var.s3_bucket_acl

  tags  {

  }
}


resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = var.s3_bucket_policy_policy
}