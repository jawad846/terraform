resource "aws_cloudwatch_metric_alarm" "cpu_utilz-web-server" {    
  alarm_name                = "Web-Server-1a-CPU-Utilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "70"
  alarm_description         = "Web-Server-1a-CPU-Utilization"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions  = [
    {
        "Name"  = "InstanceId"
        "Value" = "${var.aws_instanceid}"
    }
]
}

resource "aws_cloudwatch_metric_alarm" "system-status-check-web-server" {
alarm_name                = "Web-Server-1a-System-Status-Checks-Failed"
comparison_operator       = "GreaterThanThreshold"
evaluation_periods        = "2"
metric_name               = "StatusCheckFailed_System"
namespace                 = "AWS/EC2"
period                    = "60"
statistic                 = "Average"
threshold                 = "0"
alarm_description         = "Web-server-1a-System-Status-Checks-Failed"
alarm_actions = [
    "${var.sns_topic}",
    "${var.awsec2_action}"
]
dimensions  = [
    {
        "Name"  = "InstanceId"
        "Value" = "${var.aws_instanceid}"
    }
]
}