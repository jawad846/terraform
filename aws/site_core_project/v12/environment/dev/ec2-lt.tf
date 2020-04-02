// module "ec2_lt" {
//   source = "../../modules/ec2-instance"

//   ec2_lt_name                 = scp-dev-ec2-lt-asg-content-delivery
//   ec2_lt_description          = "SCP Dev Content Delivery Launch Template for AutoScaling"
//   ec2_lt_image_id             = ami-
//   ec2_lt_instance_type        = "c5.4xlarge"
//   ec2_lt_security_group_ids   = module.dev_ec2_sgs_content_devlivery.security_group_id
//   ec2_lt_iam_instance_profile = module.dev_ec2_iam.ec2_iam_instance_role_name
//   ec2_lt_user_data            = base64encode(data.template_file.ec2_lt_user_data.rendered)
// }

// data "template_file" "ec2_lt_user_data" {
//   template = file("other-files/ec2_lt_user_data.txt")
// }