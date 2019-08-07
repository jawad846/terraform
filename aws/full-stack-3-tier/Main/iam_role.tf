#################################
#EC2 Instance Profile Role
resource "aws_iam_instance_profile" "ec2_profile_role" {
  name = "Websiteprod_Instance_Profile_Role"
  role = "${aws_iam_role.ec2_role.name}"
}

resource "aws_iam_role" "ec2_role" {
    name = "Webprod_Instance_Role"
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

resource "aws_iam_role_policy_attachment" "ssmec2" {
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "${var.policy_ssmec2}"
}

resource "aws_iam_role_policy_attachment" "ec2_lyf_cycle" {
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "${aws_iam_policy.asg_lyf_cycle.arn}"
}

#########################################
#Lifecycle Hook
#Role for lifecycle_hook

resource "aws_iam_role" "asg_lcyhk" {
    name = "lyf_cycle_hook_notification"
    path = "/"
    
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "autoscaling.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "policy_asg" {
  role       = "${aws_iam_role.asg_lcyhk.name}"
  policy_arn = "${var.policy_asg}"
}

resource "aws_iam_role_policy_attachment" "policy_sns" {
  role       = "${aws_iam_role.asg_lcyhk.name}"
  policy_arn = "${var.policy_sns}"
}


###########################
#Role for Lambda function

resource "aws_iam_role" "lyfcyhk_lambda" {
    name = "asg_lyfcycle_hook_lambda"
    path = "/"
    
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#Policy
resource "aws_iam_policy" "asg_lyf_cycle" {
  name = "autoscaling_lyfcycle_hook"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "autoscaling:CompleteLifecycleAction",
        "sns:Publish"
        ],
        "Effect": "Allow",
        "Resource": "*"
    }
  ]
}
EOF
}

#Policy Attachement
resource "aws_iam_role_policy_attachment" "lyf_ssmfull" {
  role       = "${aws_iam_role.lyfcyhk_lambda.name}"
  policy_arn = "${var.policy_ssmfull}"
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = "${aws_iam_role.lyfcyhk_lambda.name}"
  policy_arn = "${var.policy_lambda_basic}"
}

resource "aws_iam_role_policy_attachment" "asg_lyf_cycle" {
  role       = "${aws_iam_role.lyfcyhk_lambda.name}"
  policy_arn = "${aws_iam_policy.asg_lyf_cycle.arn}"
}

##########################
