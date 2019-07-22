variable "profile" {
  description = "Define the profile here"
}

variable "region" {
  description = "Define the region here"
}

variable "sns_topic" {
  description = "define the SNS topic ARN here to send notification"
}

variable "alb_arn_suffix" {
  description = "Define the ALB ARN suffix here"
}

variable "tg_alb_arn_suffix" {
  description = "define above Target group ARN suffix here"
}

variable "aws_instanceid" {
  description = "define EC2 instance id here"
}

variable "awsec2_action" {
  description = "Define the ec2 action for StatusCheckFailed_System"
}






