resource "aws_lb" "web_alb" {
  name                          = "alb-web"
  internal                      = false
  ip_address_type               = "ipv4"
  load_balancer_type            = "application"
  security_groups               = ["${var.sg_web_alb}"]
  subnets                       = ["${var.alb_sub}"]
  enable_deletion_protection    = true

  tags = {
      Name  = "alb-web"
  }
}

resource "aws_lb_listener" "web_alb_http_listener" {
  load_balancer_arn     = "${aws_lb.web_alb.arn}"
  port                  = "80"
  protocol              = "HTTP"

  default_action        = {
      type              = "forward"
      target_group_arn  = "${aws_lb_target_group.tg_web_alb.arn}"
  }

}
resource "aws_lb_listener" "web_alb_https_listener" {
  load_balancer_arn     = "${aws_lb.web_alb.arn}"
  port                  = "443"
  protocol              = "HTTPS"
  ssl_policy            = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn       = "${var.https_certificate_arn}"
 
 default_action        = {
      type              = "forward"
      target_group_arn  = "${aws_lb_target_group.tg_web_alb.arn}"
  }
}

