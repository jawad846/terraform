resource "aws_lb" "alb_api_test_mobile_example" {
  name      = "${var.name_alb}"
  internal  = false
  ip_address_type = "ipv4"
  load_balancer_type    = "application"
  security_groups       = ["${aws_security_group.sg_alb_api_test_mobile_example.id}"]
  subnets               = ["${var.subnet_1}","${var.subnet_2}"]
  enable_deletion_protection    = true

  tags = {
      Name  = "${var.tag_name_alb}"
      Created = "Jawad"
  }
}

resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn     = "${aws_lb.alb_api_test_mobile_example.arn}"
  port                  = "443"
  protocol              = "HTTPS"
  ssl_policy            = "ELBSecurityPolicy-2016-08"
  certificate_arn       = "${var.arn_certificate}"

  default_action {
      type             = "fixed-response"
     
     fixed_response {
      content_type = "text/plain"
      message_body = "Not Authorized"
      status_code  = "401"
    }
  } 
}

resource "aws_lb_listener_rule" "alb_listener_rule" {
  listener_arn = "${aws_lb_listener.alb_https_listener.arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg_alb_api_test_mobile_1.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/oauth2/*"]
  }
}


resource "aws_lb_listener_rule" "alb_listener_rule_1" {
  listener_arn = "${aws_lb_listener.alb_https_listener.arn}"
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg_alb_api_test_mobile.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/t/expoextdev.local/*"]
  }
}


resource "aws_lb_target_group" "tg_alb_api_test_mobile" {
  name     = "${var.name_alb_tg_1}"
  port     = 8280
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = "${var.aws_vpc_id}"

  health_check = {
      protocol = "HTTP"
      path     = "/services/Version"
      port     = "8280"
      healthy_threshold = "5"
      unhealthy_threshold = "2"
      matcher  = "200"
  }
}


resource "aws_lb_target_group_attachment" "tg-alb-api-test-mobile_az1" {
    target_group_arn = "${aws_lb_target_group.tg_alb_api_test_mobile.arn}"
    target_id        = "${var.alb_tg_1_instance}"
    port             = "8280"
}

resource "aws_lb_target_group_attachment" "tg-alb-api-test-mobile_az2" {
    target_group_arn = "${aws_lb_target_group.tg_alb_api_test_mobile.arn}"
    target_id        = "${var.alb_tg_2_instance}"
    port             = "8280"
}


resource "aws_lb_target_group" "tg_alb_api_test_mobile_1" {
  name     = "${var.name_alb_tg_2}"
  port     = 9443
  protocol = "HTTPS"
  target_type = "instance"
  vpc_id   = "${var.aws_vpc_id}"

  health_check = {
      protocol = "HTTPS"
      path     = "/services/Version"
      port     = "9443"
      healthy_threshold = "5"
      unhealthy_threshold = "2"
      matcher  = "200"
  }
}


resource "aws_lb_target_group_attachment" "tg-alb-api-test-mobile-az-1" {
    target_group_arn = "${aws_lb_target_group.tg_alb_api_test_mobile_1.arn}"
    target_id        = "${var.alb_tg_1_instance}"
    port             = "9443"
}

resource "aws_lb_target_group_attachment" "tg-alb-api-test-mobile-az-2" {
    target_group_arn = "${aws_lb_target_group.tg_alb_api_test_mobile_1.arn}"
    target_id        = "${var.alb_tg_2_instance}"
    port             = "9443"
}