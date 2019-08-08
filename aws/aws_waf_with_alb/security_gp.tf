resource "aws_security_group" "sg_alb_api_test_mobile_expo2020dubai" {
  name        = "${var.name_sg}"
  description = "SG for ALB alb_api_test_mobile_expo2020dubai"
  vpc_id      = "${var.aws_vpc_id}"

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    description     = "Created by Jawad"
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags = {
    Name = "${var.name_sg}"
  }
}
