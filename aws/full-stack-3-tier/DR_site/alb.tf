resource "aws_lb" "web_alb" {
  name      = "albdr-web"
  internal  = false
  ip_address_type = "ipv4"
  load_balancer_type    = "application"
  security_groups       = ["${aws_security_group.sg_web_alb.id}"]
  subnets               = ["${aws_subnet.dr_sub_pub_1a.id}","${aws_subnet.dr_sub_pub_1b.id}"]
  enable_deletion_protection    = true

  # access_logs = {
  #   enabled = true
  #   bucket  = "${aws_s3_bucket.example_website_log.bucket}"
  #   prefix  = "logs/web_dr_alb"
  # }

  tags = {
      Name  = "alb-dr-web"
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
  ssl_policy            = "ELBSecurityPolicy-2016-08"
  certificate_arn       = "${var.https_certificate_arn}"
 
 default_action        = {
      type              = "forward"
      target_group_arn  = "${aws_lb_target_group.tg_web_alb.arn}"
  }

}

// Web Load balancer target group

resource "aws_lb_target_group" "tg_web_alb" {
  name     = "tg-web-alb"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = "${aws_vpc.dr_shared.id}"
  stickiness    = {
      enabled = true
      type = "lb_cookie"
      cookie_duration = "3600"
  }
  health_check = {
      protocol = "HTTP"
      path     = "/web/guest"
      port     = "traffic-port"
      healthy_threshold = "5"
      unhealthy_threshold = "2"
      matcher  = "200,301"
  }
}


//target group attachment

resource "aws_lb_target_group_attachment" "tg_web_alb_inst_attach_1a" {
    target_group_arn = "${aws_lb_target_group.tg_web_alb.arn}"
    target_id        = "${aws_instance.web_server.id}"
    port             = "80"
}


#####################################################################################

resource "aws_lb" "app_alb" {
  name      = "alb-int-dr-app"
  internal  = true
  ip_address_type = "ipv4"
  load_balancer_type    = "application"
  security_groups       = ["${aws_security_group.sg_app_alb.id}"]
  subnets               = ["${aws_subnet.dr_sub_app_1a.id}","${aws_subnet.dr_sub_app_1b.id}"]
  enable_deletion_protection = true

  # access_logs = {
  #   enabled = true
  #   bucket  = "${aws_s3_bucket.example_website_log.bucket}"
  #   prefix  = "logs/app_dr_alb"
  # }

  tags = {
      Name  = "alb-int-dr-app"
      
  }
}


resource "aws_lb_listener" "app_alb_http_listener" {
  load_balancer_arn     = "${aws_lb.app_alb.arn}"
  port                  = "8080"
  protocol              = "HTTP"

  default_action        = {
      type              = "forward"
      target_group_arn  = "${aws_lb_target_group.tg_app_alb_8080.arn}"
  }

}

// Web Load balancer target group

resource "aws_lb_target_group" "tg_app_alb_8080" {
  name     = "tg-app-alb-8080"
  port     = 8080
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = "${aws_vpc.dr_shared.id}"
  stickiness    = {
      enabled = true
      type = "lb_cookie"
      cookie_duration = "3600"
  }
  health_check = {
      protocol = "HTTP"
      path     = "/web/guest"
      port     = "traffic-port"
      healthy_threshold = "5"
      unhealthy_threshold = "2"
      matcher  = "200,301"
  }
}



//target group attachement

resource "aws_lb_target_group_attachment" "tg_app_alb_inst_attach_1a" {
    target_group_arn = "${aws_lb_target_group.tg_app_alb_8080.arn}"
    target_id        = "${aws_instance.app_server.id}"
    port             = "8080"
}

