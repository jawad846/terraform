resource "aws_iam_instance_profile" "ec2_profile_role" {
  name = "Websitedr_Instance_Profile_Role"
  role = "${aws_iam_role.ec2_role.name}"
}

resource "aws_iam_role" "ec2_role" {
    name = "Webdr_Instance_Role"
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

resource "aws_iam_role_policy_attachment" "ec2readonlyaccess" {
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "${var.policy_ec2readonlyaccess}"
}

resource "aws_iam_role_policy_attachment" "cloudwatchfull" {
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "${var.policy_cloudwatchfull}"
}

resource "aws_iam_role_policy_attachment" "ssmfull" {
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "${var.policy_ssmfull}"
}