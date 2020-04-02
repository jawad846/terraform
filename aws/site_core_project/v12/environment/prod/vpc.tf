module "dev_vpc" {
  source = "../../modules/vpc"

  vpc_cidr_block               = "10.194.0.0/20"
  enable_dns_hostnames         = true
  vpc_enable_dns_support       = true
  vpc_dhcp_domain_name         = "test.local"
  vpc_dhcp_domain_name_servers = ["10.2.5.10", "10.2.4.10", "AmazonProvidedDNS"]
  aws_az                       = ["ap-south-1a", "ap-south-1b"]
  sub_cidr_block_pub           = ["10.194.0.0/25", "10.194.0.128/25"]
  sub_cidr_block_app_pvt       = ["10.194.1.0/25", "10.194.1.128/25"]
  sub_cidr_block_db_pvt        = ["10.194.2.0/25", "10.194.2.128/25"]
  sub_cidr_block_lb_pvt        = ["10.194.3.0/25", "10.194.3.128/25"]
  sub_cidr_block_lb_pub        = ["10.194.4.0/25", "10.194.4.128/25"]

}