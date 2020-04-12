
resource "aws_iam_role" "expodev" {
    provider    = "aws.expodev"
    name = "switch_role_dev_account"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::895883787314:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "read_permission_1" {
  provider    = "aws.expodev"
  role       = "${aws_iam_role.expodev.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

#################################################################


resource "aws_iam_role" "res_readonly_dev" {
    provider    = "aws.expodev"
    name = "res_readonly_dev"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::895883787314:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "res_readonly_test" {
  provider    = "aws.expodev"
  role       = "${aws_iam_role.res_readonly_dev.name}"
  policy_arn = "${aws_iam_policy.limited_readonly_dev.arn}"
}
