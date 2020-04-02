# resource "aws_db_instance" "rds_scp_content_delivery_db" {
#     allocated_storage       = 100
#     max_allocated_storage   = 300
#     storage_type            = "gp2"
#     engine                  = "sqlserver-se"
#     engine_version          = "14.00.3223.3.v1"
#     instance_class          = "db.m5.2xlarge"
#     identifier              = "${var.idtfr_content_delivery_db}"
#     # name                    = "${var.host_content_delivery_db}"
#     username                = "${var.username_content_delivery_db}"
#     password                = "${var.password_content_delivery_db}"
#     license_model           = "license-included"
#     multi_az                = true
#     db_subnet_group_name    = "${aws_db_subnet_group.prd_scp_sub_grp.name}"
#     parameter_group_name    = "${aws_db_parameter_group.prd_scp_db_pg.name}"
#     option_group_name       = "${aws_db_option_group.prd_scp_cddb_optn_gp.name}"
#     publicly_accessible     = false
#     vpc_security_group_ids  = ["${aws_security_group.sg_content_delivery_db.id}"]
#     storage_encrypted       = true
#     backup_retention_period = "30"
#     backup_window           = "18:00-18:30"
#     deletion_protection     = false

#     tags = {
#     Name             = "${var.name_content_delivery_db}"
#     NAME             = "${var.name_content_delivery_db}"
#     ENVIRONMENT      = "PRD"
#     OS               = "WINDOWS"
#     PROJECT_NAME     = "SCHOOL_PROGRAM"
#     APPLICATION_NAME = "SCHOOL_PROGRAM"
#     APPLICATION_TYPE = "AS"
#     REGION           = "eu-west-1"
#     EX_OWNER         = "SIDDIQI"
#     ET_OWNER         = "SERGIO"
#   }
# }

resource "aws_db_subnet_group" "prd_scp_sub_grp" {
  name       = "prd-scp-sub-grp"
  subnet_ids = ["${aws_subnet.sub_db_pvt_1a.id}","${aws_subnet.sub_db_pvt_1b.id}"]

  tags = {
    Name             = "${var.name_content_delivery_db}"
    NAME             = "${var.name_content_delivery_db}"
    ENVIRONMENT      = "PRD"
    OS               = "WINDOWS"
    PROJECT_NAME     = "SCHOOL_PROGRAM"
    APPLICATION_NAME = "SCHOOL_PROGRAM"
    APPLICATION_TYPE = "AS"
    REGION           = "eu-west-1"
    EX_OWNER         = "SIDDIQI"
    ET_OWNER         = "SERGIO"
  }
}

resource "aws_db_parameter_group" "prd_scp_db_pg" {
  name        = "prd-scp-cd-db-pg"
  family      = "sqlserver-se-14.0"
  description = "DB Parameter Group for prd Database"

  tags = {
    Name             = "${var.name_content_delivery_db}"
    NAME             = "${var.name_content_delivery_db}"
    ENVIRONMENT      = "PRD"
    OS               = "WINDOWS"
    PROJECT_NAME     = "SCHOOL_PROGRAM"
    APPLICATION_NAME = "SCHOOL_PROGRAM"
    APPLICATION_TYPE = "AS"
    REGION           = "eu-west-1"
    EX_OWNER         = "SIDDIQI"
    ET_OWNER         = "SERGIO"
  }
  parameter {
        name      = "contained database authentication"
        value     = "1"
    }
}

resource "aws_db_option_group" "prd_scp_cddb_optn_gp" {
  name                     = "prd-scp-cddb-optn-gp"
  option_group_description = "prd_scp_cddb_option_gp"
  engine_name              = "sqlserver-se"
  major_engine_version     = "14.00"

  option {
    option_name = "SQLSERVER_BACKUP_RESTORE"

    option_settings {
      name  = "IAM_ROLE_ARN"
      value = "${aws_iam_role.s3sqlbackup.arn}"
    }
  }
}

#################################

resource "aws_db_instance" "rds_scp_content_management_db" {
  allocated_storage       = 100
  max_allocated_storage   = 300
  storage_type            = "gp2"
  engine                  = "sqlserver-se"
  engine_version          = "14.00.3223.3.v1"
  instance_class          = "db.m5.2xlarge"
  identifier              = "${var.idtfr_content_management_db}"
  # name                    = "${var.host_content_management_db}"
  username                = "${var.username_content_management_db}"
  password                = "${var.password_content_management_db}"
  license_model           = "license-included"
  availability_zone       = "eu-west-1a"
  multi_az                = true
  db_subnet_group_name    = "${aws_db_subnet_group.prd_scp_cm_sub_grp.name}"
  parameter_group_name    = "${aws_db_parameter_group.prd_scp_cm_db_pg.name}"
  option_group_name       = "${aws_db_option_group.prd_scp_cmdb_optn_gp.name}"
  publicly_accessible     = false
  vpc_security_group_ids  = ["${aws_security_group.sg_content_management_db.id}"]
  storage_encrypted       = true
  backup_retention_period = "30"
  backup_window           = "18:00-18:30"
  deletion_protection     = false

  tags  {
    Name             = "${var.name_content_management_db}"
    NAME             = "${var.name_content_management_db}"

  }
}

resource "aws_db_subnet_group" "prd_scp_cm_sub_grp" {
  name       = "prd-scp-cm-sub-grp"
  subnet_ids = ["${aws_subnet.sub_db_pvt_1a.id}","${aws_subnet.sub_db_pvt_1b.id}"]

  tags = {
    Name             = "${var.name_content_management_db}"
    NAME             = "${var.name_content_management_db}"
    
  }
}

resource "aws_db_parameter_group" "prd_scp_cm_db_pg" {
  name        = "prd-scp-cm-db-pg"
  family      = "sqlserver-se-14.0"
  description = "DB Parameter Group for prd Database"

  tags = {
    Name             = "${var.name_content_management_db}"
    NAME             = "${var.name_content_management_db}"
    
  }
  parameter {
        name      = "contained database authentication"
        value     = "1"
    }
}

resource "aws_db_option_group" "prd_scp_cmdb_optn_gp" {
  name                     = "prd-scp-cmdb-optn-gp"
  option_group_description = "prd_scp_cmdb_option_gp"
  engine_name              = "sqlserver-se"
  major_engine_version     = "14.00"

  option {
    option_name = "SQLSERVER_BACKUP_RESTORE"

    option_settings {
      name  = "IAM_ROLE_ARN"
      value = "${aws_iam_role.s3sqlbackup.arn}"
    }
  }
}

