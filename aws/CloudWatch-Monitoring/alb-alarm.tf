resource "aws_cloudwatch_metric_alarm" "web_1a_alb_target_response" {   
  alarm_name                = "alb-webserver-1a-Target-Response-Time"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  threshold                 = "0.6"
  alarm_description         = "alb-webserver-1a-Target-Response-Time"
  metric_name               = "TargetResponseTime"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Average"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions  = {
      LoadBalancer            = "${var.alb_arn_suffix}"
      TargetGroup             = "${var.tg_alb_arn_suffix}"
      AvailabilityZone        = "ap-south-1a"
      }
  }

resource "aws_cloudwatch_metric_alarm" "web_1b_alb_target_response" { 
  alarm_name                = "alb-webserver-1b-Target-Response-Time"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  threshold                 = "0.6"
  alarm_description         = "alb-webserver-1b-Target-Response-Time"
  metric_name               = "TargetResponseTime"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Average"
  unit                      = "Count"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions  = {
      LoadBalancer            = "${var.alb_arn_suffix}"
      TargetGroup             = "${var.tg_alb_arn_suffix}"
      AvailabilityZone        = "ap-south-1b"
      }
  }


resource "aws_cloudwatch_metric_alarm" "web_lb_http_5xx" {  
  alarm_name                = "alb-webserver-ALB-High-HTTP-5XXs"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "HTTPCode_Target_5XX_Count"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Average"
  unit                      = "Count"
  threshold                 = "2"
  alarm_description         = "alb-webserver-ALB-High-HTTP-5XXs"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions = {
    LoadBalancer            = "${var.alb_arn_suffix}"
    TargetGroup             = "${var.tg_alb_arn_suffix}"
  }
}

resource "aws_cloudwatch_metric_alarm" "web_1a_tg_unhealthy" {   
  alarm_name                = "alb-webserver-1a-TG-High-Unhealthy-Hosts"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "UnHealthyHostCount"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Average"
  unit                      = "Count"
  threshold                 = "0"
  alarm_description         = "alb-webserver-1a-TG-High-Unhealthy-Hosts"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions = {
    LoadBalancer            = "${var.alb_arn_suffix}"
    TargetGroup             = "${var.tg_alb_arn_suffix}"
    AvailabilityZone          = "ap-south-1a"
  }
}

resource "aws_cloudwatch_metric_alarm" "web_1b_tg_unhealthy" {  
  alarm_name                = "alb-webserver-1b-TG-High-Unhealthy-Hosts"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "UnHealthyHostCount"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Average"
  unit                      = "Count"
  threshold                 = "0"
  alarm_description         = "alb-webserver-1b-TG-High-Unhealthy-Hosts"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions = {
    LoadBalancer            = "${var.alb_arn_suffix}"
    TargetGroup             = "${var.tg_alb_arn_suffix}"
    AvailabilityZone          = "ap-south-1b"
  }
}