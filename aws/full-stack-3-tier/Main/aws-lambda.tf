data "archive_file" "lyfcycle_lambda" {
  type        = "zip"
  source_file = "asg_lyfcycle_lambda.js"
  output_path = "asg_lyfcycle_lambda.zip"
}

resource "aws_lambda_function" "lyfcycle_lambda" {
  filename         = "${data.archive_file.lyfcycle_lambda.output_path}"
  function_name    = "asg_lyfcyclehook_function"
  role             = "${aws_iam_role.lyfcyhk_lambda.arn}"
  handler          = "lambda.handler"
  source_code_hash = "${base64sha256(file("${data.archive_file.lyfcycle_lambda.output_path}"))}"
  runtime          = "nodejs8.10"
  timeout          = "300"
  environment {
        variables = {
          BACKUP_DIRECTORY  = "/example-data/logs/",
          S3_BUCKET         = "${aws_s3_bucket.example_website_log.bucket_domain_name}",
          SNS_TARGET        = "${aws_sns_topic.asg_notify.arn}",
          SSM_DOCUMENT_NAME = "${aws_ssm_document.life_ssm_command.name}"
        }
  }
}

resource "aws_lambda_permission" "lyfcycle_with_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lyfcycle_lambda.function_name}"
  principal     = "sns.amazonaws.com"
  source_arn    = "${aws_sns_topic.asg_notify.arn}"
}