

resource "aws_iam_role" "expodx" {
    provider    = "aws.expodx"
    name = "switch_role_dx_account"

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

resource "aws_iam_role_policy_attachment" "read_permission_4" {
  provider    = "aws.expodx"
  role       = "${aws_iam_role.expodx.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}


################################################################



resource "aws_iam_role" "res_readonly_dx" {
    provider    = "aws.expodx"
    name = "res_readonly_dx"

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

resource "aws_iam_role_policy_attachment" "res_readonly_dx" {
  provider    = "aws.expodx"
  role       = "${aws_iam_role.res_readonly_dx.name}"
  policy_arn = "${aws_iam_policy.limited_readonly_dx.arn}"
}