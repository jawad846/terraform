resource "aws_iam_instance_profile" "ec2_profile_role" {
  name = "PRD_School_Program_Instance_Profile_Role"
  role = "${aws_iam_role.ec2_instance_role.name}"
}

resource "aws_iam_role" "ec2_instance_role" {
  name = "prd_school_program_instance_role"
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
  role       = "${aws_iam_role.ec2_instance_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "ssmec2" {
  role       = "${aws_iam_role.ec2_instance_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_role_policy_attachment" "describe-instance" {
  role       = "${aws_iam_role.ec2_instance_role.name}"
  policy_arn = "${var.describe-instance}"
}


resource "aws_iam_role_policy_attachment" "s3_access" {
    role                    = "${aws_iam_role.ec2_instance_role.name}"
    policy_arn              = "${var.s3_scp_ec2_profile_policy}"
}
##############################

resource "aws_iam_role" "s3sqlbackup" {
  name = "prod-s3sqlbackup"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "rds.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags  {
    Name             = "${var.name_content_delivery_db}"
    
  }
}

resource "aws_iam_policy" "s3-sql-backup" {
    name        = "s3sqlbackup"
    path        = "/"
    description = "s3sqlbackup"
    policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Action":[
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:ListAllMyBuckets",
        "s3:ListBucket",
        "s3:PutObject",
        "s3:AbortMultipartUpload",
        "s3:ListMultipartUploadParts",
        "s3:GetObjectMetaData"
        ],
        "Effect":"Allow",
        "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3sqlbackup" {
  role       = "${aws_iam_role.s3sqlbackup.name}"
  policy_arn = "${aws_iam_policy.s3-sql-backup.arn}"
}

# #################################################
# resource "aws_iam_role" "cloudwatch-event-scp-asg-ssm-role" {
#   name = "cloudwatch-event-scp-asg-ssm-role"
#   path = "/service-role/"
  

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "events.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
#   tags  {
#     Name             = "cloudwatch_event_ssm_runcommand"
#     
#   }
# }


# resource "aws_iam_role_policy_attachment" "cloudwatch_event_ec2" {
#   role       = "${aws_iam_role.cloudwatch-event-scp-asg-ssm-role.name}"
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
# }

# resource "aws_iam_role_policy_attachment" "cloudwatch_event_ssm" {
#   role       = "${aws_iam_role.cloudwatch-event-scp-asg-ssm-role.name}"
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
# }

# resource "aws_iam_role_policy_attachment" "cloudwatch_event_cloudwatch" {
#   role       = "${aws_iam_role.cloudwatch-event-scp-asg-ssm-role.name}"
#   policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
# }