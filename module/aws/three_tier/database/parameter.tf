resource "aws_db_subnet_group" "db_sub_grp" {
  name = "proddb_subnet_grp"
  subnet_ids = ["${var.db_sub_goup}"]

  tags = {
    Name = "proddb_subnet_grp"
  }
}

resource "aws_db_parameter_group" "db_pg" {
  name        = "proddb-pg-web"
  family      = "${var.db_pg_family}"
  description = "DB Parameter Group for Proddb Database"

  tags = {
    Name = "proddb_pg_web"
  }
}