# Define our VPC
resource "aws_vpc" "vpcs" {
  cidr_block                = "${var.vpc_cidr}"
  enable_dns_hostnames      = true

  tags  {
    Name                    = "${var.name_vpc}"

  }

}

#VPC DHCP Option Set

resource "aws_vpc_dhcp_options" "vpc_dhcp_set" {
  domain_name          = "${var.domain_name}"
  domain_name_servers  = ["${var.domain_dns_ips_1}","${var.amazon_dns}"]

  tags  {
    Name                    = "${var.name_dhcp_set}"

  }
}

resource "aws_vpc_dhcp_options_association" "vpc_dhcp_set_acc" {
  vpc_id          = "${aws_vpc.vpcs.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.vpc_dhcp_set.id}"
}


# Define the public subnet 1
resource "aws_subnet" "sub_pub_1a" {
  vpc_id                  = "${aws_vpc.vpcs.id}"
  cidr_block              = "${var.sub_pub_1a}"
  availability_zone       = "${var.az1}"

  tags  {
    Name = "${var.name_sub_pub_1a}"

  }
}

# Define the public subnet 2
resource "aws_subnet" "sub_pub_1b" {
  vpc_id                  = "${aws_vpc.vpcs.id}"
  cidr_block              = "${var.sub_pub_1b}"
  availability_zone       = "${var.az2}"

  tags  {
    Name = "${var.name_sub_pub_1b}"

  }
}

# Define the private subnet 01
resource "aws_subnet" "sub_app_pvt_1a" {
  vpc_id                  = "${aws_vpc.vpcs.id}"
  cidr_block              = "${var.sub_app_pvt_1a}"
  availability_zone       = "${var.az1}"

  tags  {
    Name = "${var.name_sub_app_pvt_1a}"

  }
}

resource "aws_subnet" "sub_app_pvt_1b" {
  vpc_id                  = "${aws_vpc.vpcs.id}"
  cidr_block              = "${var.sub_app_pvt_1b}"
  availability_zone       = "${var.az2}"

  tags  {
    Name = "${var.name_sub_app_pvt_1b}"

  }
}

######

resource "aws_subnet" "sub_db_pvt_1a" {
  vpc_id                  = "${aws_vpc.vpcs.id}"
  cidr_block              = "${var.sub_db_pvt_1a}"
  availability_zone       = "${var.az1}"

  tags  {
    Name = "${var.name_sub_db_pvt_1a}"

  }
}


resource "aws_subnet" "sub_db_pvt_1b" {
  vpc_id                  = "${aws_vpc.vpcs.id}"
  cidr_block              = "${var.sub_db_pvt_1b}"
  availability_zone       = "${var.az2}"

  tags  {
    Name = "${var.name_sub_db_pvt_1b}"

  }
}

#######

resource "aws_subnet" "sub_lb_pvt_1a" {
  vpc_id                  = "${aws_vpc.vpcs.id}"
  cidr_block              = "${var.sub_lb_pvt_1a}"
  availability_zone       = "${var.az1}"

  tags  {
    Name = "${var.name_sub_lb_pvt_1a}"

  }
}


resource "aws_subnet" "sub_lb_pvt_1b" {
  vpc_id                  = "${aws_vpc.vpcs.id}"
  cidr_block              = "${var.sub_lb_pvt_1b}"
  availability_zone       = "${var.az2}"

  tags  {
    Name = "${var.name_sub_lb_pvt_1b}"

  }
}

#######

resource "aws_subnet" "sub_lb_pub_1a" {
  vpc_id                  = "${aws_vpc.vpcs.id}"
  cidr_block              = "${var.sub_lb_pub_1a}"
  availability_zone       = "${var.az1}"

  tags  {
    Name = "${var.name_sub_lb_pub_1a}"

  }
}


resource "aws_subnet" "sub_lb_pub_1b" {
  vpc_id                  = "${aws_vpc.vpcs.id}"
  cidr_block              = "${var.sub_lb_pub_1b}"
  availability_zone       = "${var.az2}"

  tags  {
    Name = "${var.name_sub_lb_pub_1b}"

  }
}

#######