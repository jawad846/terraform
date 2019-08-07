#Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.dr_shared.id}"

  tags {
    Name = "igw_website_dr_vpc"
    
  }
}

#Assign Elastic IP
resource "aws_eip" "nat" {
  vpc      = true
}

#Define NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.dr_sub_pub_1a.id}"

  tags {
    Name = "nat_websit_dr_vpc"
    
  }
}