##########
#IAM ROLE#
##########
resource "aws_iam_role" "iam_role" {
  name                  = var.iam_role_name
  assume_role_policy    = var.iam_role_assume_role_policy
}

########################
#IAM POLICY ATTACHEMENT#
########################

resource "aws_iam_policy_attachment" "iam_role_policy_attachment" {
  name              = var.iam_role_policy_attachment_role_name
  roles             = var.iam_role_policy_attachment_role_role
  policy_arn        = var.iam_role_policy_attachment_policy_arn
}