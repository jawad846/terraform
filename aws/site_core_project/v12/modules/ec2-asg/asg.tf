resource "aws_autoscaling_group" "ec2_asg" {
    name                                = var.ec2_asg_name
    desired_capacity                    = var.ec2_asg_desired_capacity
    min_size                            = var.ec2_asg_min_size
    max_size                            = var.ec2_asg_max_size
    vpc_zone_identifier                 = var.ec2_asg_vpc_zone_identifier  
    target_group_arns                   = var.ec2_asg_target_group_arns
    health_check_type                   = var.ec2_asg_health_check_type
    health_check_grace_period           = var.ec2_asg_health_check_grace_period
    enabled_metrics                     = var.ec2_asg_enabled_metrics
    suspended_processes                 = var.ec2_asg_suspended_processes
    termination_policies                = var.ec2_asg_termination_policies 
    default_cooldown                    = var.ec2_asg_default_cooldown
    launch_template     {
        id                          = var.ec2_asg_launch_template_id
        version                     = var.ec2_asg_launch_template_version
    }

    tag {
        key                 = "AUTOSCALE"
        value               = "YES"
        propagate_at_launch = true
  }
}

#Scaling Policy
resource "aws_autoscaling_policy" "ec2_asg_policy" {
    name                            = var.ec2_asg_policy_name
    policy_type                     = var.ec2_asg_policy_policy_type
    autoscaling_group_name          = aws_autoscaling_group.ec2_asg.name
    estimated_instance_warmup       = var.ec2_asg_policy_estimated_instance_warmup
    target_tracking_configuration {
        predefined_metric_specification {
            predefined_metric_type      = var.ec2_asg_policy_predefined_metric_type
        }
        target_value                    = var.ec2_asg_policy_target_value
    }
}


resource "aws_autoscaling_lifecycle_hook" "ec2_asg_lyf_policy" {
  name                   = var.ec2_asg_lyf_policy_name
  autoscaling_group_name = aws_autoscaling_group.ec2_asg.name
  default_result         = var.ec2_asg_lyf_policy_default_result
  heartbeat_timeout      = var.ec2_asg_lyf_policy_heartbeat_timeout
  lifecycle_transition   = var.ec2_asg_lyf_policy_lifecycle_transition

  notification_metadata = <<EOF
{
  "SSM": "Document"
}
EOF
}