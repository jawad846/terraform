resource "aws_cloudwatch_metric_alarm" "cpu_utilz-web-server-1a" {                        #Web-Server-1a
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
  dimensions {
    InstanceId              = "${aws_instance.web_server_1a.id}"
  }
}

#resource "aws_cloudwatch_metric_alarm" "system-status-check-web-server-1a" {
#alarm_name                = "Web-Server-1a-System-Status-Checks-Failed"
#comparison_operator       = "GreaterThanThreshold"
#evaluation_periods        = "2"
#metric_name               = "StatusCheckFailed_System"
#namespace                 = "AWS/EC2"
#period                    = "60"
#statistic                 = "Average"
#threshold                 = "0"
#alarm_description         = "Web-server-1a-System-Status-Checks-Failed"
#alarm_actions = [
# "${var.sns_topic}",
# "${var.ec2_action}"
# ]
#dimensions {
# InstanceId = "${aws_instance.web_server_1a.id}"
# }
#}

resource "aws_cloudwatch_metric_alarm" "cpu_utilz-web-server-1b" {                        #Web-Server-1b
  alarm_name                = "Web-Server-1b-CPU-Utilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "70"
  alarm_description         = "Web-server-1b-CPU-Utilization"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions {
    InstanceId              = "${aws_instance.web_server_1b.id}"
  }
}

# resource "aws_cloudwatch_metric_alarm" "system-status-check-web-server-1b" {
#   alarm_name                = "Web-Server-1b-System-Status-Checks-Failed"
#   comparison_operator       = "GreaterThanThreshold"
#   evaluation_periods        = "2"
#   metric_name               = "StatusCheckFailed_System"
#   namespace                 = "AWS/EC2"
#   period                    = "60"
#   statistic                 = "Maximum"
#   threshold                 = "0"
#   alarm_description         = "Web-Server-1b-System-Status-Checks-Failed"
#   alarm_actions = [
#     "${var.sns_topic}",
#     "${var.ec2_action}"
#     ]
#   dimensions {
#     InstanceId = "${aws_instance.web_server_1b.id}"
#   }
# }

resource "aws_cloudwatch_metric_alarm" "cpu_utilz-app-server-1a" {                 #App-server-1a
  alarm_name                = "App-Server-1a-CPU-Utilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "70"
  alarm_description         = "App-Server-1a-CPU-Utilization"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions {
    InstanceId              = "${aws_instance.app_server_1a.id}"
  }
}

# resource "aws_cloudwatch_metric_alarm" "system-status-check-app-server-1a" {
#   alarm_name                = "App-Server-1a-System-Status-Checks-Failed"
#   comparison_operator       = "GreaterThanThreshold"
#   evaluation_periods        = "2"
#   metric_name               = "StatusCheckFailed_System"
#   namespace                 = "AWS/EC2"
#   period                    = "60"
#   statistic                 = "Maximum"
#   threshold                 = "0"
#   alarm_description         = "App-Server-1a-System-Status-Checks-Failed"
#   alarm_actions = [
#     "${var.sns_topic}",
#     "${var.ec2_action}"
#     ]
#   dimensions {
#     InstanceId = "${aws_instance.app_server_1a.id}"
#   }
# }


resource "aws_cloudwatch_metric_alarm" "cpu_utilz-app-server-1b" {                   #app-server-1b
  alarm_name                = "App-Server-1b-CPU-Utilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "70"
  alarm_description         = "App-Server-1b-Server-CPU-Utilization"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions {
    InstanceId              = "${aws_instance.app_server_1b.id}"
  }
}

# resource "aws_cloudwatch_metric_alarm" "system-status-check-app-server-1b" {
#   alarm_name                = "App-Server-1b-System-Status-Checks-Failed"
#   comparison_operator       = "GreaterThanThreshold"
#   evaluation_periods        = "2"
#   metric_name               = "StatusCheckFailed_System"
#   namespace                 = "AWS/EC2"
#   period                    = "60"
#   statistic                 = "Maximum"
#   threshold                 = "0"
#   alarm_description         = "App-Server-1b-System-Status-Checks-Failed"
#   alarm_actions = [
#     "${var.sns_topic}",
#     "${var.ec2_action}"
#     ]
#   dimensions {
#     InstanceId = "${aws_instance.app_server_1b.id}"
#   }
# }


resource "aws_cloudwatch_metric_alarm" "nfs-server" {                        #nfs server
  alarm_name                = "nfs-server-CPU-Utilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "70"
  alarm_description         = "nfs-server-CPU-Utilization"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions {
    InstanceId              = "${aws_instance.nfs_server.id}"
  }
}

# resource "aws_cloudwatch_metric_alarm" "system_status_check-nfs-server" {
#   alarm_name                = "nfs-server-System-Status-Checks-Failed"
#   comparison_operator       = "GreaterThanThreshold"
#   evaluation_periods        = "2"
#   metric_name               = "StatusCheckFailed_System"
#   namespace                 = "AWS/EC2"
#   period                    = "60"
#   statistic                 = "Maximum"
#   threshold                 = "0"
#   alarm_description         = "nfs-server-System-Status-Checks-Failed"
#   alarm_actions = [
#     "${var.sns_topic}",
#     "${var.ec2_action}"
#     ]
#   dimensions {
#     InstanceId = "${aws_instance.nfs_server.id}"
#   }
# }