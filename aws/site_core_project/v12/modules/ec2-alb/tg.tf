
resource "aws_lb_target_group" "ec2_tgps" {
    name                        = var.ec2_tgps_name
    port                        = var.ec2_tgps_port
    protocol                    = var.ec2_tgps_protocol
    target_type                 = var.ec2_tgps_target_type
    vpc_id                      = var.ec2_tgps_vpc_id

  health_check  {
      protocol              = var.ec2_tgps_health_check_protocol
      path                  = var.ec2_tgps_health_check_path
      port                  = var.ec2_tgps_health_check_port
  }
  stickiness    {
        enabled             = var.ec2_tgps_stickiness_enabled
        type                = var.ec2_tgps_stickiness_type
        cookie_duration     = var.ec2_tgps_stickiness_cookie_duration
  }
}



resource "aws_lb_target_group_attachment" "ec2_tgps_attach" {
    target_group_arn            = aws_lb_target_group.ec2_tgps.arn
    target_id                   = var.ec2_tgps_attach_target_id
    port                        = var.ec2_tgps_attach_port
}