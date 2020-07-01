
locals {
  sg_sp_rules = [
    { type = ingress, from_port = 80, to_port = 80, protocol = tcp, cidr_blocks = 1.2.3.4/32, description = test },
    { type = ingress, from_port = 443, to_port = 443, protocol = tcp, cidr_blocks = 1.2.3.4/32, description = test },
    { type = ingress, from_port = 22, to_port = 22, protocol = tcp, cidr_blocks = 1.2.3.4/32, description = test },
  ]
}


resource "aws_security_group_rule" "ingress_rules" {
    count = length(var.ingress_rules) > 0 ? length(var.ingress_rules) : 0
    type              = "ingress"
    from_port         = var.rules[var.ingress_rules[count.index]][0]
    to_port           = var.rules[var.ingress_rules[count.index]][1]
    protocol          = var.rules[var.ingress_rules[count.index]][2]
    cidr_blocks       = var.ingress_cidr_blocks
    description       = var.rules[var.ingress_rules[count.index]][3]
    security_group_id = aws_security_group.default.id
}







# Security group rules with "cidr_blocks", but without "ipv6_cidr_blocks", "source_security_group_id" and "self"



resource "aws_security_group_rule" "ingress_with_cidr_blocks" {
count = length(var.ingress_with_cidr_blocks) > 0 ? length(var.ingress_with_cidr_blocks) : 0
security_group_id = aws_security_group.default.id
type              = "ingress"
cidr_blocks = split(",", lookup(var.ingress_with_cidr_blocks[count.index], "cidr_blocks", ""))
description  = lookup(var.ingress_with_cidr_blocks[count.index], "description", "Ingress Rule")
from_port = lookup(var.ingress_with_cidr_blocks[count.index], "from_port", var.rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")][0])
to_port   = lookup(var.ingress_with_cidr_blocks[count.index], "to_port", var.rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")][1])
protocol  = lookup(var.ingress_with_cidr_blocks[count.index], "protocol", var.rules[lookup(var.ingress_with_cidr_blocks[count.index], "rule", "_")][2])
}