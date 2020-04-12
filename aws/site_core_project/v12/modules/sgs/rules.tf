#################
#Security Groups#
#################
#Security Groups Ingress Rule#
resource "aws_security_group_rule" "ingress_rules" {
  type              = "ingress"
  from_port         = var.ec2_sgs_ingress_from_port
  to_port           = var.ec2_sgs_ingress_to_port
  protocol          = var.ec2_sgs_ingress_protocol
  cidr_blocks       = var.ec2_sgs_ingress_cidr_blocks
  description       = var.ec2_sgs_ingress_description
  security_group_id = aws_security_group.ec2_security_groups.id
}

#Security Groups Egress Rule#
resource "aws_security_group_rule" "egress_rules" {
  type              = "egress"
  from_port         = var.ec2_sgs_egress_from_port
  to_port           = var.ec2_sgs_egress_to_port
  protocol          = var.ec2_sgs_egress_protocol
  cidr_blocks       = var.ec2_sgs_egress_cidr_blocks
  description       = var.ec2_sgs_egress_description
  security_group_id = aws_security_group.ec2_security_groups.id
}