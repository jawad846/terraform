resource "aws_instance" "bastion_host" {
  ami                         = "${var.bastion_instance_ami}"
  instance_type               = "${var.bastion_instance_type}"
  subnet_id                   = "${aws_subnet.sub_pub_1a.id}"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.sg_bastion.id}"]
  key_name                    = "${var.key_pair}"
  disable_api_termination     = true
  tags = {
    Name = "tst_bastion_host"
    donotstop = "donotstop"
  }
  volume_tags {
    Name = "tst_bastion_host"
  }
}

resource "aws_eip" "bastion" {
  vpc      = true
  instance = "${aws_instance.bastion_host.id}"
  tags {
    Name  = "eip_bastion"
  }
}

