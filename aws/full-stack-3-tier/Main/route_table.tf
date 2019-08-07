# Define the public route table
resource "aws_route_table" "rt-public-ss" {
    vpc_id = "${aws_vpc.shared.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  route {
    cidr_block = "10.200.0.0/16"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.example_main.id}"
  }

  tags {
    Name = "rt_website_pub"
    
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "public-rt-1" {
  subnet_id = "${aws_subnet.sub_pub_1a.id}"
  route_table_id = "${aws_route_table.rt-public-ss.id}"
}

resource "aws_route_table_association" "public-rt-2" {
  subnet_id = "${aws_subnet.sub_pub_1b.id}"
  route_table_id = "${aws_route_table.rt-public-ss.id}"
}

resource "aws_route_table_association" "pvt03" {
  subnet_id = "${aws_subnet.sub_web_1a.id}"
  route_table_id = "${aws_route_table.rt-public-ss.id}"
}

resource "aws_route_table_association" "pvt04" {
  subnet_id = "${aws_subnet.sub_web_1b.id}"
  route_table_id = "${aws_route_table.rt-public-ss.id}"
}

# Define the private route table
resource "aws_route_table" "rt-private-ss" {
  vpc_id = "${aws_vpc.shared.id}"
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat.id}"
  }
  route {
    cidr_block = "10.200.0.0/16"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.example_main.id}"
  }
  tags {
    Name = "rt_website_pvt"
    
  }
}

# Assign the route table to the private Subnet
resource "aws_route_table_association" "pvt01" {
  subnet_id = "${aws_subnet.sub_app_1a.id}"
  route_table_id = "${aws_route_table.rt-private-ss.id}"
}

resource "aws_route_table_association" "pvt02" {
  subnet_id = "${aws_subnet.sub_app_1b.id}"
  route_table_id = "${aws_route_table.rt-private-ss.id}"
}

resource "aws_route_table_association" "pvt05" {
  subnet_id = "${aws_subnet.sub_rds_1a.id}"
  route_table_id = "${aws_route_table.rt-private-ss.id}"
}

resource "aws_route_table_association" "pvt06" {
  subnet_id = "${aws_subnet.sub_rds_1b.id}"
  route_table_id = "${aws_route_table.rt-private-ss.id}"
}