#############################
# EC2 Instance Profile Role #
#############################
module "ec2_iam_instance_profile_role" {
  source = "../../modules/iam-instance-role"

  iam_role_name                           = "ec2-instance-role"
  iam_role_assume_role_policy             = file("other-files/ec2_iam_service_role.json")
  ec2_instance_profile_role_name          = "ec2-instance-profile-role"
  // ec2_instance_profile_role_role          = module.ec2_iam_instance_profile_role.iam_role_name
  name_iam_policy                         = "ec2_s3_instance_policy"
  path_iam_policy                         = "/"
  policy_iam_policy                       = file("other-files/ec2_iam_instance_profile_policy.json")
  iam_role_policy_attachment_role_name    = "ec2_s3_instance_policy_attach"
  // iam_role_policy_attachment_role_role    = [module.ec2_iam_instance_profile_role.iam_role_name]
  // iam_role_policy_attachment_policy_arn   = module.ec2_iam_instance_profile_role.policy_arn
  
}