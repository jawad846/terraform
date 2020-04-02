// module "ec2-asg-cd-ext" {
//   source                                   = "../../modules/ec2-asg"
//   ec2_asg_name                             = scp-dev-asg-cd
//   ec2_asg_desired_capacity                 = 1
//   ec2_asg_min_size                         = 1
//   ec2_asg_max_size                         = 1
//   ec2_asg_vpc_zone_identifier              = [module.dev_vpc.sub_app_pvt_1a, module.dev_vpc.sub_app_pvt_1b]
//   ec2_asg_target_group_arns                = module.ec2-alb-tgs-cd-ext.aws_lb_target_group_arn
//   ec2_asg_health_check_type                = ELB
//   ec2_asg_health_check_grace_period        = 900
//   ec2_asg_enabled_metrics                  = [GroupTotalInstances, GroupInServiceInstances, GroupDesiredCapacity]
//   ec2_asg_suspended_processes              = [ReplaceUnhealthy]
//   ec2_asg_termination_policies             = [OldestLaunchTemplate]
//   ec2_asg_default_cooldown                 = 300
//   ec2_asg_launch_template_id               = module.ec2_lt.launch_template_id
//   ec2_asg_launch_template_version          = "$Latest"
//   ec2_asg_policy_name                      = scp-dev-asg-cd-cpu
//   ec2_asg_policy_policy_type               = TargetTrackingScaling
//   ec2_asg_policy_estimated_instance_warmup = 900
//   ec2_asg_policy_predefined_metric_type    = ASGAverageCPUUtilization
//   ec2_asg_policy_target_value              = 60
//   ec2_asg_lyf_policy_name                  = scp-dev-asg-lyf-cd
//   ec2_asg_lyf_policy_default_result        = CONTINUE
//   ec2_asg_lyf_policy_heartbeat_timeout     = 180
//   ec2_asg_lyf_policy_lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
// }