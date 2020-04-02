##################
# RDS DB INSTANCE#
##################
variable "rds_allocated_storage" {

}

variable "rds_max_allocated_storage" {

}

variable "rds_storage_type" {

}

variable "rds_engine" {

}

variable "rds_engine_version" {

}

variable "rds_instance_class" {

}

variable "rds_identifier" {

}

variable "rds_username" {

}


variable "rds_password" {

}

variable "rds_license_model" {

}

variable "rds_availability_zone" {

}

variable "rds_publicly_accessible" {

}

variable "rds_vpc_security_group_ids" {

}

variable "rds_multi_az" {

}

variable "rds_storage_encrypted" {
    type        = bool
    default     = false

}

variable "rds_backup_retention_period" {

}

variable "rds_backup_window" {

}

variable "rds_deletion_protection" {
    type        = bool
    default     = true
}

###################
# RDS SUBNET GROUP#
###################
variable "rds_db_subnet_group_name" {

}

variable "rds_db_subnet_group_subnet_ids" {
    type = list(string)
}

######################
# RDS PARAMETER GROUP#
######################
variable "rds_db_parameter_group_name" {

}

variable "rds_db_parameter_group_family" {

}

variable "rds_db_parameter_group_parameter" {

}

###################
# RDS OPTION GROUP#
###################

variable "rds_db_option_group_name" {

}

variable "rds_db_option_group_option_group_description" {

}


variable "rds_db_option_group_engine_name" {

}

variable "rds_db_option_group_major_engine_version" {

}


variable "rds_db_option_group_iam_role" {

}