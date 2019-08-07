provider "aws" {
  alias = "example_dr_sing"
  region  = "${var.dr_region}"
  profile = "${var.profile}"
}

data "aws_db_instance" "dr_rds_orcl" {
    provider = "aws.example_dr_sing"
    db_instance_identifier = "dr-db-web-orcl"
}

data "aws_vpc" "dr_vpc" {
    provider = "aws.example_dr_sing"
    id = "${var.dr_vpc_id}"
}