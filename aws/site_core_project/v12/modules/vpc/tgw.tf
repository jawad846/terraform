// ###################
// # TGW Attachment #
// ###################
// resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_to_tgw_attachment" {
//   subnet_ids                                      = var.vpc_tgw_subnet_ids
//   transit_gateway_id                              = var.vpc_transit_gateway_id
//   vpc_id                                          = aws_vpc.vpcs.id
//   transit_gateway_default_route_table_association = false
//   transit_gateway_default_route_table_propagation = false
//   tags = {}
// }
// #####################
// # VPC Routes to TGW #
// #####################
// resource "aws_route" "vpc_routes_to_tgw" {
//   route_table_id         = 
//   destination_cidr_block = 
//   transit_gateway_id     =
// }
