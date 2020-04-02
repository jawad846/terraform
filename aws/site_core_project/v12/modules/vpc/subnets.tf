#####################
# VPC Public Subnet #
#####################
resource "aws_subnet" "sub_pub_1a" {
  vpc_id            = aws_vpc.vpcs.id
  cidr_block        = var.sub_cidr_block_pub[0]
  availability_zone = var.aws_az[0]

  tags = {}
}

resource "aws_subnet" "sub_pub_1b" {
  vpc_id            = aws_vpc.vpcs.id
  cidr_block        = var.sub_cidr_block_pub[1]
  availability_zone = var.aws_az[1]

  tags = {}
}

########################
# VPC LB Public Subnet #
########################
resource "aws_subnet" "sub_lb_pub_1a" {
  vpc_id            = aws_vpc.vpcs.id
  cidr_block        = var.sub_cidr_block_lb_pub[0]
  availability_zone = var.aws_az[0]

  tags = {}
}

resource "aws_subnet" "sub_lb_pub_1b" {
  vpc_id            = aws_vpc.vpcs.id
  cidr_block        = var.sub_cidr_block_lb_pub[1]
  availability_zone = var.aws_az[1]

  tags = {}
}

##########################
# VPC APP Private Subnet #
##########################
resource "aws_subnet" "sub_app_pvt_1a" {
  vpc_id            = aws_vpc.vpcs.id
  cidr_block        = var.sub_cidr_block_app_pvt[0]
  availability_zone = var.aws_az[0]

  tags = {}
}

resource "aws_subnet" "sub_app_pvt_1b" {
  vpc_id            = aws_vpc.vpcs.id
  cidr_block        = var.sub_cidr_block_app_pvt[1]
  availability_zone = var.aws_az[1]

  tags = {}
}

#########################
# VPC DB Private Subnet #
#########################
resource "aws_subnet" "sub_db_pvt_1a" {
  vpc_id            = aws_vpc.vpcs.id
  cidr_block        = var.sub_cidr_block_db_pvt[0]
  availability_zone = var.aws_az[0]

  tags = {}
}

resource "aws_subnet" "sub_db_pvt_1b" {
  vpc_id            = aws_vpc.vpcs.id
  cidr_block        = var.sub_cidr_block_db_pvt[1]
  availability_zone = var.aws_az[1]

  tags = {}
}

#########################
# VPC LB Private Subnet #
#########################
resource "aws_subnet" "sub_lb_pvt_1a" {
  vpc_id            = aws_vpc.vpcs.id
  cidr_block        = var.sub_cidr_block_lb_pvt[0]
  availability_zone = var.aws_az[0]

  tags = {}
}

resource "aws_subnet" "sub_lb_pvt_1b" {
  vpc_id            = aws_vpc.vpcs.id
  cidr_block        = var.sub_cidr_block_lb_pvt[1]
  availability_zone = var.aws_az[1]

  tags = {}
}

