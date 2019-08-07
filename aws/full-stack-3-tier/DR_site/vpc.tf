# Define our VPC
resource "aws_vpc" "dr_shared" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "tst_Website_DR_VPC"
    
  }
}
# Define the public subnet 01
resource "aws_subnet" "dr_sub_pub_1a" {
  vpc_id = "${aws_vpc.dr_shared.id}"
  cidr_block = "${var.sub_public_1a}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "sb_prod_pub_DR_1a"
    
  }
}

# Define the public subnet 02
resource "aws_subnet" "dr_sub_pub_1b" {
  vpc_id = "${aws_vpc.dr_shared.id}"
  cidr_block = "${var.sub_public_1b}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name = "sb_prod_pub_DR_1b"
    
  }
}


# Define the private subnet 01
resource "aws_subnet" "dr_sub_app_1a" {
  vpc_id = "${aws_vpc.dr_shared.id}"
  cidr_block = "${var.sub_app_1a}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "sb_pvt_app_DR_1a"
    
  }
}

# Define the private subnet 02
resource "aws_subnet" "dr_sub_app_1b" {
  vpc_id = "${aws_vpc.dr_shared.id}"
  cidr_block = "${var.sub_app_1b}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name = "sb_pvt_app_DR_1b"
    
  }
}


# Define the private subnet 03 and 04
resource "aws_subnet" "dr_sub_web_1a" {
  vpc_id = "${aws_vpc.dr_shared.id}"
  cidr_block = "${var.sub_web_1a}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "sb_pvt_web_DR_1a"
    
  }
}

resource "aws_subnet" "dr_sub_web_1b" {
  vpc_id = "${aws_vpc.dr_shared.id}"
  cidr_block = "${var.sub_web_1b}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name = "sb_pvt_web_DR_1b"
    
  }
}

# Define the private subnet 05
resource "aws_subnet" "dr_sub_rds_1a" {
  vpc_id = "${aws_vpc.dr_shared.id}"
  cidr_block = "${var.sub_rds_1a}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "sb_pvt_rds_DR_1a"
    
  }
}

resource "aws_subnet" "dr_sub_rds_1b" {
  vpc_id = "${aws_vpc.dr_shared.id}"
  cidr_block = "${var.sub_rds_1b}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name = "sb_pvt_rds_DR_1b"
    
  }
}

