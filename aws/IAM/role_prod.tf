
resource "aws_iam_role" "expoprod" {
    provider    = "aws.expoprod"
    name = "switch_role_prod_account"

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

resource "aws_iam_role_policy_attachment" "read_permission_2" {
  provider    = "aws.expoprod"
  role       = "${aws_iam_role.expoprod.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

##############################################################


resource "aws_iam_role" "res_readonly_prod" {
    provider    = "aws.expoprod"
    name = "res_readonly_prod"

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

resource "aws_iam_role_policy_attachment" "res_readonly_prod" {
  provider    = "aws.expoprod"
  role       = "${aws_iam_role.res_readonly_prod.name}"
  policy_arn = "${aws_iam_policy.limited_readonly_prod.arn}"
}