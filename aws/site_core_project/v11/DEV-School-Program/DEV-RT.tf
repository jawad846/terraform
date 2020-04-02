# Define the public route table
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpcs.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name             = var.name_rt_pub
    
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "rt_pub_01" {
  subnet_id      = aws_subnet.sub_pub_1a.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rt_pub_02" {
  subnet_id      = aws_subnet.sub_pub_1b.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rt_pub_03" {
  subnet_id      = aws_subnet.sub_lb_pub_1a.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rt_pub_04" {
  subnet_id      = aws_subnet.sub_lb_pub_1b.id
  route_table_id = aws_route_table.rt_public.id
}

#############################################################
# Define the private route table
resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.vpcs.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = var.transit_id
  }

  route {
    cidr_block                = var.sub_mgmt_01
    vpc_peering_connection_id = aws_vpc_peering_connection.SCP-D1-IRL-M1-VPC-IRL.id
  }

  route {
    cidr_block                = var.sub_mgmt_02
    vpc_peering_connection_id = aws_vpc_peering_connection.SCP-D1-IRL-M1-VPC-IRL.id
  }

  route {
    cidr_block                = var.sub_test_01
    vpc_peering_connection_id = aws_vpc_peering_connection.SCP-D1-IRL-T1-VPC-IRL.id
  }

  route {
    cidr_block                = var.sub_test_02
    vpc_peering_connection_id = aws_vpc_peering_connection.SCP-D1-IRL-T1-VPC-IRL.id
  }

  tags = {
    Name             = var.name_rt_pvt
    
  }
}

# Assign the route table to the private Subnet
resource "aws_route_table_association" "rt_pvt_01" {
  subnet_id      = aws_subnet.sub_app_pvt_1a.id
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "rt_pvt_02" {
  subnet_id      = aws_subnet.sub_app_pvt_1b.id
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "rt_pvt_03" {
  subnet_id      = aws_subnet.sub_db_pvt_1a.id
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "rt_pvt_04" {
  subnet_id      = aws_subnet.sub_db_pvt_1b.id
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "rt_pvt_05" {
  subnet_id      = aws_subnet.sub_lb_pvt_1a.id
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "rt_pvt_06" {
  subnet_id      = aws_subnet.sub_lb_pvt_1b.id
  route_table_id = aws_route_table.rt_private.id
}

############
resource "aws_vpn_gateway_route_propagation" "rt_scp_private" {
  vpn_gateway_id = aws_vpn_gateway.vpc_vgw.id
  route_table_id = aws_route_table.rt_private.id
}

