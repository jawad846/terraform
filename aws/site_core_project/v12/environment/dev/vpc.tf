module "dev_vpc" {
  source = "../../modules/vpc"

  vpc_cidr_block               = "10.10.0.0/20"
  enable_dns_hostnames         = true
  vpc_enable_dns_support       = true
  vpc_dhcp_domain_name         = "sundus.local"
  vpc_dhcp_domain_name_servers = ["10.100.1.10", "10.100.2.10", "AmazonProvidedDNS"]
  aws_az                       = ["ap-south-1a", "ap-south-1b"]
  sub_cidr_block_pub           = ["10.10.0.0/25", "10.10.0.128/25"]
  sub_cidr_block_app_pvt       = ["10.10.1.0/25", "10.10.1.128/25"]
  sub_cidr_block_db_pvt        = ["10.10.2.0/25", "10.10.2.128/25"]
  sub_cidr_block_lb_pvt        = ["10.10.3.0/25", "10.10.3.128/25"]
  sub_cidr_block_lb_pub        = ["10.10.4.0/25", "10.10.4.128/25"]

}