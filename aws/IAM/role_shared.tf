
resource "aws_iam_role" "exposhared" {
    provider    = "aws.exposhared"
    name = "switch_role_shared_account"

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

resource "aws_iam_role_policy_attachment" "read_permission_3" {
  provider    = "aws.exposhared"
  role       = "${aws_iam_role.exposhared.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

#####################################################

resource "aws_iam_role" "res_readonly_shared" {
    provider    = "aws.exposhared"
    name = "res_readonly_shared"

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

resource "aws_iam_role_policy_attachment" "res_readonly_shared" {
  provider    = "aws.exposhared"
  role       = "${aws_iam_role.res_readonly_shared.name}"
  policy_arn = "${aws_iam_policy.limited_readonly_shared.arn}"
}