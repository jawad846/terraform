resource "aws_db_instance" "dr_tst_web_db" {    //create rds instance
  allocated_storage       = "${var.rds_storage}"
  storage_type            = "gp2"
  engine                  = "${var.rds_engine}"
  engine_version          = "${var.engine_version}"
  instance_class          = "${var.rds_instanceclass}"
  identifier              = "dr-db-web-orcl"
  name                    = "WEBORCL"
  username                = "${var.rds_username}"
  password                = "${var.rds_password}"
  multi_az                = false
  availability_zone       = "${var.dbinstance_az}"  //AZ for the master
  db_subnet_group_name    = "${aws_db_subnet_group.dr_db_sub_grp.id}"
  parameter_group_name    = "${aws_db_parameter_group.dr_db_pg.name}"
  publicly_accessible     = false
  vpc_security_group_ids  = ["${aws_security_group.sg_rds.id}"]
  storage_encrypted       = true
  backup_retention_period = "30"
  backup_window           = "18:00-18:30"   //time in UTC
  deletion_protection     = true
  enabled_cloudwatch_logs_exports = ["alert","audit","listener","trace"]
  tags = {
    Name = "db_example_web_oracle"
    
  }
}

resource "aws_db_subnet_group" "dr_db_sub_grp" {
  name = "webdr_subnet_grp"
  subnet_ids = ["${aws_subnet.dr_sub_rds_1a.id}","${aws_subnet.dr_sub_rds_1b.id}"]

  tags = {
    Name = "proddb_subnet_grp"
    
  }
}

resource "aws_db_parameter_group" "dr_db_pg" {
  name        = "webdr-pg-web"
  family      = "${var.db_pg_family}"
  description = "DB Parameter Group for Proddb Database"

  tags = {
    Name = "webdr_pg_web"
    
  }
}