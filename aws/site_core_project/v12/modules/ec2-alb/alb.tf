resource "aws_lb" "ec2_alb" {
    name                        = var.ec2_alb_name
    internal                    = var.ec2_alb_face
    load_balancer_type          = var.ec2_alb_load_balancer_type
    security_groups             = var.ec2_alb_security_groups
    subnets                     = var.ec2_alb_subnets
    enable_deletion_protection  = var.ec2_alb_enable_deletion_protection

  tags = {

  }
}


resource "aws_lb_listener" "lst_ec2_alb" {
    load_balancer_arn           = aws_lb.ec2_alb.arn
    port                        = var.lst_ec2_alb_port
    protocol                    = var.lst_ec2_alb_protocol
    ssl_policy                  = var.lst_ec2_alb_ssl_policy
    certificate_arn             = var.lst_ec2_alb_certificate_arn
 
 default_action         {
      type              = var.lst_ec2_alb_default_action_type
      target_group_arn  = aws_lb_target_group.ec2_tgps.arn
  }
}


resource "aws_lb_listener" "lst_ec2_alb_http" {
    load_balancer_arn           = aws_lb.ec2_alb.arn
    port                        = var.lst_ec2_alb_http_port
    protocol                    = var.lst_ec2_alb_http_protocol

    default_action         {
      type              = var.lst_ec2_alb_http_default_action_type
      target_group_arn  = aws_lb_target_group.ec2_tgps.arn
  }
}


resource "aws_lb_listener" "lst_ec2_alb_http_https" {
    load_balancer_arn           = aws_lb.ec2_alb.arn
    port                        = var.lst_ec2_alb_http_https_port
    protocol                    = var.lst_ec2_alb_http_https_protocol
 
 default_action {
      type             = "redirect"
     
    redirect {
      port          = "443"
      protocol      = "HTTPS"
      status_code   = "HTTP_301"
      path          = "/#{path}"
      host          = "#{host}"
      query         = "#{query}"
    }
  }
}