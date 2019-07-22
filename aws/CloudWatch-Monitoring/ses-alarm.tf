# SES Monitoring 

# This Terraform Script will create Bounce Rate and Complaint Rate of the SES Service.

# If you're creating an alarm to monitor your bounce rate, note that Amazon SES recommends that you maintain a bounce rate under 5%. If the bounce rate for your account is greater than 10%, we might automatically pause your account's ability to send email. 

# For this reason, you should configure CloudWatch to raise an alarm when the bounce rate is greater than or equal to 0.05 (5%).

# If you're creating an alarm to monitor your complaint rate, note that Amazon SES recommends that you maintain a complaint rate under 0.1%. If the complaint rate for your account is greater than 0.5%, we might automatically pause your account's ability to send email. For this reason, you should configure CloudWatch to raise an alarm when the complaint rate is greater than or equal to 0.001 (0.1%).

#BounceRate

resource "aws_cloudwatch_metric_alarm" "BounceRate" {
  alarm_name                = "SES-BounceRate"
  alarm_description         = "SES BounceRate crossed the Threshold"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "Reputation.BounceRate"
  namespace                 = "AWS/SES"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "0.05"
  treat_missing_data        = "missing"
  alarm_actions             = ["${var.sns_topic}"]
}

#ComplaintRate

resource "aws_cloudwatch_metric_alarm" "ComplaintRate" {
  alarm_name                = "SES-ComplaintRate"
  alarm_description         = "SES ComplaintRate crossed the Threshold"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "Reputation.ComplaintRate"
  namespace                 = "AWS/SES"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "0.001"
  treat_missing_data        = "missing"
  alarm_actions             = ["${var.sns_topic}"]
}