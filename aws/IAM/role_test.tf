#Create Cross Account Role

resource "aws_iam_role" "expotest" {
    provider    = "aws.expotest"
    name        = "switch_role_test_account"

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

resource "aws_iam_role_policy_attachment" "read_permission" {
  provider   = "aws.expotest"
  role       = "${aws_iam_role.expotest.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}


#################################################################

resource "aws_iam_role" "res_readonly_test" {
    provider    = "aws.expotest"
    name        = "res_readonly_test"

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

resource "aws_iam_role_policy_attachment" "res_readonly" {
  provider   = "aws.expotest"
  role       = "${aws_iam_role.res_readonly_test.name}"
  policy_arn = "${aws_iam_policy.limited_readonly_test.arn}"
}

#############################################################################