locals {
  routes = [
    // TVPC <-> VPC1
    { dst = "0.0.0.0/0", attch = module.tvpc.attch.id, rtbl = module.vpc1.rtbl.id },
    { dst = module.vpc1.vpc.cidr_block, attch = module.vpc1.attch.id, rtbl = module.tvpc.rtbl.id },

    // TVPC <-> VPC2
    { dst = "0.0.0.0/0", attch = module.tvpc.attch.id, rtbl = module.vpc2.rtbl.id },
    { dst = module.vpc2.vpc.cidr_block, attch = module.vpc2.attch.id, rtbl = module.tvpc.rtbl.id },

    // TVPC <-> VPC3
    { dst = "0.0.0.0/0", attch = module.tvpc.attch.id, rtbl = module.vpc3.rtbl.id },
    { dst = module.vpc3.vpc.cidr_block, attch = module.vpc3.attch.id, rtbl = module.tvpc.rtbl.id },

    // VPC1 <-> VPC2
    { dst = module.vpc1.vpc.cidr_block, attch = module.vpc1.attch.id, rtbl = module.vpc2.rtbl.id },
    { dst = module.vpc2.vpc.cidr_block, attch = module.vpc2.attch.id, rtbl = module.vpc1.rtbl.id },
  ]
}

resource "aws_ec2_transit_gateway_route" "routes" {
  count                          = length(local.routes)
  destination_cidr_block         = local.routes[count.index].dst
  transit_gateway_attachment_id  = local.routes[count.index].attch
  transit_gateway_route_table_id = local.routes[count.index].rtbl
}