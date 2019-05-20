# Define our VPC
resource "aws_vpc" "prod" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "prod_vpc"
  }
}