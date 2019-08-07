resource "aws_db_instance" "tst_web_db" {    //create rds instance
  allocated_storage       = "${var.rds_storage}"
  storage_type            = "gp2"
  engine                  = "${var.rds_engine}"
  engine_version          = "${var.engine_version}"
  instance_class          = "${var.rds_instanceclass}"
  identifier              = "db-web-orcl"
  name                    = "WEBORCL"
  username                = "${var.rds_username}"
  password                = "${var.rds_password}"
  multi_az                = true
  #availability_zone       = "${var.dbinstance_az}" 
  db_subnet_group_name    = "${aws_db_subnet_group.db_sub_grp.id}"
  parameter_group_name    = "${aws_db_parameter_group.db_pg.name}"
  publicly_accessible     = false
  vpc_security_group_ids  = ["${aws_security_group.sg_rds.id}"]
  storage_encrypted       = true
  backup_retention_period = "30"
  backup_window           = "18:00-18:30"   //time in UTC
  deletion_protection     = true
  enabled_cloudwatch_logs_exports = ["alert","audit","listener","trace"]
}

resource "aws_db_subnet_group" "db_sub_grp" {
  name = "proddb_subnet_grp"
  subnet_ids = ["${aws_subnet.sub_rds_1a.id}","${aws_subnet.sub_rds_1b.id}"]

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