# Define the internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpcs.id

  tags = {
    Name             = var.name_igw
   
  }
}

#Assign Elastic IP
resource "aws_eip" "eip_nat" {
  vpc = true

  tags = {
    Name             = var.name_nat_eip
   
  }
}

#Define NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.sub_pub_1a.id

  tags = {
    Name             = var.name_nat_gw
   
  }
}

#VGW
resource "aws_vpn_gateway" "vpc_vgw" {
  tags = {
    Name             = var.name_vgw
    
  }
}

#Attach Virtual Private Gateway
resource "aws_vpn_gateway_attachment" "vpc_attach_vgw" {
  vpc_id         = aws_vpc.vpcs.id
  vpn_gateway_id = aws_vpn_gateway.vpc_vgw.id
}

#Enable Route Propagation

resource "aws_vpn_gateway_route_propagation" "vpc_vgw_prop_pvt" {
  vpn_gateway_id = aws_vpn_gateway.vpc_vgw.id
  route_table_id = aws_route_table.rt_private.id
}

