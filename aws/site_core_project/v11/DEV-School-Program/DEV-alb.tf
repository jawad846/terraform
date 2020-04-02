resource "aws_lb" "ext_alb_scp_cd" {
  name                       = var.ext_alb_scp_cd
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg_pam_citrix_mgmt.id, aws_security_group.sg_ext_alb_scp_cd.id]
  subnets                    = [aws_subnet.sub_lb_pub_1a.id, aws_subnet.sub_lb_pub_1b.id]
  enable_deletion_protection = false

  tags = {
    Name             = var.ext_alb_scp_cd
   
  }
}

resource "aws_lb_listener" "lst_ext_alb_scp_cd_443" {
  load_balancer_arn = aws_lb.ext_alb_scp_cd.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = var.acm_cer_testlocal

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_scp_cd_server.arn
  }
}

resource "aws_lb_listener" "lst_ext_alb_scp_cd_80" {
  load_balancer_arn = aws_lb.ext_alb_scp_cd.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
      path        = "/#{path}"
      host        = "#{host}"
      query       = "#{query}"
    }
  }
}

########################################
resource "aws_lb" "alb_solr_scp" {
  name                       = var.alb_solr_scp
  internal                   = true
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg_alb_solr_scp.id, aws_security_group.sg_pam_citrix_mgmt.id]
  subnets                    = [aws_subnet.sub_lb_pvt_1a.id, aws_subnet.sub_lb_pvt_1b.id]
  enable_deletion_protection = false

  tags = {
    Name             = var.alb_solr_scp
    
  }
}

resource "aws_lb_listener" "lst_alb_solr_scp_8986" {
  load_balancer_arn = aws_lb.alb_solr_scp.arn
  port              = "8986"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = var.acm_cer_testlocal

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_scp_solr_8986.arn
  }
}

resource "aws_lb_listener" "lst_alb_solr_scp_8985" {
  load_balancer_arn = aws_lb.alb_solr_scp.arn
  port              = "8985"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = var.acm_cer_testlocal

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_scp_solr_8985.arn
  }
}

