#####################
#EC2 Launch Template#
#####################
resource "aws_launch_template" "ec2_lt" {
    name                        = var.ec2_lt_name
    description                 = var.ec2_lt_description
    image_id                    = var.ec2_lt_image_id
    instance_type               = var.ec2_lt_instance_type
    key_name                    = var.ec2_lt_key_name
    vpc_security_group_ids      = var.ec2_lt_security_group_ids
    iam_instance_profile        {
        name            = var.ec2_lt_iam_instance_profile
    }
    user_data               = var.ec2_lt_user_data
    tag_specifications  {
        resource_type = "instance"
            tags = {
        
            }
    }
    tags = {
        
    }
}