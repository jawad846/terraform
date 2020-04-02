data "aws_vpc" "accepter01" {
  provider = aws.test_vpc
  id       = var.accepter01_vpc_id
}

data "aws_caller_identity" "accepter01_account_id" {
  provider = aws.test_vpc
}

resource "aws_vpc_peering_connection" "SCP-D1-IRL-T1-VPC-IRL" {
  peer_owner_id = data.aws_caller_identity.accepter01_account_id.account_id
  peer_vpc_id   = data.aws_vpc.accepter01.id
  vpc_id        = aws_vpc.vpcs.id
  peer_region   = var.aws_region
  auto_accept   = false

  tags = {
    Name        = "SCP-D1-IRL-T1-VPC-IRL"
    NAME        = "SCP-D1-IRL-T1-VPC-IRL"
    VPC         = "REQUESTER"
    ENVIRONMENT = "DEV"
    REGION      = "EU-WEST-1"
  }
}

resource "aws_vpc_peering_connection_accepter" "T1-VPC-IRL-SCP-D1-IRL" {
  provider                  = aws.test_vpc
  vpc_peering_connection_id = aws_vpc_peering_connection.SCP-D1-IRL-T1-VPC-IRL.id
  auto_accept               = true

  tags = {
    Name        = "T1-VPC-IRL-SCP-D1-IRL"
    NAME        = "T1-VPC-IRL-SCP-D1-IRL"
    VPC         = "ACCEPTER"
    ENVIRONMENT = "DEV"
    REGION      = "EU-WEST-1"
  }
}

resource "aws_route" "accepter01_1" {
  provider                  = aws.test_vpc
  route_table_id            = var.rt_accepter01_1
  destination_cidr_block    = aws_vpc.vpcs.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.SCP-D1-IRL-T1-VPC-IRL.id
}

resource "aws_route" "accepter01_2" {
  provider                  = aws.test_vpc
  route_table_id            = var.rt_accepter01_2
  destination_cidr_block    = aws_vpc.vpcs.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.SCP-D1-IRL-T1-VPC-IRL.id
}

#########################################################################################

data "aws_vpc" "accepter02" {
  provider = aws.mgmt_vpc
  id       = var.accepter02_vpc_id
}

data "aws_caller_identity" "accepter02_account_id" {
  provider = aws.mgmt_vpc
}

resource "aws_vpc_peering_connection" "SCP-D1-IRL-M1-VPC-IRL" {
  peer_owner_id = data.aws_caller_identity.accepter02_account_id.account_id
  peer_vpc_id   = data.aws_vpc.accepter02.id
  vpc_id        = aws_vpc.vpcs.id
  peer_region   = var.aws_region
  auto_accept   = false

  tags = {
    Name        = "SCP-D1-IRL-M1-VPC-IRL"
    NAME        = "SCP-D1-IRL-M1-VPC-IRL"
    VPC         = "REQUESTER"
    ENVIRONMENT = "DEV"
    REGION      = "EU-WEST-1"
  }
}

resource "aws_vpc_peering_connection_accepter" "M1-VPC-IRL-SCP-D1-IRL" {
  provider                  = aws.mgmt_vpc
  vpc_peering_connection_id = aws_vpc_peering_connection.SCP-D1-IRL-M1-VPC-IRL.id
  auto_accept               = true

  tags = {
    Name        = "M1-VPC-IRL-SCP-D1-IRL"
    NAME        = "M1-VPC-IRL-SCP-D1-IRL"
    VPC         = "ACCEPTER"
    ENVIRONMENT = "DEV"
    REGION      = "EU-WEST-1"
  }
}

resource "aws_route" "accepter02_1" {
  provider                  = aws.mgmt_vpc
  route_table_id            = var.rt_accepter02
  destination_cidr_block    = aws_vpc.vpcs.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.SCP-D1-IRL-M1-VPC-IRL.id
}

