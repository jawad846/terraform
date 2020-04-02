
resource "aws_db_instance" "rds_database" {
  allocated_storage       = var.rds_allocated_storage
  max_allocated_storage   = var.rds_max_allocated_storage
  storage_type            = var.rds_storage_type
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  instance_class          = var.rds_instance_class
  identifier              = var.rds_identifier
  username                = var.rds_username
  password                = var.rds_password
  license_model           = var.rds_license_model
  availability_zone       = var.rds_availability_zone
  publicly_accessible     = var.rds_publicly_accessible
  vpc_security_group_ids  = var.rds_vpc_security_group_ids
  multi_az                = var.rds_multi_az
  db_subnet_group_name    = aws_db_subnet_group.rds_db_subnet_group.id
  parameter_group_name    = aws_db_parameter_group.rds_db_parameter_group.id
  option_group_name       = aws_db_option_group.rds_db_option_group.id
  storage_encrypted       = var.rds_storage_encrypted
  backup_retention_period = var.rds_backup_retention_period
  backup_window           = var.rds_backup_window
  deletion_protection     = var.rds_deletion_protection

  tags = {

  }
}

resource "aws_db_subnet_group" "rds_db_subnet_group" {
  name       = var.rds_db_subnet_group_name
  subnet_ids = var.rds_db_subnet_group_subnet_ids

  tags = {
  }
}

resource "aws_db_parameter_group" "rds_db_parameter_group" {
  name        = var.rds_db_parameter_group_name
  family      = var.rds_db_parameter_group_family

  tags = {

  }
  parameter = var.rds_db_parameter_group_parameter
}

resource "aws_db_option_group" "rds_db_option_group" {
  name                     = var.rds_db_option_group_name
  option_group_description = var.rds_db_option_group_option_group_description
  engine_name              = var.rds_db_option_group_engine_name
  major_engine_version     = var.rds_db_option_group_major_engine_version

  option {
    option_name = "SQLSERVER_BACKUP_RESTORE"

    option_settings {
      name  = "IAM_ROLE_ARN"
      value = var.rds_db_option_group_iam_role
    }
  }
}

