resource "aws_cloudwatch_metric_alarm" "cpu_utilz-web-server" {                        #Web-Server
  alarm_name                = "Web-Server-CPU-Utilization"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "70"
  alarm_description         = "Web-Server-CPU-Utilization"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions {
   InstanceId              = "${aws_instance.web_server.id}"
  }
}

resource "aws_cloudwatch_metric_alarm" "system-status-check-web-server" {
  alarm_name                = "Web-Server-System-Status-Checks-Failed"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "StatusCheckFailed_System"
  namespace                 = "AWS/EC2"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = "1"
  alarm_description         = "Web-server-System-Status-Checks-Failed"
  alarm_actions = [
    "${var.sns_topic}",
    "${var.ec2_action}"
    ]
  dimensions {
    InstanceId = "${aws_instance.web_server.id}"
  }
}



resource "aws_cloudwatch_metric_alarm" "cpu_utilz-app-server" {                 #App-server
  alarm_name                = "App-Server-CPU-Utilization"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "70"
  alarm_description         = "App-Server-CPU-Utilization"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions {
    InstanceId              = "${aws_instance.app_server.id}"
  }
}

resource "aws_cloudwatch_metric_alarm" "system-status-check-app-server" {
  alarm_name                = "App-Server-1a-System-Status-Checks-Failed"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "StatusCheckFailed_System"
  namespace                 = "AWS/EC2"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = "1"
  alarm_description         = "App-Server-System-Status-Checks-Failed"
  alarm_actions = [
    "${var.sns_topic}",
    "${var.ec2_action}"
    ]
  dimensions {
    InstanceId = "${aws_instance.app_server.id}"
  }
}