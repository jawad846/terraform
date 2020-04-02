resource "aws_autoscaling_group" "asg_scp_cd_server" {
  name                      = var.asg_scp_cd_server
  desired_capacity          = 1
  min_size                  = 1
  max_size                  = 1
  vpc_zone_identifier       = [aws_subnet.sub_app_pvt_1a.id, aws_subnet.sub_app_pvt_1b.id]
  target_group_arns         = [aws_lb_target_group.tg_scp_cd_server.arn]
  health_check_type         = "EC2"
  health_check_grace_period = 120
  enabled_metrics           = ["GroupTotalInstances", "GroupInServiceInstances", "GroupDesiredCapacity"]
  suspended_processes       = ["ReplaceUnhealthy"]
  termination_policies      = ["OldestLaunchTemplate"]
  default_cooldown          = 900
  launch_template {
    id      = aws_launch_template.lt_scp_cd_server.id
    version = "$Latest"
  }

  tag {
    key                 = "AUTOSCALE"
    value               = "YES"
    propagate_at_launch = true
  }
}

#Scaling Policy
resource "aws_autoscaling_policy" "asg_policy_scp_cd_server" {
  name                      = var.asg_scp_cd_server
  policy_type               = "TargetTrackingScaling"
  autoscaling_group_name    = aws_autoscaling_group.asg_scp_cd_server.name
  estimated_instance_warmup = 720
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50
  }
}

// resource "aws_autoscaling_lifecycle_hook" "lyf_asg_scp_cd_server" {
//   name                   = "${var.lyf_asg_scp_cd_server}"
//   autoscaling_group_name = "${aws_autoscaling_group.asg_scp_cd_server.name}"
//   default_result         = "CONTINUE"
//   heartbeat_timeout      = 180
//   lifecycle_transition   = "autoscaling:EC2_INSTANCE_LAUNCHING"
//   notification_metadata = <<EOF
// {
//   "SSM": "Document"
// }
// EOF
// }
