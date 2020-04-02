#########
#AWS VPC#
#########
variable "vpc_cidr_block" {
}


variable "enable_dns_hostnames" {
}

variable "vpc_enable_dns_support" {
}

#####################
#VPC DHCP Option Set#
#####################
variable "vpc_dhcp_domain_name" {
}

variable "vpc_dhcp_domain_name_servers" {
}


############
#VPC Subnet#
############
variable "aws_az" {
  type = list(string)

}

variable "sub_cidr_block_pub" {
  type = list(string)
}

variable "sub_cidr_block_app_pvt" {
  type = list(string)
}

variable "sub_cidr_block_db_pvt" {
  type = list(string)
}

variable "sub_cidr_block_lb_pvt" {
  type = list(string)
}

variable "sub_cidr_block_lb_pub" {
  type = list(string)
}

#####################
#VPC Transit Gateway#
#####################
// variable "vpc_transit_gateway_id" {
// }

// variable "vpc_tgw_subnet_ids" {

// }
