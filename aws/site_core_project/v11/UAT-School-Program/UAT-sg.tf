resource "aws_security_group" "sg_alb_solr_scp" {
    name                      = "sg_${var.alb_solr_scp}"
    vpc_id                    = "${aws_vpc.vpcs.id}"

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_vpc.vpcs.cidr_block}"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags  {
    Name                    = "sg_${var.alb_solr_scp}"

  }
}


################

resource "aws_security_group" "sg_ext_alb_scp_cm" {
    name                      = "sg_${var.ext_alb_scp_cm}"
    vpc_id                    = "${aws_vpc.vpcs.id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["5.195.224.67/32"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["5.195.226.1/32"]
  } 

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["49.204.92.218/32"]
  }

  #
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["5.195.224.67/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["5.195.226.1/32"]
  } 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["49.204.92.218/32"]
  }  


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags  {
    Name                    = "sg_${var.ext_alb_scp_cm}"

  }
}


################

resource "aws_security_group" "sg_ext_alb_scp_cd" {
    name                      = "sg_${var.ext_alb_scp_cd}"
    vpc_id                    = "${aws_vpc.vpcs.id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["5.195.224.67/32"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["5.195.226.1/32"]
  } 


  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["49.204.92.218/32"]
  } 

  #
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["5.195.224.67/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["5.195.226.1/32"]
  } 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["49.204.92.218/32"]
  } 


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags  {
    Name                    = "sg_${var.ext_alb_scp_cd}"

  }
}

###################


resource "aws_security_group" "sg_content_delivery" {
    name                      = "${var.sg_name_content_delivery}"
    vpc_id                    = "${aws_vpc.vpcs.id}"

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_vpc.vpcs.cidr_block}"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags  {
    Name                    = "${var.sg_name_content_delivery}"
    
  }
}


#####
resource "aws_security_group" "sg_solr_master" {
    name                      = "${var.sg_name_solr_master}"
    vpc_id                    = "${aws_vpc.vpcs.id}"

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_vpc.vpcs.cidr_block}"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags  {
    Name                    = "${var.sg_name_solr_master}"

  }
}

######

resource "aws_security_group" "sg_solr_slave_01" {
    name                      = "${var.sg_name_solr_slave_01}"
    vpc_id                    = "${aws_vpc.vpcs.id}"

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_vpc.vpcs.cidr_block}"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags  {
    Name                    = "${var.sg_name_solr_slave_01}"

  }
}

######

resource "aws_security_group" "sg_solr_slave_02" {
    name                      = "${var.sg_name_solr_slave_02}"
    vpc_id                    = "${aws_vpc.vpcs.id}"

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_vpc.vpcs.cidr_block}"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags {
    Name                    = "${var.sg_name_solr_slave_02}"

  }
}

######

resource "aws_security_group" "sg_content_management_processing" {
    name                      = "${var.sg_name_content_management_processing}"
    vpc_id                    = "${aws_vpc.vpcs.id}"

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_vpc.vpcs.cidr_block}"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags  {
    Name                    = "${var.sg_name_content_management_processing}"

  }
}


######
resource "aws_security_group" "sg_content_delivery_db" {
    name                      = "${var.sg_name_content_delivery_db}"
    vpc_id                    = "${aws_vpc.vpcs.id}"

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_vpc.vpcs.cidr_block}"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags  {
    Name                    = "${var.sg_name_content_delivery_db}"

  }
}

######
resource "aws_security_group" "sg_content_management_db" {
    name                      = "${var.sg_name_content_management_db}"
    vpc_id                    = "${aws_vpc.vpcs.id}"

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_vpc.vpcs.cidr_block}"]
  }


  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }
  tags  {
    Name                    = "${var.sg_name_content_management_db}"

  }
}

