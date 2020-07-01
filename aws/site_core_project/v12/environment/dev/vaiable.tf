variable "aws_profile" {
  default = "aws_self"
}

variable "aws_region" {
  default = "ap-south-1"
}


variable "acm_certificate_arn" {
  default = "fnmlsknmdflksnmmdsgnmslkfdg"
}


########################################
#################
#Security Groups#
#################

variable "sg_ec2_sgs_solr_master_ingress" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "1.2.3.4/32"
          description = "test"
        },
        {
          from_port   = 23
          to_port     = 23
          protocol    = "tcp"
          cidr_block  = "1.2.3.4/32"
          description = "test"
        },
    ]
}

variable "sg_ec2_sgs_solr_master_egress" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_block  = "0.0.0.0/0"
          description = "ALL"
        },
    ]
}