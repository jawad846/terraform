#Credentials
variable "profile" {
  description = "AWS Profile"
  default     = "default"
}
variable "region" {
  description = "AWS region"
  default     = "default"
}

variable "main_region" {
  description = "Define the Primary Region"
}
########################################
#VPC 
variable "vpc_cidr" {
  description = "CIDR for the VPC"
}

variable "sub_public_1a" {
  description = "Prod public subnet"
}

variable "sub_public_1b" {
  description = "Prod public subnet"
}

variable "sub_web_1a" {
  description = "Web server subnet"
}

variable "sub_web_1b" {
  description = "Web server subnet"
}

variable "sub_app_1a" {
  description = "Application subnet"
}

variable "sub_app_1b" {
  description = "Application subnet"
}

variable "sub_rds_1a" {
  description = "RDS subnet"
}

variable "sub_rds_1b" {
  description = "RDS subnet"
}

######################################
#App Server
variable "app_ami" {
  description = "Instance AMI ID"
}

variable "app_instance_type" {
  description = "Instance type of App Server"
}
variable "app_pvt_ip_1a" {
  description = "Private Private of the App Server 1a"
  default = "10.200.3.99"
}

########################################
# #Bastion Host
# variable "bastion_instance_ami" {
#   description = "AMI of Bastion Host"
# }

# variable "bastion_instance_type" {
#   description = "instance type of bastion host"
# }

####################################
#Web Server
variable "web_instance_type" {
  description = "Instance type of Web Server"
}

variable "web_ami" {
  description = "Instance AMI ID"
}

variable "key_pair" {
  description = "define Instance Key Pair"
}

########################################
# Web load balancer variables
variable "https_certificate_arn" {
  description = "Certificate for HTTPS"
}


########################################################

variable "db_pg_family" {
  description = ""
}

variable "rds_storage" {
  description = ""
}

variable "dbinstance_az" {
  description = ""
}

variable "rds_password" {
  description = ""
}

variable "engine_version" {
  description = ""
}

variable "rds_instanceclass" {
  description = ""
}

variable "rds_engine" {
  description = ""
}

variable "rds_username" {
  description = ""
}


##############################################

variable "sns_topic" {
  description = ""
}

variable "ec2_action" {
  description = "" 
}

###############################
#Policy

variable "policy_ec2readonlyaccess" {
  description = ""
}

variable "policy_cloudwatchfull" {
  description = ""
}

variable "policy_ssmfull" {
  description = ""
}

variable "policy_ssmec2" {
  description = ""
}










