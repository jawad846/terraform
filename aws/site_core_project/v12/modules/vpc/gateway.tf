#######################
# VPC Internet Gateway#
#######################
resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.vpcs.id

  tags = {}
}

##################
# VPC NAT Gateway#
##################

// #Assign Elastic IP#
// resource "aws_eip" "vpc_nat_eip" {
//   vpc = true

//   tags = {}
// }

// resource "aws_nat_gateway" "vpc_nat_gw" {
//   allocation_id = aws_eip.vpc_nat_eip.id
//   subnet_id     = aws_subnet.sub_pub_1a.id

//   tags = {}
// }

##############################
# VPC Virtual Private Gateway#
##############################

resource "aws_vpn_gateway" "vpc_vgw" {
  tags = {}
}

#Attach Virtual Private Gateway#
resource "aws_vpn_gateway_attachment" "vpc_attach_vgw" {
  vpc_id         = aws_vpc.vpcs.id
  vpn_gateway_id = aws_vpn_gateway.vpc_vgw.id
}

