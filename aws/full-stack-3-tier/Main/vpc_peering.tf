data "aws_caller_identity" "example_dr" {
  provider = "aws.dr_sing"
}

# Requester's side of the connection.
resource "aws_vpc_peering_connection" "example_main" {
  vpc_id        = "${aws_vpc.shared.id}"
  peer_vpc_id   = "${data.aws_vpc.dr_vpc.id}"
  peer_owner_id = "${data.aws_caller_identity.example_dr.account_id}"
  peer_region   = "${var.dr_region}"
   #auto_accept   = true

  tags = {
    Side = "Requester"
    Name = "web_mumbai"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "example_dr" {
  provider                  = "aws.example_dr_sing"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.example_main.id}"
   auto_accept               = true

  tags = {
    Side = "Accepter"
    Name = "dr_web_sing"
  }
}

#Enable Remote VPC DNS Resolution
resource "aws_vpc_peering_connection_options" "requester" {
  vpc_peering_connection_id = "${aws_vpc_peering_connection_accepter.example_dr.id}"

  requester {
    allow_remote_vpc_dns_resolution = false
    allow_classic_link_to_remote_vpc = false
    allow_vpc_to_remote_classic_link = false
  }
}

resource "aws_vpc_peering_connection_options" "accepter" {
  provider = "aws.example_dr_sing"
  vpc_peering_connection_id = "${aws_vpc_peering_connection_accepter.example_dr.id}"

  accepter {
    allow_remote_vpc_dns_resolution = false
    allow_classic_link_to_remote_vpc = false
    allow_vpc_to_remote_classic_link = false
  }
}

#Fetch Route Table
data "aws_route_tables" "example_dr" {
  provider = "aws.example_dr_sing"
  vpc_id = "${data.aws_vpc.dr_vpc.id}"
}

data "aws_route_tables" "example_main" {
  vpc_id = "${aws_vpc.shared.id}"
}

# #Updating Route Table
# resource "aws_route" "example_main" {
#   count = "${length(data.aws_route_tables.example_main.ids)}"
#   route_table_id            = "${data.aws_route_tables.example_main.ids[count.index]}"
#   destination_cidr_block    = "${data.aws_vpc.dr_vpc.cidr_block}"
#   vpc_peering_connection_id = "${aws_vpc_peering_connection.example_main.id}"
# }   

# resource "aws_route" "example_dr" {
#   provider = "aws.example_dr_sing"
#   count = "${length(data.aws_route_tables.example_dr.ids)}"
#   route_table_id            = "${data.aws_route_tables.example_dr.ids[count.index]}"
#   destination_cidr_block    = "${aws_vpc.shared.cidr_block}"
#   vpc_peering_connection_id = "${aws_vpc_peering_connection.example_main.id}"
# }  
