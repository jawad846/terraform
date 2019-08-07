#-- to Apply
# terraform apply --var-file="var.tfvars" --var profile="<profile>"

#Credentials
variable "profile" {
  description = "AWS Profile"
  default     = "default"
}
variable "region" {
  description = "AWS region"
  default     = "default"
}

variable "dr_region" {
  description = "Region of the DR Site"
}

##############################################
#VPC 

variable "vpc_id_primary" {
  description = "primary VPC ID"
}

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

#######################################
#Customer Gateway
variable "customer_gw" {
  description = "Define customer Gateway"
}

variable "customer_gw01" {
  description = "To Tata DC"
}

#########################################
#App Server
variable "app_ami" {
  description = "Instance AMI ID"
}

variable "app_instance_type" {
  description = "Instance type of App Server"
}
variable "app_pvt_ip_1a" {
  description = "Private Private of the App Server 1a"
  default = "172.28.4.99"
}

variable "app_pvt_ip_1b" {
  description = "Private IP of the App Server 1b"
  default = "172.28.5.99"
}

variable "key_pair" {
  description = "define instance key pair"
}


#########################################
#NFS Server
variable "nfs_ami" {
  description = "Instance AMI ID"
}
variable "nfs_pvt_ip" {
  description = "Private IP of the NFS Storage Server"
  default = "172.28.4.156"
}

variable "nfs_instance_type" {
  description = "Instance type of NFS Storage"
}

variable "snap-nfs-server" {
  description = "Snapshot ID of the NFS Storage EBS Volume"
}

#########################################
#Bastion Host
variable "bastion_instance_ami" {
  description = "AMI of Bastion Host"
}

variable "bastion_instance_type" {
  description = "instance type of bastion host"
}

####################################
#Web Server
variable "web_instance_type" {
  description = "Instance type of Web Server"
}

variable "web_ami" {
  description = "Instance Web 1b AMI ID"
}


#########################################
# RDS Database

variable "rds_storage" {
  description = "Database storage size"
}

variable "rds_engine" {
  description = "Database engine type"
}

variable "engine_version" {
  description = "Database Engine Version value"
}

variable "rds_instanceclass" {
  description = "RDS Instance class"
}

variable "rds_username" {
  description = "RDS Username"
}

variable "rds_password" {
  description = "RDS Password"
}

variable "dbinstance_az" {
  description = "Main AZ for the DB instance"
}

variable "db_pg_family" {
  description = "DB Parameter group family"
}


#################################################################################
# Web load balancer variables
variable "https_certificate_arn" {
  description = "Certificate for HTTPS"
}
#################################################################################
#CloudWatch
variable "sns_topic" {
  description = "SNS Topic for CloudWatch Alarm Creation"
}

variable "ec2_action" {
  description = "EC2 Action in Cloudwatch Alarm Creation for System Check"
}

####################################################
#Role

variable "policy_ec2readonlyaccess" {
  description = "Policy for the EC2 Instance Profile role"
}

variable "policy_cloudwatchfull" {
  description = "Policy for the EC2 Instance Profile role"
}

variable "policy_ssmfull" {
  description = "Policy for the EC2 Instance Profile role"
}

variable "policy_ssmec2" {
  description = "Policy for the EC2 Instance Profile role"
}

variable "policy_asg" {
  description = "Allows EC2 Auto Scaling to publish to SNS and SQS notification targets"
}

variable "policy_sns" {
  description = "Allow SNS for AutoScaling lifecycle Hook"
}


variable "policy_lambda_basic" {
  description = "Policy for Lambda Basic Execution"
}



###########################################################
#VPC-peering

variable "dr_vpc_id" {
  description = "DR Site VPC Id"
}

variable "dr_db_username" {
  description = "Username of the DR DB"
}


variable "dr_db_password" {
  description = "Password of the DR DB"
}

