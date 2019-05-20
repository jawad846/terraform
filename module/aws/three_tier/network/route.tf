#Route Table
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.prod.id}"

  tags {
    Name = "igw-prod"
  }
}

resource "aws_route_table" "rt_public" {
  vpc_id = "${aws_vpc.prod.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "rt_public"
  }
}

resource "aws_route_table" "rt_pvt" {
  vpc_id = "${aws_vpc.prod.id}"

  tags {
    Name = "rt_pvt"
  }
}

resource "aws_route_table_association" "public" 
{
  count          = "${length(var.stagging_worker_subnet_cidr)}"
  subnet_id      = "${element(aws_subnet.stagging_worker_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.rt_public.id}"
}

resource "aws_route_table_association" "pvt" 
{
  count          = "${length(var.prod_worker_subnet_cidr)}"
  subnet_id      = "${element(aws_subnet.prod_worker_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.rt_pvt.id}"
}

resource "aws_route_table_association" "prod_pvt" 
{
  count          = "${length(var.prod_master_subnet_cidr)}"
  subnet_id      = "${element(aws_subnet.prod_master_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.rt_pvt.id}"
}