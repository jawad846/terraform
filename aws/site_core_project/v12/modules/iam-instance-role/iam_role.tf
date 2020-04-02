##########
#IAM ROLE#
##########
resource "aws_iam_role" "iam_role" {
  name                  = var.iam_role_name
  assume_role_policy    = var.iam_role_assume_role_policy
}

###########################
#IAM INSRANCE PROFILE ROLE#
###########################
resource "aws_iam_instance_profile" "ec2_instance_profile_role" {
  name            = var.ec2_instance_profile_role_name
  role            = aws_iam_role.iam_role.name
}

############
#IAM POLICY#
############
resource "aws_iam_policy" "iam_policy" {
  name            = var.name_iam_policy
  path            = var.path_iam_policy
  policy          = var.policy_iam_policy
}

########################
#IAM POLICY ATTACHEMENT#
########################

resource "aws_iam_policy_attachment" "iam_role_policy_attachment" {
  name              = var.iam_role_policy_attachment_role_name
  roles             = [aws_iam_role.iam_role.name]
  policy_arn        = aws_iam_policy.iam_policy.arn
}