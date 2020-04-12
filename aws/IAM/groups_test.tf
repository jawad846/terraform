# Read Only Access Group
resource "aws_iam_group" "sts_access" {
  provider  = "aws.expotest"
  name      = "sts_access"
  path      = "/"
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  provider   = "aws.expotest"
  group      = "${aws_iam_group.sts_access.name}"
  policy_arn = "${aws_iam_policy.sts_assumerole.arn}"
}


