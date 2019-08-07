#Auto Scaling Group

resource "aws_autoscaling_group" "app-server" {
    name                                = "asg_app_server"
    desired_capacity                    = 0
    min_size                            = 0
    max_size                            = 6
    vpc_zone_identifier                 = ["${aws_subnet.sub_app_1a.id}","${aws_subnet.sub_app_1b.id}"]
    target_group_arns                   = ["${aws_lb_target_group.tg_app_alb_8080.arn}"]
    health_check_type                   = "EC2"
    health_check_grace_period           = 300
    enabled_metrics                     = ["GroupTotalInstances","GroupInServiceInstances","GroupDesiredCapacity"]
    suspended_processes                 = ["ReplaceUnhealthy"]
    default_cooldown                    = 660
    launch_template     {
        id                          = "${aws_launch_template.app-server.id}"
        version                     = "$Latest"
  }
}

#Scaling Policy
resource "aws_autoscaling_policy" "app_policy" {
    name                            = "asp_app_server"
    policy_type                     = "TargetTrackingScaling"
    autoscaling_group_name          = "${aws_autoscaling_group.app-server.name}"
    estimated_instance_warmup       = 600
    target_tracking_configuration {
        predefined_metric_specification {
            predefined_metric_type      = "ASGAverageCPUUtilization"
        }
        target_value                    = 40
    }
}


#######################################

#Auto Scaling Group

resource "aws_autoscaling_group" "web-server" {
    name                                = "asg_web_server"
    desired_capacity                    = 0
    min_size                            = 0
    max_size                            = 4
    vpc_zone_identifier                 = ["${aws_subnet.sub_web_1a.id}","${aws_subnet.sub_web_1b.id}"]
    target_group_arns                   = ["${aws_lb_target_group.tg_web_alb.arn}"]
    health_check_type                   = "EC2"
    health_check_grace_period           = 120
    enabled_metrics                     = ["GroupTotalInstances","GroupInServiceInstances","GroupDesiredCapacity"]
    suspended_processes                 = ["ReplaceUnhealthy"]
    default_cooldown                    = 360
    launch_template     {
        id                          = "${aws_launch_template.web-server.id}"
        version                     = "$Latest"
  }
}

#Scaling Policy
resource "aws_autoscaling_policy" "web_policy" {
    name                            = "asp_web_server"
    policy_type                     = "TargetTrackingScaling"
    autoscaling_group_name          = "${aws_autoscaling_group.web-server.name}"
    estimated_instance_warmup       = 300
    target_tracking_configuration {
        predefined_metric_specification {
            predefined_metric_type      = "ASGAverageCPUUtilization"
        }
        target_value                    = 40
    }
}

######################################
#Lifecycle Hook - App Server

resource "aws_autoscaling_lifecycle_hook" "app-server" {
  name                   = "lyfcycle_app_server"
  autoscaling_group_name = "${aws_autoscaling_group.app-server.name}"
  default_result         = "CONTINUE"
  heartbeat_timeout      = 600
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_TERMINATING"

  notification_target_arn = "${aws_sns_topic_subscription.asg_notify.topic_arn}"
  role_arn                = "${aws_iam_role.asg_lcyhk.arn}"
}

#Lifecycle Hook - Web Server

resource "aws_autoscaling_lifecycle_hook" "web-server" {
  name                   = "lyfcycle_web_server"
  autoscaling_group_name = "${aws_autoscaling_group.web-server.name}"
  default_result         = "CONTINUE"
  heartbeat_timeout      = 600
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_TERMINATING"

  notification_target_arn = "${aws_sns_topic_subscription.asg_notify.topic_arn}"
  role_arn                = "${aws_iam_role.asg_lcyhk.arn}"
}