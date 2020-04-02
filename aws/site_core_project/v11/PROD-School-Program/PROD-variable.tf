variable "aws_profile" {
}

variable "aws_region" {
}

variable "accepter01_profile" {

}

variable "accepter01_vpc_id" {

}


variable "accepter02_profile" {

}

variable "accepter02_vpc_id" {

}

###########################################################

variable "vpc_cidr" {
}

variable "name_vpc" {
}

variable "name_dhcp_set" {

}


variable "domain_name" {

}

variable "domain_dns_ips_1" {
}

variable "domain_dns_ips_2" {
}

variable "amazon_dns" {
}

variable "transit_id" {

}


variable "az1" {
}

variable "az2" {
}
###############
#Domain

variable "domain_username" {

}

variable "domain_password" {

}

########
variable "name_sub_pub_1a" {
}

variable "sub_pub_1a" {
}

#######

variable "name_sub_pub_1b" {
}

variable "sub_pub_1b" {
}

####

variable "name_sub_app_pvt_1a" {
}

variable "sub_app_pvt_1a" {
}

######

variable "name_sub_app_pvt_1b" {
}

variable "sub_app_pvt_1b" {
}

####

variable "name_sub_db_pvt_1a" {
}

variable "sub_db_pvt_1a" {
}

######

variable "name_sub_db_pvt_1b" {
}

variable "sub_db_pvt_1b" {
}

####

variable "name_sub_lb_pvt_1a" {
}

variable "sub_lb_pvt_1a" {
}

######

variable "name_sub_lb_pvt_1b" {
}

variable "sub_lb_pvt_1b" {
}

####

variable "name_sub_lb_pub_1a" {
}

variable "sub_lb_pub_1a" {
}

######

variable "name_sub_lb_pub_1b" {
}

variable "sub_lb_pub_1b" {
}

#############################################

variable "name_igw" {
}

variable "name_nat_eip" {
}

variable "name_nat_gw" {
}

variable "name_vgw" {
}

#####

variable "name_rt_pub" {
}

variable "name_rt_pvt" {
}

#########

variable "sg_name_content_delivery" {
}

variable "sg_name_solr_master" {
}

variable "sg_name_solr_slave_01" {
}

variable "sg_name_solr_slave_02" {
}

variable "sg_name_content_management_processing" {
}

variable "sg_name_content_delivery_db" {
}

variable "sg_name_content_management_db" {
}

############
variable "windows_ami" {
}

variable "prd_key_pair" {
}

variable "ec2_name_content_delivery" {
}

variable "ec2_type_content_delivery" {
}

variable "host_content_delivery" {
}

variable "ec2_name_solr_master" {
}

variable "ec2_type_solr_master" {
}

variable "host_solr_master" {
}

variable "ec2_name_solr_slave_01" {
}

variable "ec2_type_solr_slave_01" {
}

variable "host_solr_slave_01" {
}

variable "ec2_name_solr_slave_02" {
}

variable "ec2_type_solr_slave_02" {
}

variable "host_solr_slave_02" {
}

variable "ec2_name_content_management_processing" {
}

variable "ec2_type_content_management_processing" {
}

variable "host_content_management_processing" {
}

####################
#RDS

variable "idtfr_content_delivery_db" {
}

variable "host_content_delivery_db" {
}

variable "name_content_delivery_db" {
}

variable "username_content_delivery_db" {
}

variable "password_content_delivery_db" {
}

##

variable "idtfr_content_management_db" {
}

variable "host_content_management_db" {
}

variable "name_content_management_db" {
}

variable "username_content_management_db" {
}

variable "password_content_management_db" {
}

###################


variable "s3_bucket_name" {

}


#####################

variable "rt_accepter01_1" {

}

variable "rt_accepter01_2" {

}

variable "rt_accepter02" {

}

####
variable "sub_mgmt_01" {

}

variable "sub_mgmt_02" {

}

variable "sub_test_01" {

}

variable "sub_test_02" {

}


variable "name_tgw_acceter" {

}

#####

variable "ext_alb_scp_cd" {

}

variable "ext_alb_scp_cm" {

}

variable "tg_ext_alb_scp_cm_https" {

}

variable "tg_ext_alb_scp_cd_https" {

}

variable "alb_solr_scp" {

}


variable "tg_scp_solr_master_8985" {

}

variable "tg_scp_solr_slave1_8986" {

}

variable "tg_scp_solr_slave2_8987" {

}

#############

variable "acm_cer_testlocal" {

}

variable "certificate_path" {

}

variable "certificate_password" {

}

variable "kms_admin_user" {

}


####################

variable "s3_scp_ec2_profile_policy" {
  
}

variable "describe-instance" {
  
}

variable "cloudwatch-event-scp-asg-ssm-role" {
  
}

# ########################
variable "asg_scp_cd_server" {
  
}



variable "lt_scp_cd_server" {
  
}

variable "ami_lt_scp_cd_server" {
  
}

variable "host_asg_content_delivery" {
  
}

variable "ec2_name_asg_content_delivery" {
  
}


variable "lyf_asg_scp_cd_server" {
  
}




