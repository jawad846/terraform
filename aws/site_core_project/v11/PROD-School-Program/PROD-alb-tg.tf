resource "aws_lb_target_group" "tg_scp_solr_master_8985" {
    name                        = "${var.tg_scp_solr_master_8985}"
    port                        = 8985
    protocol                    = "HTTP"
    target_type                 = "instance"
    vpc_id                      = "${aws_vpc.vpcs.id}"

  health_check  {
      protocol              = "HTTP"
      path                  = "/solr/test_web_index/replication"
      port                  = "traffic-port"
  }
}


//target group attachment

resource "aws_lb_target_group_attachment" "tg_att_scp_solr_master_8985" {
    target_group_arn            = "${aws_lb_target_group.tg_scp_solr_master_8985.arn}"
    target_id                   = "${aws_instance.ec2_solr_master.id}"
    port                        = "8985"
}


############################

resource "aws_lb_target_group" "tg_scp_solr_slave1_8986" {
    name                        = "${var.tg_scp_solr_slave1_8986}"
    port                        = 8986
    protocol                    = "HTTP"
    target_type                 = "instance"
    vpc_id                      = "${aws_vpc.vpcs.id}"

  health_check  {
      protocol              = "HTTP"
      path                  = "/solr/index.html"
      port                  = "traffic-port"
  }
}


//target group attachment

resource "aws_lb_target_group_attachment" "tg_att_scp_solr_slave1_8986" {
    target_group_arn            = "${aws_lb_target_group.tg_scp_solr_slave1_8986.arn}"
    target_id                   = "${aws_instance.ec2_solr_slave_01.id}"
    port                        = "8986"
}

resource "aws_lb_target_group_attachment" "tg_att_scp_solr_slave2_8986" {
    target_group_arn            = "${aws_lb_target_group.tg_scp_solr_slave1_8986.arn}"
    target_id                   = "${aws_instance.ec2_solr_slave_02.id}"
    port                        = "8986"
}

#######################

# resource "aws_lb_target_group" "tg_scp_solr_slave2_8987" {
#     name                        = "${var.tg_scp_solr_slave2_8987}"
#     port                        = 8987
#     protocol                    = "HTTP"
#     target_type                 = "instance"
#     vpc_id                      = "${aws_vpc.vpcs.id}"

#   health_check  {
#       protocol              = "HTTP"
#       path                  = "/solr/test_web_index/replication"
#       port                  = "traffic-port"
#   }
# }


# //target group attachment

# resource "aws_lb_target_group_attachment" "tg_att_scp_solr_slave2_8987" {
#     target_group_arn            = "${aws_lb_target_group.tg_scp_solr_slave2_8987.arn}"
#     target_id                   = "${aws_instance.ec2_solr_slave_02.id}"
#     port                        = "8987"
# }


###################################################################################################################################


resource "aws_lb_target_group" "tg_ext_alb_scp_cm" {
    name                        = "${var.tg_ext_alb_scp_cm_https}"
    port                        = 80
    protocol                    = "HTTP"
    target_type                 = "instance"
    vpc_id                      = "${aws_vpc.vpcs.id}"

  health_check  {
      protocol              = "HTTP"
      path                  = "/"
      port                  = "traffic-port"
  }
}


//target group attachment

resource "aws_lb_target_group_attachment" "tg_att_ext_alb_scp_cm" {
    target_group_arn            = "${aws_lb_target_group.tg_ext_alb_scp_cm.arn}"
    target_id                   = "${aws_instance.ec2_content_management_processing.id}"
    port                        = "80"
}


# ############################


resource "aws_lb_target_group" "tg_ext_alb_scp_cd" {
    name                        = "${var.tg_ext_alb_scp_cd_https}"
    port                        = 80
    protocol                    = "HTTP"
    target_type                 = "instance"
    vpc_id                      = "${aws_vpc.vpcs.id}"

  health_check  {
      protocol              = "HTTP"
      path                  = "/"
      port                  = "traffic-port"
  }
}


//target group attachment

# resource "aws_lb_target_group_attachment" "tg_att_ext_alb_scp_cd" {
#     target_group_arn            = "${aws_lb_target_group.tg_ext_alb_scp_cd.arn}"
#     target_id                   = "${aws_instance.ec2_content_delivery.id}"
#     port                        = "80"
# }
