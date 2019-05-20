// Web Load balancer target group

resource "aws_lb_target_group" "tg_web_alb" {
  name     = "tg-web-alb"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = "${var.alb_vpc}"
  stickiness    = {
      enabled = true
      type = "lb_cookie"
      cookie_duration = "1800"
  }
}


//target group attachment

resource "aws_lb_target_group_attachment" "tg_web_alb_inst_attach" {
    count            = "${var.ec2_count}"
    target_group_arn = "${aws_lb_target_group.tg_web_alb.arn}"
    target_id        = "${element(var.ec2_instance, count.index)}"
    port             = "80"
}
