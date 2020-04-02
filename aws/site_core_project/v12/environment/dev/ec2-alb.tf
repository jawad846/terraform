// #######################
// #Internal ALB for Solr#
// #######################
// module "ec2-alb-solr" {
//   source = "../../modules/ec2-alb"

//   ec2_alb_name               = scp-dev-alb-me-south-1-solr-int
//   ec2_alb_face               = internal
//   ec2_alb_load_balancer_type = application
//   ec2_alb_security_groups    = module.dev_alb_sgs_solr.security_group_id
//   ec2_alb_subnets            = [module.dev_vpc.sub_lb_pvt_1a, module.dev_vpc.sub_lb_pvt_1b]
// }

// #Listner#
// module "ec2-alb-lst-solr-master" {
//   source                      = "../../modules/ec2-alb"
//   lst_ec2_alb_port            = 8985
//   lst_ec2_alb_protocol        = HTTPS
//   lst_ec2_alb_ssl_policy      = ELBSecurityPolicy-TLS-1-2-Ext-2018-06
//   lst_ec2_alb_certificate_arn = var.acm_certificate_arn
// }

// module "ec2-alb-lst-solr-slave" {
//   source                      = "../../modules/ec2-alb"
//   lst_ec2_alb_port            = 8986
//   lst_ec2_alb_protocol        = HTTPS
//   lst_ec2_alb_ssl_policy      = ELBSecurityPolicy-TLS-1-2-Ext-2018-06
//   lst_ec2_alb_certificate_arn = var.acm_certificate_arn
// }

// #target Groups#
// module "ec2-alb-tgs-solr-master" {
//   source                              = "../../modules/ec2-alb"
//   ec2_tgps_name                       = scp-dev-alb-tg-solr-master-8985
//   ec2_tgps_port                       = 8985
//   ec2_tgps_protocol                   = HTTP
//   ec2_tgps_target_type                = instance
//   ec2_tgps_vpc_id                     = module.dev_vpc.vpc_id
//   ec2_tgps_health_check_protocol      = HTTP
//   ec2_tgps_health_check_path          = "/solr/index.html"
//   ec2_tgps_health_check_port          = traffic-port
//   ec2_tgps_stickiness_enabled         = false
//   ec2_tgps_stickiness_type            = lb_cookie
//   ec2_tgps_stickiness_cookie_duration = 3600
// }
// #target Groups Attachment#
// module "ec2-alb-tg-attach-solr-master" {
//   source                    = "../../modules/ec2-alb"
//   ec2_tgps_attach_target_id = module.ec2_dev_solr_master.ec2_instance_id
//   ec2_tgps_attach_port      = 8985
// }

// #target Groups#
// module "ec2-alb-tgs-solr-slave" {
//   source                              = "../../modules/ec2-alb"
//   ec2_tgps_name                       = scp-dev-alb-tg-solr-slave-8986
//   ec2_tgps_port                       = 8986
//   ec2_tgps_protocol                   = HTTP
//   ec2_tgps_target_type                = instance
//   ec2_tgps_vpc_id                     = module.dev_vpc.vpc_id
//   ec2_tgps_health_check_protocol      = HTTP
//   ec2_tgps_health_check_path          = "/solr/index.html"
//   ec2_tgps_health_check_port          = traffic-port
//   ec2_tgps_stickiness_enabled         = false
//   ec2_tgps_stickiness_type            = lb_cookie
//   ec2_tgps_stickiness_cookie_duration = 3600
// }
// #target Groups Attachment#
// module "ec2-alb-tg-attach-solr-slave" {
//   source                    = "../../modules/ec2-alb"
//   ec2_tgps_attach_target_id = module.ec2_dev_solr_slave.ec2_instance_id
//   ec2_tgps_attach_port      = 8986
// }



// ###################################
// #External ALB for Content Delivery#
// ###################################
// module "ec2-alb-cd" {
//   source = "../../modules/ec2-alb"

//   ec2_alb_name               = scp-dev-alb-me-south-1-cd-ext
//   ec2_alb_face               = internet-facing
//   ec2_alb_load_balancer_type = application
//   ec2_alb_security_groups    = module.dev_alb_sgs_cd_ext.security_group_id
//   ec2_alb_subnets            = [module.dev_vpc.sub_lb_pub_1a, module.dev_vpc.sub_lb_pub_1b]
// }

// #Listner#
// module "ec2-alb-lst-cd-ext" {
//   source                      = "../../modules/ec2-alb"
//   lst_ec2_alb_port            = 443
//   lst_ec2_alb_protocol        = HTTPS
//   lst_ec2_alb_ssl_policy      = ELBSecurityPolicy-TLS-1-2-Ext-2018-06
//   lst_ec2_alb_certificate_arn = var.acm_certificate_arn
// }

// module "ec2-alb-lst-cd-ext-http" {
//   source                    = "../../modules/ec2-alb"
//   lst_ec2_alb_http_port     = 80
//   lst_ec2_alb_http_protocol = HTTP
// }


// #target Groups#
// module "ec2-alb-tgs-cd-ext" {
//   source                              = "../../modules/ec2-alb"
//   ec2_tgps_name                       = scp-dev-alb-tg-cd-ext
//   ec2_tgps_port                       = 80
//   ec2_tgps_protocol                   = HTTP
//   ec2_tgps_target_type                = instance
//   ec2_tgps_vpc_id                     = module.dev_vpc.vpc_id
//   ec2_tgps_health_check_protocol      = HTTP
//   ec2_tgps_health_check_path          = "/"
//   ec2_tgps_health_check_port          = traffic-port
//   ec2_tgps_stickiness_enabled         = true
//   ec2_tgps_stickiness_type            = lb_cookie
//   ec2_tgps_stickiness_cookie_duration = 3600
// }
// #target Groups Attachment#
// module "ec2-alb-tg-attach-cd-ext" {
//   source                    = "../../modules/ec2-alb"
//   ec2_tgps_attach_target_id = module.ec2_dev_content_delivery.ec2_instance_id
//   ec2_tgps_attach_port      = 80
// }
