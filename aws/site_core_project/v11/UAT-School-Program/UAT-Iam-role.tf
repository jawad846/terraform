resource "aws_iam_instance_profile" "ec2_profile_role" {
  name                      = "UAT-School-Program-Instance-Profile-Role"
  role                      = "${aws_iam_role.ec2_instance_role.name}"
}

resource "aws_iam_role" "ec2_instance_role" {
    name                    = "uat-school-program-instance-role"
    path                    = "/"
    
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
    role                    = "${aws_iam_role.ec2_instance_role.name}"
    policy_arn              = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "ssmec2" {
    role                    = "${aws_iam_role.ec2_instance_role.name}"
    policy_arn              = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_role_policy_attachment" "describe-instance" {
  role       = "${aws_iam_role.ec2_instance_role.name}"
  policy_arn = "${var.describe-instance}"
}


####
#S3 policy
resource "aws_iam_role_policy_attachment" "s3_access" {
    role                    = "${aws_iam_role.ec2_instance_role.name}"
    policy_arn              = "${var.s3_scp_ec2_profile_policy}"
}