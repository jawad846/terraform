#########
#AWS VPC#
########
resource "aws_vpc" "vpcs" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.vpc_enable_dns_support

  tags = {}
}

#####################
#VPC DHCP Option Set#
#####################

resource "aws_vpc_dhcp_options" "vpc_dhcp_set" {
  domain_name          = var.vpc_dhcp_domain_name
  domain_name_servers  = var.vpc_dhcp_domain_name_servers

  tags = {}
}


############################
#VPC DHCP Option Set Attach#
############################
resource "aws_vpc_dhcp_options_association" "vpc_dhcp_set_acc" {
  vpc_id          = aws_vpc.vpcs.id
  dhcp_options_id = aws_vpc_dhcp_options.vpc_dhcp_set.id
}

