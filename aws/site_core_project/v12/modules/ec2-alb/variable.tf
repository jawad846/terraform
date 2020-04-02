##############################
#EC2 Application Load Balance#
##############################
variable "ec2_alb_name" {

}
variable "ec2_alb_face" {

}
variable "ec2_alb_load_balancer_type" {

}
variable "ec2_alb_security_groups" {

}
variable "ec2_alb_subnets" {
    type = list(string)
}
variable "ec2_alb_enable_deletion_protection" {
    type        = bool
    default     = false
}


#######################################
#EC2 Application Load Balance Listener#
#######################################

variable "lst_ec2_alb_port" {

}
variable "lst_ec2_alb_protocol" {

}
variable "lst_ec2_alb_ssl_policy" {

}
variable "lst_ec2_alb_certificate_arn" {

}
variable "lst_ec2_alb_default_action_type" {
    default = "forward"
}


############################################
#EC2 Application Load Balance HTTP Listener#
############################################

variable "lst_ec2_alb_http_protocol" {

}
variable "lst_ec2_alb_http_port" {

}

variable "lst_ec2_alb_http_default_action_type" {
    default = "forward"
}

############################################
#EC2 Application Load Balance HTTP Redirect#
############################################

variable "lst_ec2_alb_http_https_protocol" {

}
variable "lst_ec2_alb_http_https_port" {

}

###########################################
#EC2 Application Load Balance Target Group#
###########################################
variable "ec2_tgps_name" {

}
variable "ec2_tgps_port" {

}
variable "ec2_tgps_protocol" {

}
variable "ec2_tgps_target_type" {

}
variable "ec2_tgps_vpc_id" {

}
variable "ec2_tgps_health_check_protocol" {

}
variable "ec2_tgps_health_check_path" {

}
variable "ec2_tgps_health_check_port" {

}
variable "ec2_tgps_stickiness_enabled" {
    type        = bool
}
variable "ec2_tgps_stickiness_type" {

}
variable "ec2_tgps_stickiness_cookie_duration" {

}

variable "ec2_tgps_attach_target_id" {

}
variable "ec2_tgps_attach_port" {
    
}
