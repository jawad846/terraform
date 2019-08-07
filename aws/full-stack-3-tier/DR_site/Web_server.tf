resource "aws_instance" "web_server" {
  ami                         = "${var.web_ami}"
  instance_type               = "${var.web_instance_type}"
  subnet_id                   = "${aws_subnet.dr_sub_web_1a.id}"
  associate_public_ip_address = false
  vpc_security_group_ids      = ["${aws_security_group.sg_web.id}"]
  key_name                    = "${var.key_pair}"
  disable_api_termination     = "true"

  tags = {
    Name = "web_server"
    
  }
  volume_tags {
    Name = "ebs_web_server"
    
  }
}