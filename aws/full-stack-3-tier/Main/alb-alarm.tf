resource "aws_cloudwatch_metric_alarm" "web_1a_alb_target_response" {                       #alb-web
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
      LoadBalancer            = "${aws_lb.web_alb.arn_suffix}"
      TargetGroup             = "${aws_lb_target_group.tg_web_alb.arn_suffix}"
      AvailabilityZone        = "ap-south-1a"
      }
  }

resource "aws_cloudwatch_metric_alarm" "web_1b_alb_target_response" {                       #alb-web
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
      LoadBalancer            = "${aws_lb.web_alb.arn_suffix}"
      TargetGroup             = "${aws_lb_target_group.tg_web_alb.arn_suffix}"
      AvailabilityZone        = "ap-south-1b"
      }
  }


resource "aws_cloudwatch_metric_alarm" "web_lb_http_5xx" {                              #alb-web
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
    LoadBalancer              = "${aws_lb.web_alb.arn_suffix}"
    TargetGroup             = "${aws_lb_target_group.tg_web_alb.arn_suffix}"
  }
}

resource "aws_cloudwatch_metric_alarm" "web_1a_tg_unhealthy" {                             #alb-web
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
    LoadBalancer              = "${aws_lb.web_alb.arn_suffix}"
    TargetGroup               = "${aws_lb_target_group.tg_web_alb.arn_suffix}"
    AvailabilityZone          = "ap-south-1a"
  }
}

resource "aws_cloudwatch_metric_alarm" "web_1b_tg_unhealthy" {                             #alb-web
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
    LoadBalancer              = "${aws_lb.web_alb.arn_suffix}"
    TargetGroup               = "${aws_lb_target_group.tg_web_alb.arn_suffix}"
    AvailabilityZone          = "ap-south-1b"
  }
}

###################################################################################################33
resource "aws_cloudwatch_metric_alarm" "app_1a_alb_target_response" {                       #alb-int-app
  alarm_name                = "alb-int-app-1a-Target-Response-Time"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "TargetResponseTime"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "0.6"
  alarm_description         = "alb-int-app-1a-Target-Response-Time"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions = {
    LoadBalancer              = "${aws_lb.app_alb.arn_suffix}"
    TargetGroup               = "${aws_lb_target_group.tg_app_alb_8080.arn_suffix}"
    AvailabilityZone          = "ap-south-1a"

  }
}

resource "aws_cloudwatch_metric_alarm" "app_1b_alb_target_response" {                       #alb-int-app
  alarm_name                = "alb-int-app-1b-Target-Response-Time"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "TargetResponseTime"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "0.6"
  alarm_description         = "alb-int-app-1b-Target-Response-Time"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions = {
    LoadBalancer              = "${aws_lb.app_alb.arn_suffix}"
    TargetGroup               = "${aws_lb_target_group.tg_app_alb_8080.arn_suffix}"
    AvailabilityZone          = "ap-south-1b"

  }
}

resource "aws_cloudwatch_metric_alarm" "app_lb_http_5xx" {                              #alb-int-app
  alarm_name                = "alb-int-app-High-HTTP-5XXs"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "HTTPCode_Target_5XX_Count"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Average"
  unit                      = "Count"
  threshold                 = "1"
  alarm_description         = "alb-int-app-High-HTTP-5XXs"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions = {
    LoadBalancer              = "${aws_lb.app_alb.arn_suffix}"
    TargetGroup               = "${aws_lb_target_group.tg_app_alb_8080.arn_suffix}"
  }
}

resource "aws_cloudwatch_metric_alarm" "app_1a_tg_unhealthy" {                             #alb-int-app
  alarm_name                = "alb-int-app-1a-TG-High-Unhealthy-Hosts"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "UnHealthyHostCount"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  unit                      = "Count"
  statistic                 = "Average"
  threshold                 = "0"
  alarm_description         = "alb-int-app-1a-TG-High-Unhealthy-Hosts"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions = {
    LoadBalancer              = "${aws_lb.app_alb.arn_suffix}"
    TargetGroup               = "${aws_lb_target_group.tg_app_alb_8080.arn_suffix}"
    AvailabilityZone          = "ap-south-1a"
  }
}

resource "aws_cloudwatch_metric_alarm" "app_1b_tg_unhealthy" {                             #alb-int-app
  alarm_name                = "alb-int-app-1b-TG-High-Unhealthy-Hosts"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "UnHealthyHostCount"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  statistic                 = "Average"
  unit                      = "Count"
  threshold                 = "0"
  alarm_description         = "alb-int-app-1b-TG-High-Unhealthy-Hosts"
  alarm_actions             = ["${var.sns_topic}"]
  dimensions = {
    LoadBalancer              = "${aws_lb.app_alb.arn_suffix}"
    TargetGroup               = "${aws_lb_target_group.tg_app_alb_8080.arn_suffix}"
    AvailabilityZone          = "ap-south-1b"
  }
}