# Define the public route table
resource "aws_route_table" "dr_rt-public-ss" {
    vpc_id = "${aws_vpc.dr_shared.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  route {
    cidr_block = "172.28.0.0/16"
    vpc_peering_connection_id = "${data.aws_vpc_peering_connection.peering.id}"
  }
  tags {
    Name = "rt_dr_website_pub"
    
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "dr_public-rt-1" {
  subnet_id = "${aws_subnet.dr_sub_pub_1a.id}"
  route_table_id = "${aws_route_table.dr_rt-public-ss.id}"
}
# Assign the route table to the public Subnet
resource "aws_route_table_association" "dr_public-rt-2" {
  subnet_id = "${aws_subnet.dr_sub_pub_1b.id}"
  route_table_id = "${aws_route_table.dr_rt-public-ss.id}"
}

# Assign the route table to the web subnet
resource "aws_route_table_association" "dr_pvt03" {
  subnet_id = "${aws_subnet.dr_sub_web_1a.id}"
  route_table_id = "${aws_route_table.dr_rt-public-ss.id}"
}

resource "aws_route_table_association" "dr_pvt04" {
 subnet_id = "${aws_subnet.dr_sub_web_1b.id}"
 route_table_id = "${aws_route_table.dr_rt-public-ss.id}"
}

# Define the private route table
resource "aws_route_table" "dr_rt-private-ss" {
  vpc_id = "${aws_vpc.dr_shared.id}"
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat.id}"
  }
  route {
    cidr_block = "172.28.0.0/16"
    vpc_peering_connection_id = "${data.aws_vpc_peering_connection.peering.id}"
  }
  tags {
    Name = "rt_dr_website_pvt"
    
  }
}

# Assign the route table to the private Subnet
resource "aws_route_table_association" "dr_pvt01" {
  subnet_id = "${aws_subnet.dr_sub_app_1a.id}"
  route_table_id = "${aws_route_table.dr_rt-private-ss.id}"
}

resource "aws_route_table_association" "dr_pvt02" {
  subnet_id = "${aws_subnet.dr_sub_app_1b.id}"
  route_table_id = "${aws_route_table.dr_rt-private-ss.id}"
}


resource "aws_route_table_association" "dr_pvt05" {
  subnet_id = "${aws_subnet.dr_sub_rds_1a.id}"
  route_table_id = "${aws_route_table.dr_rt-private-ss.id}"
}

resource "aws_route_table_association" "dr_pvt06" {
  subnet_id = "${aws_subnet.dr_sub_rds_1b.id}"
  route_table_id = "${aws_route_table.dr_rt-private-ss.id}"
}


##############################
#VPC Peering

data "aws_vpc_peering_connection" "peering" {
  peer_vpc_id     = "${aws_vpc.dr_shared.id}"
  peer_cidr_block = "${var.vpc_cidr}"
}