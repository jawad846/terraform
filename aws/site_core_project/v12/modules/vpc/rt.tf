##########################
# VPC public route table #
##########################
resource "aws_route_table" "vpc_rt_public" {
  vpc_id = aws_vpc.vpcs.id

  tags = {}
}

# Routes #
resource "aws_route" "vpc_rt_public_route" {
  route_table_id         = aws_route_table.vpc_rt_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_igw.id
}

# Subnet Association #
resource "aws_route_table_association" "rt_pub_01" {
  subnet_id      = aws_subnet.sub_pub_1a.id
  route_table_id = aws_route_table.vpc_rt_public.id
}

resource "aws_route_table_association" "rt_pub_02" {
  subnet_id      = aws_subnet.sub_pub_1b.id
  route_table_id = aws_route_table.vpc_rt_public.id
}

#############################
# VPC LB public route table #
#############################
resource "aws_route_table" "vpc_lb_rt_public" {
  vpc_id = aws_vpc.vpcs.id

  tags = {}
}

# Routes #
resource "aws_route" "vpc_lb_rt_public_route" {
  route_table_id         = aws_route_table.vpc_lb_rt_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_igw.id
}

# Subnet Association #
resource "aws_route_table_association" "rt_lb_pub_01" {
  subnet_id      = aws_subnet.sub_lb_pub_1a.id
  route_table_id = aws_route_table.vpc_lb_rt_public.id
}

resource "aws_route_table_association" "rt_lb_pub_02" {
  subnet_id      = aws_subnet.sub_lb_pub_1b.id
  route_table_id = aws_route_table.vpc_lb_rt_public.id
}

###############################
# VPC APP private route table #
###############################

resource "aws_route_table" "vpc_rt_app_private" {
  vpc_id = aws_vpc.vpcs.id

  tags = {}
}

// # Routes #
// resource "aws_route" "vpc_rt_app_private_route" {
//   route_table_id         = aws_route_table.vpc_rt_app_private.id
//   destination_cidr_block = "0.0.0.0/0"
//   nat_gateway_id         = aws_nat_gateway.vpc_nat_gw.id
// }

# Subnet Association #
resource "aws_route_table_association" "rt_app_pvt_01" {
  subnet_id      = aws_subnet.sub_app_pvt_1a.id
  route_table_id = aws_route_table.vpc_rt_app_private.id
}

resource "aws_route_table_association" "rt_app_pvt_02" {
  subnet_id      = aws_subnet.sub_app_pvt_1b.id
  route_table_id = aws_route_table.vpc_rt_app_private.id
}

#############################
# VPC DB private route table #
#############################

resource "aws_route_table" "vpc_rt_db_private" {
  vpc_id = aws_vpc.vpcs.id

  tags = {}
}

// # Routes #
// resource "aws_route" "vpc_rt_db_private_route" {
//   route_table_id         = aws_route_table.vpc_rt_db_private.id
//   destination_cidr_block = "0.0.0.0/0"
//   nat_gateway_id         = aws_nat_gateway.vpc_nat_gw.id
// }

# Subnet Association #
resource "aws_route_table_association" "rt_db_pvt_01" {
  subnet_id      = aws_subnet.sub_db_pvt_1a.id
  route_table_id = aws_route_table.vpc_rt_db_private.id
}

resource "aws_route_table_association" "rt_db_pvt_02" {
  subnet_id      = aws_subnet.sub_db_pvt_1b.id
  route_table_id = aws_route_table.vpc_rt_db_private.id
}

##############################
# VPC LB private route table #
##############################

resource "aws_route_table" "vpc_rt_lb_private" {
  vpc_id = aws_vpc.vpcs.id

  tags = {}
}

// # Routes #
// resource "aws_route" "vpc_rt_lb_private_route" {
//   route_table_id         = aws_route_table.vpc_rt_lb_private.id
//   destination_cidr_block = "0.0.0.0/0"
//   nat_gateway_id         = aws_nat_gateway.vpc_nat_gw.id
// }

# Subnet Association #
resource "aws_route_table_association" "rt_lb_pvt_01" {
  subnet_id      = aws_subnet.sub_lb_pvt_1a.id
  route_table_id = aws_route_table.vpc_rt_lb_private.id
}

resource "aws_route_table_association" "rt_lb_pvt_02" {
  subnet_id      = aws_subnet.sub_lb_pvt_1b.id
  route_table_id = aws_route_table.vpc_rt_lb_private.id
}

