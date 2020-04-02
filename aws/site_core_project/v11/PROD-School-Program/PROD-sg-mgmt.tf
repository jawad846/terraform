resource "aws_security_group" "sg_pam_citrix_mgmt" {
    name                      = "sg_scp_pam_citrix_mgmt"
    description               = "SG for pam_citrix_mgmt"
    vpc_id                    = "${aws_vpc.vpcs.id}"

#443
ingress {
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["10.0.110.0/24"]
  description = "HTTPS Access from Citrix"
  }

#80
ingress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["10.0.110.0/24"]
  description = "HTTPS Access from Citrix"
  }

#22

ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["10.0.110.0/24"]
  description = "SSH Access from Citrix"
  }

ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  description = "PAM Server"
  }

ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  description = "PAM Server"
  }

ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  description = "PAM Server"
  }

#3389

ingress {
  from_port   = 3389
  to_port     = 3389
  protocol    = "tcp"
  cidr_blocks = ["10.0.110.0/24"]
  description = "RDP Access from Citrix"
  }

ingress {
  from_port   = 3389
  to_port     = 3389
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  description = "PAM Server"
  }

ingress {
  from_port   = 3389
  to_port     = 3389
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  description = "PAM Server"
  }

ingress {
  from_port   = 3389
  to_port     = 3389
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  description = "PAM Server"
  }

#49152-65535

ingress {
  from_port   = 49152
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 49152
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 49152
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }

  #23
ingress {
  from_port   = 23
  to_port     = 23
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 23
  to_port     = 23
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 23
  to_port     = 23
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }

  #1433
ingress {
  from_port   = 1433
  to_port     = 1433
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 1433
  to_port     = 1433
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 1433
  to_port     = 1433
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }


#636
ingress {
  from_port   = 636
  to_port     = 636
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 636
  to_port     = 636
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 636
  to_port     = 636
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }

#1521
ingress {
  from_port   = 1521
  to_port     = 1521
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 1521
  to_port     = 1521
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 1521
  to_port     = 1521
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }

#389
ingress {
  from_port   = 389
  to_port     = 389
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 389
  to_port     = 389
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 389
  to_port     = 389
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }

#88
ingress {
  from_port   = 88
  to_port     = 88
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 88
  to_port     = 88
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 88
  to_port     = 88
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }

#445

ingress {
  from_port   = 445
  to_port     = 445
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 445
  to_port     = 445
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 445
  to_port     = 445
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }

#135

ingress {
  from_port   = 135
  to_port     = 135
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 135
  to_port     = 135
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 135
  to_port     = 135
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }


#5000

ingress {
  from_port   = 5000
  to_port     = 5000
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 5000
  to_port     = 5000
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 5000
  to_port     = 5000
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }

#464

ingress {
  from_port   = 464
  to_port     = 464
  protocol    = "tcp"
  cidr_blocks = ["10.2.82.9/32"]
  }

ingress {
  from_port   = 464
  to_port     = 464
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.2/32"]
  }

ingress {
  from_port   = 464
  to_port     = 464
  protocol    = "tcp"
  cidr_blocks = ["10.0.116.3/32"]
  }

  ################################

  

egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["${aws_vpc.vpcs.cidr_block}"]
  }


  tags  {
    Name = "sg_prod_scp_pam_citrix_mgmt"
    
  }
}