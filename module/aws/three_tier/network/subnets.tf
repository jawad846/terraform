data "aws_availability_zones" "available" {

}

resource "aws_subnet" "prod_master_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = "${aws_vpc.prod.id}"
  cidr_block = "${element(var.prod_master_subnet_cidr, count.index)}"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"

  tags = {
    Name = "master_${element(data.aws_availability_zones.available.names, count.index)}"
  }
}

resource "aws_subnet" "stagging_worker_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = "${aws_vpc.prod.id}"
  cidr_block = "${element(var.stagging_worker_subnet_cidr,count.index)}"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"

  tags = {
    Name = "worker_${element(data.aws_availability_zones.available.names, count.index)}"
  }
}
resource "aws_subnet" "prod_worker_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = "${aws_vpc.prod.id}"
  cidr_block = "${element(var.prod_worker_subnet_cidr,count.index)}"
  availability_zone = "${element(data.aws_availability_zones.available.names, count.index)}"

  tags = {
    Name = "prod_worker_${element(data.aws_availability_zones.available.names, count.index)}"
  }
}