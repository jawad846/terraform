# Define our VPC
resource "aws_vpc" "shared" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "Website_VPC"
  }
}
# Define the public subnet 1
resource "aws_subnet" "sub_pub_1a" {
  vpc_id = "${aws_vpc.shared.id}"
  cidr_block = "${var.sub_public_1a}"
  availability_zone = "ap-south-1a"

  tags {
    Name = "sb_website_pub_1a"
  }
}

# Define the public subnet 2
resource "aws_subnet" "sub_pub_1b" {
  vpc_id = "${aws_vpc.shared.id}"
  cidr_block = "${var.sub_public_1b}"
  availability_zone = "ap-south-1b"

  tags {
    Name = "sb_website_pub_1b"
  }
}

# Define the private subnet 01
resource "aws_subnet" "sub_app_1a" {
  vpc_id = "${aws_vpc.shared.id}"
  cidr_block = "${var.sub_app_1a}"
  availability_zone = "ap-south-1a"

  tags {
    Name = "sb_website_pvt_app_1a"
  }
}

# Define the private subnet 02
resource "aws_subnet" "sub_app_1b" {
  vpc_id = "${aws_vpc.shared.id}"
  cidr_block = "${var.sub_app_1b}"
  availability_zone = "ap-south-1b"

  tags {
    Name = "sb_website_pvt_app_1b"
  }
}

# Define the private subnet 03
resource "aws_subnet" "sub_web_1a" {
  vpc_id = "${aws_vpc.shared.id}"
  cidr_block = "${var.sub_web_1a}"
  availability_zone = "ap-south-1a"

  tags {
    Name = "sb_website_web_1a"
  }
}

# Define the private subnet 04
resource "aws_subnet" "sub_web_1b" {
  vpc_id = "${aws_vpc.shared.id}"
  cidr_block = "${var.sub_web_1b}"
  availability_zone = "ap-south-1b"

  tags {
    Name = "sb_website_web_1b"
  }
}

# Define the private subnet 05
resource "aws_subnet" "sub_rds_1a" {
  vpc_id = "${aws_vpc.shared.id}"
  cidr_block = "${var.sub_rds_1a}"
  availability_zone = "ap-south-1a"

  tags {
    Name = "sb_website_pvt_rds_1a"
  }
}

# Define the private subnet 06
resource "aws_subnet" "sub_rds_1b" {
  vpc_id = "${aws_vpc.shared.id}"
  cidr_block = "${var.sub_rds_1b}"
  availability_zone = "ap-south-1b"

  tags {
    Name = "sb_website_pvt_rds_1b"
  }
}
