#################
#Security Groups#
#################
variable "vpc_id" {

}

variable "name_security_groups" {

}

// variable "security_groups_egress" {

// }

// variable "security_groups_ingress" {

// }

#Security Groups Ingress Rule#
variable "ec2_sgs_ingress_from_port" {
    // type = list(string)
}

variable "ec2_sgs_ingress_to_port" {
    // type = list(string)
}

variable "ec2_sgs_ingress_protocol" {
    // type = list(string)
}


variable "ec2_sgs_ingress_cidr_blocks" {
    // type = list(string)
}

variable "ec2_sgs_ingress_description" {
    // type = list(string)
}


#Security Groups Egress Rule#
variable "ec2_sgs_egress_from_port" {
    // type = list(string)
}

variable "ec2_sgs_egress_to_port" {
    // type = list(string)
}

variable "ec2_sgs_egress_protocol" {
    // type = list(string)   
}


variable "ec2_sgs_egress_cidr_blocks" {
    // type = list(string)
}

variable "ec2_sgs_egress_description" {
    // type = list(string)
}