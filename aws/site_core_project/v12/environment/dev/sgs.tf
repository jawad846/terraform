// module "dev_ec2_sgs_content_devlivery" {
//   source = "../../modules/sgs"
//   name_security_groups
//   vpc_id
//   from_port_sgs_in
//   to_port_sgs_in
//   protocol_sgs_in
//   cidr_blocks_sgs_in
//   from_port_sgs_eg
//   to_port_sgs_eg
//   protocol_sgs_eg
//   cidr_blocks_sgs_eg
// }


#########################################################


module "ec2_sgs_solr_master" {
  source = "../modules/sgs"

  vpc_id                    = "module.dev_vpc.vpc_id"
  name_security_groups      = "ec2_sgs_solr_master"
  ingress_rules             = var.sg_ec2_sgs_solr_master_ingress
  egress_rules              = var.sg_ec2_sgs_solr_master_egress
}

// module "dev_ec2_sgs_content_devlivery" {
//   source = "../../modules/sgs"

//   vpc_id                    = module.dev_vpc.vpc_id
//   name_security_groups  = "scp-dev-sg-ec2-me-south-1-content-delivery"
//   security_groups_ingress   = [
//       {
//         from_port   = 443
//         to_port     = 443
//         protocol    = "tcp"
//         cidr_blocks = ["0.0.0.0/0"]
//       }
//   ]
//   security_groups_egress    = [
//       {
//         from_port   = 0
//         to_port     = 0
//         protocol    = "-1"
//         cidr_blocks = ["0.0.0.0/0"]
//       }
//   ]

// }





// module "dev_ec2_sgs_solr_master" {
//   source = "../../modules/sgs"

//   vpc_id                   = module.dev_vpc.vpc_id
//   name_ec2_security_groups = scp-dev-sg-ec2-me-south-1-solr-master
//   //   ec2_sgs_ingress_from_port         =    
//   //   ec2_sgs_ingress_to_port           =
//   //   ec2_sgs_ingress_protocol          =
//   //   ec2_sgs_ingress_cidr_blocks       =    
//   //   ec2_sgs_ingress_description       =
//   //   ec2_sgs_egress_from_port          =
//   //   ec2_sgs_egress_to_port            =
//   //   ec2_sgs_egress_protocol           =
//   //   ec2_sgs_egress_cidr_blocks        =
//   //   ec2_sgs_egress_description        =

// }

// module "dev_ec2_sgs_solr_slave" {
//   source = "../../modules/sgs"

//   vpc_id                   = module.dev_vpc.vpc_id
//   name_ec2_security_groups = scp-dev-sg-ec2-me-south-1-solr-slave
//   //   ec2_sgs_ingress_from_port         =    
//   //   ec2_sgs_ingress_to_port           =
//   //   ec2_sgs_ingress_protocol          =
//   //   ec2_sgs_ingress_cidr_blocks       =    
//   //   ec2_sgs_ingress_description       =
//   //   ec2_sgs_egress_from_port          =
//   //   ec2_sgs_egress_to_port            =
//   //   ec2_sgs_egress_protocol           =
//   //   ec2_sgs_egress_cidr_blocks        =
//   //   ec2_sgs_egress_description        =

// }

// module "dev_ec2_sgs_content_mgmt" {
//   source = "../../modules/sgs"

//   vpc_id                   = module.dev_vpc.vpc_id
//   name_ec2_security_groups = scp-dev-sg-ec2-me-south-1-content-mgmt
//   //   ec2_sgs_ingress_from_port         =    
//   //   ec2_sgs_ingress_to_port           =
//   //   ec2_sgs_ingress_protocol          =
//   //   ec2_sgs_ingress_cidr_blocks       =    
//   //   ec2_sgs_ingress_description       =
//   //   ec2_sgs_egress_from_port          =
//   //   ec2_sgs_egress_to_port            =
//   //   ec2_sgs_egress_protocol           =
//   //   ec2_sgs_egress_cidr_blocks        =
//   //   ec2_sgs_egress_description        =

// }


// module "dev_ec2_sgs_content_delivery_db" {
//   source = "../../modules/sgs"

//   vpc_id                   = module.dev_vpc.vpc_id
//   name_ec2_security_groups = scp-dev-sg-ec2-me-south-1-content-delivery-db
//   //   ec2_sgs_ingress_from_port         =    
//   //   ec2_sgs_ingress_to_port           =
//   //   ec2_sgs_ingress_protocol          =
//   //   ec2_sgs_ingress_cidr_blocks       =    
//   //   ec2_sgs_ingress_description       =
//   //   ec2_sgs_egress_from_port          =
//   //   ec2_sgs_egress_to_port            =
//   //   ec2_sgs_egress_protocol           =
//   //   ec2_sgs_egress_cidr_blocks        =
//   //   ec2_sgs_egress_description        =

// }

// module "dev_ec2_sgs_content_mgmt_db" {
//   source = "../../modules/sgs"

//   vpc_id                   = module.dev_vpc.vpc_id
//   name_ec2_security_groups = scp-dev-sg-ec2-me-south-1-content-mgmt-db
//   //   ec2_sgs_ingress_from_port         =    
//   //   ec2_sgs_ingress_to_port           =
//   //   ec2_sgs_ingress_protocol          =
//   //   ec2_sgs_ingress_cidr_blocks       =    
//   //   ec2_sgs_ingress_description       =
//   //   ec2_sgs_egress_from_port          =
//   //   ec2_sgs_egress_to_port            =
//   //   ec2_sgs_egress_protocol           =
//   //   ec2_sgs_egress_cidr_blocks        =
//   //   ec2_sgs_egress_description        =

// }


// module "dev_alb_sgs_solr" {
//   source = "../../modules/sgs"

//   vpc_id                   = module.dev_vpc.vpc_id
//   name_ec2_security_groups = scp-dev-sg-alb-me-south-1-solr
//   //   ec2_sgs_ingress_from_port         =    
//   //   ec2_sgs_ingress_to_port           =
//   //   ec2_sgs_ingress_protocol          =
//   //   ec2_sgs_ingress_cidr_blocks       =    
//   //   ec2_sgs_ingress_description       =
//   //   ec2_sgs_egress_from_port          =
//   //   ec2_sgs_egress_to_port            =
//   //   ec2_sgs_egress_protocol           =
//   //   ec2_sgs_egress_cidr_blocks        =
//   //   ec2_sgs_egress_description        =

// }


// module "dev_alb_sgs_cd_ext" {
//   source = "../../modules/sgs"

//   vpc_id                   = module.dev_vpc.vpc_id
//   name_ec2_security_groups = scp-dev-sg-alb-me-south-1-cd-ext
//   //   ec2_sgs_ingress_from_port         =    
//   //   ec2_sgs_ingress_to_port           =
//   //   ec2_sgs_ingress_protocol          =
//   //   ec2_sgs_ingress_cidr_blocks       =    
//   //   ec2_sgs_ingress_description       =
//   //   ec2_sgs_egress_from_port          =
//   //   ec2_sgs_egress_to_port            =
//   //   ec2_sgs_egress_protocol           =
//   //   ec2_sgs_egress_cidr_blocks        =
//   //   ec2_sgs_egress_description        =

// }