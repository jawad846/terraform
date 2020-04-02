#######################
#EC2 Network Interface#
#######################
variable "ec2_eni_subnet_id" {
    type        = string
}

variable "ec2_eni_security_groups" {
  
}

##############
#EC2 Instance#
##############

variable "ec2_ami" {
  
}

variable "ec2_instance_type" {
  
}


variable "ec2_iam_instance_profile" {
  
}

variable "ec2_key_name" {
  
}


variable "ec2_disable_api_termination" {
    type        = bool
    default     = false
}


variable "ec2_associate_public_ip_address" {
    type        = bool
    default     = false
}

variable "ec2_root_volume_type" {

}

variable "ec2_root_volume_size" {

}

variable "ec2_root_delete_on_termination" {
    type        = bool
    default     = true
}

variable "ec2_ebs_device_name" {

}

variable "ec2_ebs_volume_type" {

}

variable "ec2_ebs_volume_size" {

}

variable "ec2_ebs_delete_on_termination" {
    type        = bool
    default     = true
}

#####################
#EC2 Launch Template#
#####################
variable "ec2_lt_name" {

}

variable "ec2_lt_description" {

}

variable "ec2_lt_image_id" {

}

variable "ec2_lt_instance_type" {

}

variable "ec2_lt_security_group_ids" {

}

variable "ec2_lt_iam_instance_profile" {

}

variable "ec2_lt_user_data" {
    
}