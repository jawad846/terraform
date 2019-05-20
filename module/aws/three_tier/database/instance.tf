resource "aws_db_instance" "web_db" {    //create rds instance
  count                   = "${var.count}"
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
  db_subnet_group_name    = "${aws_db_subnet_group.db_sub_grp.id}"
  parameter_group_name    = "${aws_db_parameter_group.db_pg.name}"
  publicly_accessible     = false
  vpc_security_group_ids  = ["${var.sg_rds}"]
  storage_encrypted       = true
  backup_retention_period = "30"
  backup_window           = "18:00-18:30"   //time in UTC
  deletion_protection     = true
  enabled_cloudwatch_logs_exports = ["alert","audit","listener","trace"]
}

