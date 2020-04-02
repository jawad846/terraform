############
#IAM POLICY#
############
resource "aws_iam_policy" "iam_policy" {
  name            = var.name_iam_policy
  path            = var.path_iam_policy
  policy          = var.policy_iam_policy
}