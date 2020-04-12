
resource "aws_iam_role" "expomgmt" {
    provider    = "aws.expomgmt"
    name = "switch_role_mgmt_account"

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

resource "aws_iam_role_policy_attachment" "read_permission_5" {
  provider    = "aws.expomgmt"
  role       = "${aws_iam_role.expomgmt.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

########################################################


resource "aws_iam_role" "res_readonly_mgmt" {
    provider    = "aws.expomgmt"
    name = "res_readonly_mgmt"

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

resource "aws_iam_role_policy_attachment" "res_readonly_mgmt" {
  provider    = "aws.expomgmt"
  role       = "${aws_iam_role.res_readonly_mgmt.name}"
  policy_arn = "${aws_iam_policy.limited_readonly_mgmt.arn}"
}
