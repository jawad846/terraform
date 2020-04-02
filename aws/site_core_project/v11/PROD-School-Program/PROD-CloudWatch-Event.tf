# resource "aws_cloudwatch_event_rule" "asg_init_windows" {
#   name        = "ASG-INIT-SSM-WINDOWS"
#   description = "Find the ASG EC2 Running Instance and Run SSM Doc"

#   event_pattern = <<PATTERN
# {
#   "source": [
#     "aws.elasticloadbalancing"
#   ],
#   "detail-type": [
#     "AWS API Call via CloudTrail"
#   ],
#   "detail": {
#     "eventSource": [
#       "elasticloadbalancing.amazonaws.com"
#     ],
#     "eventName": [
#       "RegisterTargets"
#     ]
#   }
# }
# PATTERN
# }



# resource "aws_cloudwatch_event_target" "tg-asg_init_windows" {
#   target_id     = "TG-ASG-INIT-SSM-WINDOWS"
#   arn           = "${aws_ssm_document.asg_init_windows.arn}"
#   rule          = "${aws_cloudwatch_event_rule.asg_init_windows.name}"
#   role_arn      = "${aws_iam_role.cloudwatch-event-scp-asg-ssm-role.arn}"

#   run_command_targets {
#     key    = "tag:aws:autoscaling:groupName"
#     values = ["DEV-ASG-SCP-CD","UAT-ASG-SCP-CD","PRD-ASG-SCP-CD"]
#   }
# }