#Transit Gateway Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "uat_tgw_attch" {
  subnet_ids         = ["${aws_subnet.sub_app_pvt_1a.id}","${aws_subnet.sub_app_pvt_1b.id}"]
  transit_gateway_id = "${var.transit_id}"
  vpc_id             = "${aws_vpc.vpcs.id}"

 tags  {
    Name                    = "${var.name_tgw_acceter}"

  }
}
