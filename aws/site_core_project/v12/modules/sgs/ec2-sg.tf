#################
#Security Groups#
#################
resource "aws_security_group" "ec2_security_groups" {
  name   = var.name_security_groups
  vpc_id = var.vpc_id

  ingress = var.security_groups_ingress
  egress  = var.security_groups_egress

  tags = {

  }
}