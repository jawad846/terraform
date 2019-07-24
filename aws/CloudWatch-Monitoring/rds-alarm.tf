resource "aws_cloudwatch_metric_alarm" "fb_web_db_free_space" {
  alarm_name                = "fb_web_db-RDS-Free­Storage­Space"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "Free­Storage­Space"
  namespace                 = "AWS/RDS"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "10000000000"
  alarm_description         = "fb_web_db-RDS-Free­Storage­Space"
  alarm_actions = ["${var.sns_topic}"]
  dimensions {
    DBInstanceIdentifier = "${aws_db_instance.fb_web_db.identifier}"
  }
}

resource "aws_cloudwatch_metric_alarm" "fb_web_db_free_memory" {
  alarm_name                = "fb_web_db-RDS-Freeable­Memory"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "1" #datapoint
  metric_name               = "Freeable­Memory"
  namespace                 = "AWS/RDS"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "4000000000"
  alarm_description         = "fb_web_db-RDS-Freeable­Memory"
  alarm_actions = ["${var.sns_topic}"]
  dimensions {
    DBInstanceIdentifier = "${aws_db_instance.fb_web_db.identifier}"
  }
}

resource "aws_cloudwatch_metric_alarm" "fb_web_db_CPUUtilization" {
  alarm_name                = "fb_web_db-RDS-CPUUtilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/RDS"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "70"
  alarm_description         = "fb_web_db-RDS-CPUUtilization"
  alarm_actions = ["${var.sns_topic}"]
  dimensions {
    DBInstanceIdentifier = "${aws_db_instance.fb_web_db.identifier}"
  }
}
