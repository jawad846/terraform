resource "aws_sns_topic" "asg_notify" {
  name = "asg_notify"
  display_name = "asg_notify"
}

resource "aws_sns_topic_subscription" "asg_notify" {
  topic_arn     = "${aws_sns_topic.asg_notify.arn}"
  protocol      = "lambda"
  endpoint      = "${aws_lambda_function.lyfcycle_lambda.arn}"
}
