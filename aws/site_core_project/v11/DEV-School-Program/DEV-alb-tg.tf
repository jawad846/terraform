resource "aws_lb_target_group" "tg_scp_cd_server" {
  name        = var.tg_asg_scp_cd_server
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vpcs.id

  health_check {
    protocol = "HTTP"
    path     = "/"
    port     = "traffic-port"
  }
  tags = {
    Name             = var.tg_asg_scp_cd_server

  }
}

###########################################
resource "aws_lb_target_group" "tg_scp_solr_8986" {
  name        = var.tg_scp_solr_8986
  port        = 8986
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vpcs.id

  health_check {
    protocol = "HTTP"
    path     = "/solr/test_web_index/replication"
    port     = "traffic-port"
  }
  tags = {
    Name             = var.tg_scp_solr_8986
  }
}

//target group attachment

resource "aws_lb_target_group_attachment" "tg_att_scp_solr_8986" {
  target_group_arn = aws_lb_target_group.tg_scp_solr_8986.arn
  target_id        = aws_instance.ec2_solr_master.id
  port             = "8986"
}

############################

resource "aws_lb_target_group" "tg_scp_solr_8985" {
  name        = var.tg_scp_solr_8985
  port        = 8985
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vpcs.id

  health_check {
    protocol = "HTTP"
    path     = "/solr/test_web_index/replication"
    port     = "traffic-port"
  }
  tags = {
    Name             = var.tg_scp_solr_8985
  
  }
}

//target group attachment

resource "aws_lb_target_group_attachment" "tg_att_scp_solr_8985" {
  target_group_arn = aws_lb_target_group.tg_scp_solr_8985.arn
  target_id        = aws_instance.ec2_solr_slave_01.id
  port             = "8985"
}

