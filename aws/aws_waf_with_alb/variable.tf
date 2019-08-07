variable "profile" {
  description   = "Define Profile Here"
}

variable "key_access" {
  description = "Define Access Key"
}

variable "key_secret" {
  description = "Define Secret Key"
}


variable "region" {
  description   = "Define Region Here"
}

variable "aws_vpc_id" {
  description = "Define VPC ID"
}

variable "arn_certificate" {
  description = "Define https certificate arn"
}


####################################################

variable "subnet_1" {
  description = "define"
}

variable "subnet_2" {
  description = "Define"
}



variable "name_alb" {
  description = "Define ALB Name"
}

variable "tag_name_alb" {
  description = "define"
}

variable "name_alb_tg_1" {
  description = "Define ALB TG"
}

variable "name_alb_tg_2" {
  description = "Define ALB TG"
}

variable "alb_tg_1_instance" {
  description = ""
}

variable "alb_tg_2_instance" {
  description = ""
}

variable "name_sg" {
  description = "define"
}

###########################################################

variable "name_wafregional_acl" {
  description   = "Define"
}

variable "metric_wafregional_acl" {
  description = "define"
}


variable "name_wafregional_rule" {
  description   = "Define"
}

variable "metric_wafregional_rule" {
  description     = "define"
}

variable "name_ipset" {
  description = "define"
}

variable "name_sqlinj" {
  description = "define"
}

variable "name_xssset" {
  description = "Define"
}

variable "name_bytems" {
  description = "Define"
}

